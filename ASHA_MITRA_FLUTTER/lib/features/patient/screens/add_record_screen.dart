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

class AddRecordScreen extends ConsumerStatefulWidget {
  final String patientId;

  const AddRecordScreen({
    super.key,
    required this.patientId,
  });

  @override
  ConsumerState<AddRecordScreen> createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends ConsumerState<AddRecordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime _recordDate = DateTime.now();
  bool _isLoading = false;
  
  @override
  void dispose() {
    _titleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final texts = ref.watch(textsProvider);
    final patients = ref.watch(patientProvider);
    
    // Find the patient
    final patient = patients.firstWhere(
      (p) => p.id == widget.patientId,
      orElse: () => throw Exception('Patient not found'),
    );
    
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.addRecord),
        actions: const [
          LanguageToggle(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Patient info card
              Card(
                margin: const EdgeInsets.only(bottom: 24),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patient.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text('${texts.age}: ${patient.age}'),
                      Text('${texts.gender}: ${patient.gender}'),
                      Text('${texts.category}: ${patient.category}'),
                    ],
                  ),
                ),
              ),
              
              // Record date
              InkWell(
                onTap: _selectDate,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Record Date',
                    prefixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    DateFormat('yyyy-MM-dd').format(_recordDate),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Title field
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Record Title',
                  hintText: 'E.g., Checkup, Vaccination, etc.',
                  prefixIcon: const Icon(Icons.title),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: VoiceInputButton(
                        heroTag: "voice_title_button",
                        onVoiceInput: (String text) {
                          if (mounted && text.isNotEmpty) {
                            DirectTextUpdater.updateText(
                              controller: _titleController,
                              text: text,
                              setState: setState,
                            );
                          }
                        },
                        hint: 'Record Title',
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title for this record';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              
              // Notes field
              TextFormField(
                controller: _notesController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Notes',
                  hintText: 'Enter details about this health record...',
                  prefixIcon: const Icon(Icons.notes),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: VoiceInputButton(
                        heroTag: "voice_notes_button",
                        onVoiceInput: (String text) {
                          if (mounted && text.isNotEmpty) {
                            DirectTextUpdater.updateText(
                              controller: _notesController,
                              text: text,
                              setState: setState,
                            );
                          }
                        },
                        hint: 'Health record notes',
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Submit button
              ElevatedButton(
                onPressed: _isLoading ? null : _handleSubmit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isLoading 
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save Health Record'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _recordDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
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
        _recordDate = picked;
      });
    }
  }
  
  void _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    
    setState(() => _isLoading = true);
    
    try {
      final title = _titleController.text.trim();
      final notes = _notesController.text.trim();
      final recordDate = _recordDate;
      
      debugPrint('📝 Saving health record: Title: $title, Date: $recordDate');
      debugPrint('📝 Notes: $notes');
      
      // Add the health record using the provider
      await ref.read(healthRecordProvider.notifier).addHealthRecord(
        patientId: widget.patientId,
        title: title,
        notes: notes,
        date: recordDate,
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(ref.read(textsProvider).healthRecordAdded),
            backgroundColor: Colors.green,
          ),
        );
        
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error adding health record: $e'),
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
}
