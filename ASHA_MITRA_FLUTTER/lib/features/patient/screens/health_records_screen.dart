import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../shared/providers/health_record_provider.dart';
import '../../../shared/providers/language_provider.dart';
import '../../../shared/providers/patient_provider.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/language_toggle.dart';
import '../models/health_record.dart';

class HealthRecordsScreen extends ConsumerWidget {
  const HealthRecordsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(textsProvider);
    final healthRecords = ref.watch(healthRecordProvider);
    final patients = ref.watch(patientProvider);
    
    // Sort records by date (newest first)
    final sortedRecords = [...healthRecords];
    sortedRecords.sort((a, b) => b.date.compareTo(a.date));
    
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.healthRecords),
        actions: const [
          LanguageToggle(),
        ],
      ),
      body: healthRecords.isEmpty
          ? _buildEmptyState(context, texts)
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sortedRecords.length,
              itemBuilder: (context, index) {
                final record = sortedRecords[index];
                // Find patient for this record
                final patient = patients.firstWhere(
                  (p) => p.id == record.patientId,
                  orElse: () => patients.first, // Fallback
                );
                
                return _buildRecordCard(context, record, patient.name, texts);
              },
            ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1), // Assuming this is on the Patients tab
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // If there are patients, show patient selection dialog
          if (patients.isNotEmpty) {
            _showPatientSelectionDialog(context, patients, texts);
          } else {
            // If no patients, show message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(texts.noPatients),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        tooltip: texts.addRecord,
        child: const Icon(Icons.add),
      ),
    );
  }
  
  Widget _buildEmptyState(BuildContext context, AppTexts texts) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medical_services_outlined,
            size: 80,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            texts.noRecordsAvailable,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to patients list
              context.push('/patients');
            },
            icon: const Icon(Icons.person_search),
            label: Text(texts.patients),
          ),
        ],
      ),
    );
  }
  
  Widget _buildRecordCard(BuildContext context, HealthRecord record, String patientName, AppTexts texts) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
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
            Text(
              '${texts.date}: ${DateFormat('yyyy-MM-dd').format(record.date)}',
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              patientName,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          _showRecordDetails(context, record, patientName, texts);
        },
      ),
    );
  }
  
  void _showRecordDetails(BuildContext context, HealthRecord record, String patientName, AppTexts texts) {
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
                patientName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${texts.date}: ${DateFormat('yyyy-MM-dd').format(record.date)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                record.notes,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
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
  
  void _showPatientSelectionDialog(BuildContext context, List<dynamic> patients, AppTexts texts) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(texts.selectPatient),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: patients.length,
            itemBuilder: (context, index) {
              final patient = patients[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  child: Icon(
                    patient.gender == 'female' 
                        ? Icons.female 
                        : patient.gender == 'male'
                            ? Icons.male
                            : Icons.person,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                title: Text(patient.name),
                subtitle: Text('${texts.age}: ${patient.age}'),
                onTap: () {
                  Navigator.of(context).pop();
                  context.push('/patients/${patient.id}/add-record');
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(texts.cancel),
          ),
        ],
      ),
    );
  }
}
