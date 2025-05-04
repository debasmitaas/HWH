import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'activity_provider.dart';

class Patient {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String phone;
  final String address;
  final String village;
  final String? emergencyContact;
  final String category;  // 'pregnant', 'postpartum', 'baby', 'other'
  final bool isPregnant;
  final String? description;
  final DateTime? previousAppointment;
  final DateTime? nextAppointment;
  final DateTime createdAt;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.phone,
    required this.address,
    required this.village,
    this.emergencyContact,
    this.category = 'other',
    required this.isPregnant,
    this.description,
    this.previousAppointment,
    this.nextAppointment,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'phone': phone,
      'address': address,
      'village': village,
      'emergencyContact': emergencyContact,
      'category': category,
      'isPregnant': isPregnant,
      'description': description,
      'previousAppointment': previousAppointment?.toIso8601String(),
      'nextAppointment': nextAppointment?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      phone: json['phone'],
      address: json['address'],
      village: json['village'],
      emergencyContact: json['emergencyContact'],
      category: json['category'] ?? 'other',
      isPregnant: json['isPregnant'] ?? false,
      description: json['description'],
      previousAppointment: json['previousAppointment'] != null 
          ? DateTime.parse(json['previousAppointment']) 
          : null,
      nextAppointment: json['nextAppointment'] != null 
          ? DateTime.parse(json['nextAppointment']) 
          : null,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class PatientNotifier extends StateNotifier<List<Patient>> {
  PatientNotifier(this.ref) : super([]);
  
  final Ref ref;

  Future<void> addPatient({
    required String name,
    required int age,
    required String gender,
    required String phone,
    required String address,
    required String village,
    String? emergencyContact,
    String category = 'other',
    required bool isPregnant,
    String? description,
    DateTime? previousAppointment,
    DateTime? nextAppointment,
  }) async {
    try {
      print('🏥 PatientProvider: Adding patient - Name: $name, Age: $age, Gender: $gender');
      
      final patient = Patient(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        age: age,
        gender: gender,
        phone: phone,
        address: address,
        village: village,
        emergencyContact: emergencyContact,
        category: category,
        isPregnant: isPregnant,
        description: description,
        previousAppointment: previousAppointment,
        nextAppointment: nextAppointment,
        createdAt: DateTime.now(),
      );

      // TODO: Save to database (Supabase)
      // For now, just add to local state
      state = [...state, patient];
      
      // Log activity
      ref.read(activityProvider.notifier).addActivity(
        title: 'Patient Added',
        description: 'Added new patient: ${patient.name}',
        type: ActivityType.patientAdded,
        patientId: patient.id,
        patientName: patient.name,
      );
      
      print('🏥 PatientProvider: Patient added successfully: ${patient.name} (ID: ${patient.id})');
      print('🏥 PatientProvider: Total patients: ${state.length}');
    } catch (e) {
      print('❌ PatientProvider: Error adding patient: $e');
      rethrow;
    }
  }

  Future<void> loadPatients() async {
    try {
      // TODO: Load from database (Supabase)
      // For now, just load mock data
      print('Loading patients...');
    } catch (e) {
      print('Error loading patients: $e');
      rethrow;
    }
  }

  Future<void> deletePatient(String id) async {
    try {
      // Find the patient first to get the name for the activity log
      final patient = state.firstWhere((p) => p.id == id);
      
      // TODO: Delete from database (Supabase)
      state = state.where((patient) => patient.id != id).toList();
      
      // Log activity
      ref.read(activityProvider.notifier).addActivity(
        title: 'Patient Deleted',
        description: 'Deleted patient: ${patient.name}',
        type: ActivityType.patientUpdated,
        patientId: id,
        patientName: patient.name,
      );
      
      print('Patient deleted: $id');
    } catch (e) {
      print('Error deleting patient: $e');
      rethrow;
    }
  }

  Future<void> updatePatient({
    required String id,
    String? name,
    int? age,
    String? gender,
    String? phone,
    String? address,
    String? village,
    String? emergencyContact,
    String? category,
    bool? isPregnant,
    String? description,
    DateTime? previousAppointment,
    DateTime? nextAppointment,
  }) async {
    try {
      final index = state.indexWhere((patient) => patient.id == id);
      if (index == -1) {
        throw Exception('Patient not found');
      }

      final currentPatient = state[index];
      final updatedPatient = Patient(
        id: currentPatient.id,
        name: name ?? currentPatient.name,
        age: age ?? currentPatient.age,
        gender: gender ?? currentPatient.gender,
        phone: phone ?? currentPatient.phone,
        address: address ?? currentPatient.address,
        village: village ?? currentPatient.village,
        emergencyContact: emergencyContact ?? currentPatient.emergencyContact,
        category: category ?? currentPatient.category,
        isPregnant: isPregnant ?? currentPatient.isPregnant,
        description: description ?? currentPatient.description,
        previousAppointment: previousAppointment ?? currentPatient.previousAppointment,
        nextAppointment: nextAppointment ?? currentPatient.nextAppointment,
        createdAt: currentPatient.createdAt,
      );

      final List<Patient> updatedPatients = [...state];
      updatedPatients[index] = updatedPatient;
      state = updatedPatients;
      
      // Log activity
      ref.read(activityProvider.notifier).addActivity(
        title: 'Patient Updated',
        description: 'Updated patient: ${updatedPatient.name}',
        type: ActivityType.patientUpdated,
        patientId: id,
        patientName: updatedPatient.name,
      );
      
      print('🏥 PatientProvider: Patient updated successfully: ${updatedPatient.name} (ID: ${updatedPatient.id})');
    } catch (e) {
      print('❌ PatientProvider: Error updating patient: $e');
      rethrow;
    }
  }
}

final patientProvider = StateNotifierProvider<PatientNotifier, List<Patient>>((ref) {
  return PatientNotifier(ref);
});
