import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../shared/providers/health_record_provider.dart';
import '../../../shared/providers/language_provider.dart';
import '../../../shared/providers/patient_provider.dart';
import '../../../shared/widgets/direct_text_updater.dart';
import '../../../shared/widgets/language_toggle.dart';
import '../../../shared/widgets/voice_input_button.dart';

class PatientDetailScreen extends ConsumerStatefulWidget {
  final String patientId;

  const PatientDetailScreen({
    super.key,
    required this.patientId,
  });

  @override
  ConsumerState<PatientDetailScreen> createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends ConsumerState<PatientDetailScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _villageController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  String _selectedGender = 'female';
  String _selectedCategory = 'other';
  bool _isPregnant = false;
  
  DateTime? _previousAppointmentDate;
  DateTime? _nextAppointmentDate;
  
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // We'll initialize the controllers in didChangeDependencies
    // to ensure we have access to the providers
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeControllers();
  }
  
  void _initializeControllers() {
    final patients = ref.read(patientProvider);
    final patient = patients.firstWhere(
      (p) => p.id == widget.patientId,
      orElse: () => throw Exception('Patient not found'),
    );
    
    _nameController.text = patient.name;
    _ageController.text = patient.age.toString();
    _phoneController.text = patient.phone;
    _addressController.text = patient.address;
    _villageController.text = patient.village;
    _descriptionController.text = patient.description ?? '';
    
    _selectedGender = patient.gender;
    _selectedCategory = patient.category;
    _isPregnant = patient.isPregnant;
    
    _previousAppointmentDate = patient.previousAppointment;
    _nextAppointmentDate = patient.nextAppointment;
  }

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
    final patients = ref.watch(patientProvider);
    
    // Find the patient by ID
    final patient = patients.firstWhere(
      (p) => p.id == widget.patientId,
      orElse: () => throw Exception('Patient not found'),
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.patientDetails),
        actions: [
          const LanguageToggle(),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(_isEditing ? Icons.close : Icons.edit),
            onPressed: () {
              setState(() {
                if (_isEditing) {
                  // Cancel editing mode without saving
                  _isEditing = false;
                  // Reset controllers to original values
                  _initializeControllers();
                } else {
                  // Enter edit mode
                  _isEditing = true;
                }
              });
            },
            tooltip: _isEditing ? texts.cancel : texts.editPatient,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Badge
            _buildCategoryBadge(context, patient.category, texts),
            
            const SizedBox(height: 12),
            
            // Patient Info Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          child: Icon(
                            patient.gender == 'female' 
                                ? Icons.female 
                                : patient.gender == 'male'
                                    ? Icons.male
                                    : Icons.person,
                            size: 30,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _isEditing
                                ? _buildEditableField(
                                    controller: _nameController,
                                    hint: texts.fullName,
                                  )
                                : Text(
                                    patient.name,
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              const SizedBox(height: 4),
                              _isEditing 
                                ? Row(
                                    children: [
                                      Expanded(
                                        child: _buildEditableField(
                                          controller: _ageController,
                                          hint: texts.age,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      _buildGenderDropdown(texts),
                                    ],
                                  )
                                : Text(
                                    '${texts.age}: ${patient.age} • ${patient.gender == 'female' ? texts.female : patient.gender == 'male' ? texts.male : texts.other}',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                              const SizedBox(height: 4),
                              _isEditing
                                ? _buildEditableField(
                                    controller: _phoneController,
                                    hint: texts.phoneNumber,
                                    keyboardType: TextInputType.phone,
                                  )
                                : Text(
                                    '${texts.phoneNumber}: ${patient.phone}',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Appointment Cards
            Row(
              children: [
                Expanded(
                  child: _buildAppointmentCard(
                    context,
                    title: texts.previousAppointment,
                    date: patient.previousAppointment,
                    isPrevious: true,
                    icon: Icons.event_busy,
                    iconColor: Colors.amber,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildAppointmentCard(
                    context,
                    title: texts.nextAppointment,
                    date: patient.nextAppointment,
                    isPrevious: false,
                    icon: Icons.event_available,
                    iconColor: Colors.green,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context.push('/patients/${widget.patientId}/add-record'),
                    icon: const Icon(Icons.add),
                    label: Text(texts.addRecord),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => context.push('/appointments/schedule/${widget.patientId}'),
                    icon: const Icon(Icons.schedule),
                    label: Text(texts.schedule),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Description Section
            if (patient.description != null && patient.description!.isNotEmpty || _isEditing) ...[
              Text(
                texts.description,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _isEditing
                    ? Column(
                        children: [
                          TextField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              hintText: texts.description,
                              border: InputBorder.none,
                            ),
                            maxLines: 4,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: VoiceInputButton(
                              onVoiceInput: (text) {
                                DirectTextUpdater.updateText(
                                  controller: _descriptionController,
                                  text: text,
                                  setState: setState,
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : Text(patient.description ?? ''),
                ),
              ),
              const SizedBox(height: 24),
            ],
            
            // Health Records Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  texts.healthRecords,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: () => context.push('/patients/${widget.patientId}/add-record'),
                  tooltip: texts.addRecord,
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Display health records
            _buildHealthRecordsList(context),
            
            const SizedBox(height: 24),
            
            // More Patient Details Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      texts.patientDetails,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _isEditing
                      ? _buildEditableDetailRow(context, texts.address, _addressController)
                      : _buildDetailRow(context, texts.address, patient.address),
                    
                    _isEditing
                      ? _buildEditableDetailRow(context, texts.village, _villageController)
                      : _buildDetailRow(context, texts.village, patient.village),
                    
                    // Emergency contact field removed
                    
                    if (patient.category == 'pregnant')
                      _isEditing
                        ? _buildPregnancyToggleRow(context, texts)
                        : _buildDetailRow(context, texts.pregnancyStatus, 
                            patient.isPregnant ? texts.isPregnant : texts.notPregnant),
                  ],
                ),
              ),
            ),
            
            // Save Button when editing
            if (_isEditing) ...[
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    _savePatientData();
                    setState(() {
                      _isEditing = false;
                    });
                  },
                  icon: const Icon(Icons.save),
                  label: Text(
                    texts.saveChanges,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Add bottom padding for better spacing
              const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryBadge(BuildContext context, String category, AppTexts texts) {
    final Map<String, IconData> categoryIcons = {
      'pregnant': Icons.pregnant_woman,
      'postpartum': Icons.woman,
      'baby': Icons.child_care,
      'other': Icons.person,
    };
    
    final Map<String, String> categoryText = {
      'pregnant': texts.pregnant,
      'postpartum': texts.postPartum,
      'baby': texts.baby,
      'other': texts.other,
    };
    
    final Map<String, Color> categoryColors = {
      'pregnant': Colors.purple,
      'postpartum': Colors.pink,
      'baby': Colors.blue,
      'other': Colors.grey,
    };
    
    return InkWell(
      onTap: _isEditing ? () => _showCategorySelector(context) : null,
      child: Chip(
        avatar: Icon(
          categoryIcons[category] ?? Icons.person,
          color: Colors.white,
          size: 18,
        ),
        backgroundColor: categoryColors[category] ?? Colors.grey,
        label: Text(
          categoryText[category] ?? category,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(
    BuildContext context, {
    required String title,
    required DateTime? date,
    required bool isPrevious,
    required IconData icon,
    required Color iconColor,
  }) {
    final texts = ref.read(textsProvider);
    
    return Card(
      child: InkWell(
        onTap: _isEditing ? () => _selectDate(context, isPrevious) : null,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                date != null
                    ? DateFormat('yyyy-MM-dd').format(date)
                    : texts.selectDate,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildEditableDetailRow(BuildContext context, String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 4),
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          VoiceInputButton(          onVoiceInput: (text) {
            DirectTextUpdater.updateText(
              controller: controller,
              text: text,
              setState: setState,
            );
          },
          ),
        ],
      ),
    );
  }
  
  Widget _buildEditableField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
            keyboardType: keyboardType,
          ),
        ),
        VoiceInputButton(
          onVoiceInput: (text) {
            DirectTextUpdater.updateText(
              controller: controller,
              text: text,
              setState: setState,
            );
          },
        ),
      ],
    );
  }
  
  Widget _buildGenderDropdown(AppTexts texts) {
    return DropdownButton<String>(
      value: _selectedGender,
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _selectedGender = newValue;
          });
        }
      },
      items: <String>['female', 'male', 'other']
          .map<DropdownMenuItem<String>>((String value) {
        String displayText;
        switch (value) {
          case 'female':
            displayText = texts.female;
            break;
          case 'male':
            displayText = texts.male;
            break;
          default:
            displayText = texts.other;
        }
        
        return DropdownMenuItem<String>(
          value: value,
          child: Text(displayText),
        );
      }).toList(),
    );
  }
  
  Widget _buildPregnancyToggleRow(BuildContext context, AppTexts texts) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            texts.pregnancyStatus,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Switch(
            value: _isPregnant,
            onChanged: (value) {
              setState(() {
                _isPregnant = value;
              });
            },
          ),
        ],
      ),
    );
  }
  
  Future<void> _selectDate(BuildContext context, bool isPrevious) async {
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
      setState(() {
        if (isPrevious) {
          _previousAppointmentDate = picked;
        } else {
          _nextAppointmentDate = picked;
        }
      });
    }
  }
  
  void _showCategorySelector(BuildContext context) {
    final texts = ref.read(textsProvider);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(texts.category),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCategoryOption('pregnant', texts.pregnant, Icons.pregnant_woman),
            _buildCategoryOption('postpartum', texts.postPartum, Icons.woman),
            _buildCategoryOption('baby', texts.baby, Icons.child_care),
            _buildCategoryOption('other', texts.other, Icons.person),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCategoryOption(String category, String label, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      selected: _selectedCategory == category,
      onTap: () {
        setState(() {
          _selectedCategory = category;
          
          // If switching away from pregnant category, reset pregnancy status
          if (category != 'pregnant') {
            _isPregnant = false;
          }
        });
        Navigator.of(context).pop();
      },
    );
  }
  
  Widget _buildHealthRecordsList(BuildContext context) {
    final healthRecords = ref.watch(healthRecordProvider);
    final patientRecords = healthRecords.where((record) => record.patientId == widget.patientId).toList();
    
    if (patientRecords.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.medical_services_outlined,
                  size: 48,
                  color: Theme.of(context).colorScheme.outline,
                ),
                const SizedBox(height: 8),
                Text(
                  ref.read(textsProvider).noRecordsAvailable,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () => context.push('/patients/${widget.patientId}/add-record'),
                  icon: const Icon(Icons.add),
                  label: Text(ref.read(textsProvider).addRecord),
                ),
              ],
            ),
          ),
        ),
      );
    }
    
    // Sort records by date (newest first)
    patientRecords.sort((a, b) => b.date.compareTo(a.date));
    
    return Column(
      children: patientRecords.map((record) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              child: Icon(
                Icons.medical_services,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            title: Text(record.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat('yyyy-MM-dd').format(record.date)),
                if (record.notes.isNotEmpty)
                  Text(
                    record.notes,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => _showRecordDetails(context, record),
            ),
          ),
        );
      }).toList(),
    );
  }
  
  void _showRecordDetails(BuildContext context, dynamic record) {
    final texts = ref.read(textsProvider);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(record.title),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${texts.date}: ${DateFormat('yyyy-MM-dd').format(record.date)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                record.notes,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              Text(
                '${texts.created}: ${DateFormat('yyyy-MM-dd HH:mm').format(record.createdAt)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(texts.close),
          ),
        ],
      ),
    );
  }

  void _savePatientData() {
    try {
      // Convert age from text to integer
      int age = int.parse(_ageController.text);
      
      // Update patient using provider
      ref.read(patientProvider.notifier).updatePatient(
        id: widget.patientId,
        name: _nameController.text.trim(),
        age: age,
        gender: _selectedGender,
        phone: _phoneController.text.trim(),
        address: _addressController.text.trim(),
        village: _villageController.text.trim(),
        emergencyContact: null, // Emergency contact field removed
        category: _selectedCategory,
        isPregnant: _selectedCategory == 'pregnant' && _isPregnant,
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        previousAppointment: _previousAppointmentDate,
        nextAppointment: _nextAppointmentDate,
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(ref.read(textsProvider).patientUpdatedSuccessfully),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating patient: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
