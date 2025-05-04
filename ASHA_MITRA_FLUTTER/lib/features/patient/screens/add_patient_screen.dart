import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../shared/providers/language_provider.dart';
import '../../../shared/providers/patient_provider.dart';
import '../../../shared/widgets/direct_text_updater.dart';
import '../../../shared/widgets/voice_input_button.dart';
import '../../../shared/widgets/language_toggle.dart';

// Helper function to convert Bengali numerals to English numerals
String convertBengaliToEnglishNumerals(String input) {
  const bengaliNumerals = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
  
  String output = input;
  for (int i = 0; i < bengaliNumerals.length; i++) {
    output = output.replaceAll(bengaliNumerals[i], i.toString());
  }
  
  debugPrint('🔢 Converting Bengali "$input" to English "$output"');
  return output;
}

// Convert spoken English number words to digits
String convertSpokenNumbersToDigits(String input) {
  // Map of number words to their digit equivalents
  final Map<String, int> numberWords = {
    'zero': 0, 'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5,
    'six': 6, 'seven': 7, 'eight': 8, 'nine': 9, 'ten': 10,
    'eleven': 11, 'twelve': 12, 'thirteen': 13, 'fourteen': 14, 'fifteen': 15,
    'sixteen': 16, 'seventeen': 17, 'eighteen': 18, 'nineteen': 19, 'twenty': 20,
    'thirty': 30, 'forty': 40, 'fifty': 50, 'sixty': 60, 'seventy': 70,
    'eighty': 80, 'ninety': 90, 'hundred': 100, 'thousand': 1000,
  };

  // Also handle common speech recognition variants
  final Map<String, String> speechVariants = {
    'twenty one': 'twentyone',
    'twenty two': 'twentytwo',
    'twenty three': 'twentythree',
    'twenty four': 'twentyfour',
    'twenty five': 'twentyfive',
    'twenty six': 'twentysix',
    'twenty seven': 'twentyseven',
    'twenty eight': 'twentyeight',
    'twenty nine': 'twentynine',
    'thirty one': 'thirtyone',
    // Add more variants as needed
  };
  
  String text = input.toLowerCase();
  
  // First replace speech variants to standardize
  speechVariants.forEach((key, value) {
    text = text.replaceAll(key, value);
  });
  
  // Check if input is already just a number
  if (RegExp(r'^\d+$').hasMatch(text)) {
    return text;
  }
  
  // Replace number words with digits
  numberWords.forEach((word, digit) {
    // Look for the whole word with word boundaries
    final pattern = RegExp(r'\b' + word + r'\b');
    if (pattern.hasMatch(text)) {
      text = text.replaceAll(pattern, digit.toString());
      debugPrint('📝 Replaced "$word" with "$digit" in "$input"');
    }
  });
  
  // Handle compound numbers like "twenty one" -> "21"
  // First look for patterns like "twenty1" that resulted from our replacements
  for (int tens = 2; tens <= 9; tens++) {
    final tensName = ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'][tens - 2];
    for (int units = 1; units <= 9; units++) {
      final compound = tensName + units.toString();
      if (text.contains(compound)) {
        final replacement = (tens * 10 + units).toString();
        text = text.replaceAll(compound, replacement);
        debugPrint('📝 Replaced "$compound" with "$replacement" in "$text"');
      }
    }
  }
  
  // Extract any remaining digits
  final RegExp digitRegExp = RegExp(r'\d+');
  final match = digitRegExp.firstMatch(text);
  if (match != null) {
    return match.group(0)!;
  }
  
  return text; // Return original text if no conversions were possible
}

class AddPatientScreen extends ConsumerStatefulWidget {
  const AddPatientScreen({super.key});

  @override
  ConsumerState<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends ConsumerState<AddPatientScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _villageController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  String _selectedGender = 'female';
  String _selectedCategory = 'other'; // 'pregnant', 'postpartum', 'baby', 'other'
  bool _isLoading = false;
  
  DateTime? _previousAppointmentDate;
  DateTime? _nextAppointmentDate;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _villageController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final texts = ref.watch(textsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.addPatient),
        actions: const [
          LanguageToggle(),
        ],
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            physics: const AlwaysScrollableScrollPhysics(),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Name Field
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: texts.fullName,
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: VoiceInputButton(
                              heroTag: "voice_name_button",
                              onVoiceInput: (String text) {
                                debugPrint('📝 Name field: Voice input received: "$text" (length: ${text.length})');
                                
                                // Use our special utility to ensure the text gets set properly
                                if (mounted && text.isNotEmpty) {
                                  DirectTextUpdater.updateText(
                                    controller: _nameController,
                                    text: text,
                                    setState: setState,
                                  );
                                }
                              },
                              hint: texts.fullName,
                            ),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return texts.pleaseEnterName;
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Age and Gender Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Age Field
                        Expanded(
                          child: TextFormField(
                            controller: _ageController,
                            decoration: InputDecoration(
                              labelText: texts.age,
                              prefixIcon: const Icon(Icons.cake),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: VoiceInputButton(
                                    heroTag: "voice_age_button",
                                    onVoiceInput: (String text) {
                                      debugPrint('📝 Age field: Voice input received: "$text"');
                                      
                                      if (mounted && text.isNotEmpty) {
                                        // Convert bengali numerals if present
                                        String processedText = convertBengaliToEnglishNumerals(text);
                                        
                                        // Try to extract just the number
                                        final RegExp regExp = RegExp(r'\d+');
                                        final match = regExp.firstMatch(processedText);
                                        if (match != null) {
                                          processedText = match.group(0)!;
                                        }
                                        
                                        DirectTextUpdater.updateText(
                                          controller: _ageController,
                                          text: processedText,
                                          setState: setState,
                                        );
                                      }
                                    },
                                    hint: texts.age,
                                  ),
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return texts.pleaseEnterAge;
                              }
                              
                              // Allow string values for age (no integer validation)
                              // Just ensure it's not empty, which we already checked
                              return null;
                            },
                          ),
                        ),
                        
                        const SizedBox(width: 16),
                        
                        // Gender Field
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _selectedGender,
                            decoration: InputDecoration(
                              labelText: texts.gender,
                              prefixIcon: const Icon(Icons.person_outline),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 'female',
                                child: Text(texts.female),
                              ),
                              DropdownMenuItem(
                                value: 'male',
                                child: Text(texts.male),
                              ),
                              DropdownMenuItem(
                                value: 'other',
                                child: Text(texts.other),
                              ),
                            ],
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() {
                                  _selectedGender = value;
                                  
                                  // Reset category to 'other' if switching to male and 
                                  // current category is pregnancy-related
                                  if (value == 'male' && 
                                      (_selectedCategory == 'pregnant' || _selectedCategory == 'postpartum')) {
                                    _selectedCategory = 'other';
                                  }
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Phone Field
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: texts.phoneNumber,
                        prefixIcon: const Icon(Icons.phone),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: VoiceInputButton(
                              heroTag: "voice_phone_button",
                              onVoiceInput: (String text) {
                                debugPrint('📝 Phone field: Voice input received: "$text"');
                                
                                if (mounted && text.isNotEmpty) {
                                  // Convert bengali numerals if present
                                  String processedText = convertBengaliToEnglishNumerals(text);
                                  
                                  // Try to extract just the number
                                  final RegExp regExp = RegExp(r'\d+');
                                  final matches = regExp.allMatches(processedText);
                                  if (matches.isNotEmpty) {
                                    processedText = matches.map((m) => m.group(0)).join();
                                  }
                                  
                                  DirectTextUpdater.updateText(
                                    controller: _phoneController,
                                    text: processedText,
                                    setState: setState,
                                  );
                                }
                              },
                              hint: texts.phoneNumber,
                            ),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return texts.pleaseEnterPhone;
                        }
                        
                        // Convert bengali numerals if present
                        final processedValue = convertBengaliToEnglishNumerals(value);
                        
                        // Only validate that the phone number contains some digits
                        // No specific length requirement
                        if (!RegExp(r'\d').hasMatch(processedValue)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Address Field
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        labelText: texts.address,
                        prefixIcon: const Icon(Icons.home),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: VoiceInputButton(
                              heroTag: "voice_address_button",
                              onVoiceInput: (String text) {
                                debugPrint('📝 Address field: Voice input received: "$text"');
                                
                                if (mounted && text.isNotEmpty) {
                                  DirectTextUpdater.updateText(
                                    controller: _addressController,
                                    text: text,
                                    setState: setState,
                                  );
                                }
                              },
                              hint: texts.address,
                            ),
                          ),
                        ),
                      ),
                      maxLines: 2,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return texts.pleaseEnterAddress;
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Village Field
                    TextFormField(
                      controller: _villageController,
                      decoration: InputDecoration(
                        labelText: texts.village,
                        prefixIcon: const Icon(Icons.location_on),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: VoiceInputButton(
                              heroTag: "voice_village_button",
                              onVoiceInput: (String text) {
                                debugPrint('📝 Village field: Voice input received: "$text"');
                                
                                if (mounted && text.isNotEmpty) {
                                  DirectTextUpdater.updateText(
                                    controller: _villageController,
                                    text: text,
                                    setState: setState,
                                  );
                                }
                              },
                              hint: texts.village,
                            ),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return texts.pleaseEnterVillage;
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    const SizedBox(height: 16),
                    
                    // Patient Category
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              texts.category,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 12),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _buildCategoryButton(context, 'other', 'Other', Icons.person),
                                  const SizedBox(width: 10),
                                  // Show pregnancy and postpartum options only for female or other gender
                                  if (_selectedGender != 'male') ...[
                                    _buildCategoryButton(context, 'pregnant', texts.pregnant, Icons.pregnant_woman),
                                    const SizedBox(width: 10),
                                    _buildCategoryButton(context, 'postpartum', texts.postPartum, Icons.woman),
                                    const SizedBox(width: 10),
                                  ],
                                  _buildCategoryButton(context, 'baby', texts.baby, Icons.child_care),
                                ],
                              ),
                            ),
                            // Pregnancy toggle removed
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Previous Appointment Field
                    InkWell(
                      onTap: () => _selectDate(context, true),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: texts.previousAppointment,
                          prefixIcon: const Icon(Icons.event_busy),
                          suffixIcon: const Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          _previousAppointmentDate != null
                              ? DateFormat('yyyy-MM-dd').format(_previousAppointmentDate!)
                              : '',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Next Appointment Field
                    InkWell(
                      onTap: () => _selectDate(context, false),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: texts.nextAppointment,
                          prefixIcon: const Icon(Icons.event_available),
                          suffixIcon: const Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          _nextAppointmentDate != null
                              ? DateFormat('yyyy-MM-dd').format(_nextAppointmentDate!)
                              : '',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Description Field
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: texts.description,
                        hintText: '${texts.description}...',
                        prefixIcon: const Icon(Icons.description),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: VoiceInputButton(
                              heroTag: "voice_description_button",
                              onVoiceInput: (String text) {
                                debugPrint('📝 Description field: Voice input received: "$text"');
                                
                                if (mounted && text.isNotEmpty) {
                                  DirectTextUpdater.updateText(
                                    controller: _descriptionController,
                                    text: text,
                                    setState: setState,
                                  );
                                }
                              },
                              hint: texts.description,
                            ),
                          ),
                        ),
                      ),
                      maxLines: 3,
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Submit Button
                    ElevatedButton(
                      onPressed: _isLoading ? null : _handleSubmit,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isLoading 
                          ? SizedBox(
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(texts.addPatient),
                    ),
                    
                    // Additional padding at the bottom for better scrolling
                    const SizedBox(height: 32),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String value, String label, IconData icon) {
    final isSelected = _selectedCategory == value;
    final theme = Theme.of(context);
    
    return InkWell(
      onTap: () => setState(() => _selectedCategory = value),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.outline.withOpacity(0.5),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
            )
          ] : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : theme.colorScheme.onSurface,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : theme.colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      debugPrint('❌ Form validation failed');
      return;
    }

    debugPrint('📝 Starting patient submission...');
    setState(() => _isLoading = true);
    
    try {
      // Parse age - ensure we're capturing numeric values correctly
      String ageText = _ageController.text.trim();
      
      // Handle spoken number words in English (e.g., "twenty five" -> "25")
      ageText = convertSpokenNumbersToDigits(ageText);
      
      // Convert Bengali numerals to English if needed
      final bengaliToEnglish = convertBengaliToEnglishNumerals(ageText);
      
      // Extract the age value more robustly
      int age = 0;
      
      // First, try direct conversion with the converted text
      if (bengaliToEnglish.isNotEmpty) {
        try {
          age = int.parse(bengaliToEnglish);
          debugPrint('📝 Age parsed successfully from converted text: $age');
        } catch (_) {
          // If direct conversion fails, try to extract numbers
          final RegExp regExp = RegExp(r'\d+');
          final match = regExp.firstMatch(bengaliToEnglish);
          
          if (match != null) {
            age = int.parse(match.group(0)!);
            debugPrint('📝 Age extracted from converted text using regex: $age');
          }
        }
      }
      
      // If still 0, try with original text as fallback
      if (age == 0 && ageText.isNotEmpty) {
        try {
          age = int.parse(ageText);
          debugPrint('📝 Age parsed from original text: $age');
        } catch (_) {
          // Try to extract any numbers from the original text
          final RegExp regExp = RegExp(r'\d+');
          final match = regExp.firstMatch(ageText);
          
          if (match != null) {
            age = int.parse(match.group(0)!);
            debugPrint('📝 Age extracted from original text using regex: $age');
          }
        }
      }
      
      // Final fallback to ensure we have at least a default value
      if (age <= 0 && ageText.isNotEmpty) {
        // Set to 1 as a minimum value if there's any text input
        age = 1;
        debugPrint('📝 Age defaulted to 1 as fallback since input was non-empty');
      }
      
      debugPrint('📝 Age processing: Original: "$ageText", Converted: "$bengaliToEnglish", Final: $age');
      debugPrint('📝 Patient data: Name: ${_nameController.text}, Age: $age (original: $ageText), Gender: $_selectedGender');
      debugPrint('📝 Phone: ${_phoneController.text}, Address: ${_addressController.text}');
      debugPrint('📝 Village: ${_villageController.text}');
      debugPrint('📝 Category: $_selectedCategory, Previous Appointment: $_previousAppointmentDate');
      debugPrint('📝 Next Appointment: $_nextAppointmentDate, Description: ${_descriptionController.text}');
      
      // Add patient using the provider
      await ref.read(patientProvider.notifier).addPatient(
        name: _nameController.text.trim(),
        age: age,
        gender: _selectedGender,
        phone: _phoneController.text.trim(),
        address: _addressController.text.trim(),
        village: _villageController.text.trim(),
        emergencyContact: null, // Emergency contact field removed
        category: _selectedCategory,
        isPregnant: _selectedCategory == 'pregnant', // Automatically set true for pregnant category
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        previousAppointment: _previousAppointmentDate,
        nextAppointment: _nextAppointmentDate,
      );
      
      debugPrint('✅ Patient added successfully, navigating back...');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(ref.read(textsProvider).patientAddedSuccessfully),
            backgroundColor: Colors.green,
          ),
        );
        context.pop();
      }
    } catch (e) {
      debugPrint('❌ Error adding patient: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error adding patient: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _selectDate(BuildContext context, bool isPrevious) async {
    // Debug to see current date state
    debugPrint('🗓️ _selectDate called for ${isPrevious ? "previous" : "next"} appointment');
    debugPrint('🗓️ Current previous date: $_previousAppointmentDate');
    debugPrint('🗓️ Current next date: $_nextAppointmentDate');
    
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isPrevious 
          ? _previousAppointmentDate ?? DateTime.now().subtract(const Duration(days: 30))
          : _nextAppointmentDate ?? DateTime.now().add(const Duration(days: 30)),
      firstDate: isPrevious 
          ? DateTime(2000)
          : DateTime.now(),
      lastDate: isPrevious 
          ? DateTime.now()
          : DateTime.now().add(const Duration(days: 365 * 2)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white,
              onSurface: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (picked != null) {
      // Debug the picked date
      debugPrint('🗓️ Date picked: ${picked.toIso8601String()}');
      
      setState(() {
        if (isPrevious) {
          _previousAppointmentDate = picked;
          debugPrint('🗓️ Previous appointment set to: ${_previousAppointmentDate?.toIso8601String()}');
        } else {
          _nextAppointmentDate = picked;
          debugPrint('🗓️ Next appointment set to: ${_nextAppointmentDate?.toIso8601String()}');
        }
      });
    } else {
      debugPrint('🗓️ No date selected (dialog canceled)');
    }
  }
}
