import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/patient/models/health_record.dart';
import 'activity_provider.dart';

class HealthRecordNotifier extends StateNotifier<List<HealthRecord>> {
  HealthRecordNotifier(this.ref) : super([]);
  
  final Ref ref;

  Future<void> addHealthRecord({
    required String patientId,
    required String title,
    required String notes,
    required DateTime date,
  }) async {
    try {
      print('🩺 HealthRecordProvider: Adding health record - PatientId: $patientId, Title: $title');
      
      final record = HealthRecord(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        patientId: patientId,
        title: title,
        notes: notes,
        date: date,
        createdAt: DateTime.now(),
      );

      // Add to local state
      state = [...state, record];
      
      // Log activity
      ref.read(activityProvider.notifier).addActivity(
        title: 'Health Record Added',
        description: 'Added new health record: $title',
        type: ActivityType.recordAdded,
        patientId: patientId,
      );
      
      print('🩺 HealthRecordProvider: Record added successfully: ${record.title} (ID: ${record.id})');
      print('🩺 HealthRecordProvider: Total records: ${state.length}');
    } catch (e) {
      print('❌ HealthRecordProvider: Error adding health record: $e');
      rethrow;
    }
  }

  Future<void> loadHealthRecords() async {
    try {
      // In a real app, we would load from a database
      print('Loading health records...');
    } catch (e) {
      print('Error loading health records: $e');
      rethrow;
    }
  }

  Future<void> deleteHealthRecord(String id) async {
    try {
      // Find the record first
      final record = state.firstWhere((r) => r.id == id);
      
      state = state.where((record) => record.id != id).toList();
      
      // Log activity
      ref.read(activityProvider.notifier).addActivity(
        title: 'Health Record Deleted',
        description: 'Deleted health record: ${record.title}',
        type: ActivityType.recordDeleted,
        patientId: record.patientId,
      );
      
      print('Health record deleted: $id');
    } catch (e) {
      print('Error deleting health record: $e');
      rethrow;
    }
  }

  List<HealthRecord> getRecordsForPatient(String patientId) {
    return state.where((record) => record.patientId == patientId).toList();
  }
}

final healthRecordProvider = StateNotifierProvider<HealthRecordNotifier, List<HealthRecord>>((ref) {
  return HealthRecordNotifier(ref);
});
