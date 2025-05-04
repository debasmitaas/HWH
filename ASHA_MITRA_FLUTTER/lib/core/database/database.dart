import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';
import 'tables.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Patients,
  HealthRecords,
  Appointments,
  AshaWorkers,
  Immunizations,
  MaternalHealthRecords,
  ChildHealthRecords,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  final _uuid = const Uuid();

  // ==================== PATIENT OPERATIONS ====================

  // Get all patients with optional filtering
  Future<List<Patient>> getAllPatients({
    String? searchQuery,
    String? filter,
  }) async {
    var query = select(patients);

    if (searchQuery != null && searchQuery.isNotEmpty) {
      query = query..where((p) => p.name.like('%$searchQuery%') | p.phone.like('%$searchQuery%'));
    }

    if (filter != null && filter != 'all') {
      query = query..where((p) => p.type.equals(filter));
    }

    query = query..orderBy([(p) => OrderingTerm.desc(p.createdAt)]);

    return await query.get();
  }

  // Get patient by ID
  Future<Patient?> getPatientById(String id) async {
    return await (select(patients)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  // Add new patient
  Future<String> addPatient({
    required String name,
    required int age,
    String? phone,
    String? lmpDate,
    double? weight,
    double? height,
    String? bloodPressure,
    String? notes,
    String? type,
    String? village,
    String? address,
    String? createdBy,
  }) async {
    final id = _uuid.v4();
    
    await into(patients).insert(PatientsCompanion(
      id: Value(id),
      name: Value(name),
      age: Value(age),
      phone: Value.absentIfNull(phone),
      lmpDate: Value.absentIfNull(lmpDate),
      weight: Value.absentIfNull(weight),
      height: Value.absentIfNull(height),
      bloodPressure: Value.absentIfNull(bloodPressure),
      notes: Value.absentIfNull(notes),
      type: Value(type ?? 'general'),
      village: Value.absentIfNull(village),
      address: Value.absentIfNull(address),
      createdBy: Value.absentIfNull(createdBy),
    ));

    return id;
  }

  // Update patient
  Future<bool> updatePatient(String id, PatientsCompanion patient) async {
    final updatedRows = await (update(patients)..where((p) => p.id.equals(id)))
        .write(patient.copyWith(updatedAt: Value(DateTime.now())));
    return updatedRows > 0;
  }

  // Delete patient
  Future<bool> deletePatient(String id) async {
    final deletedRows = await (delete(patients)..where((p) => p.id.equals(id))).go();
    return deletedRows > 0;
  }

  // Search patients by name or phone
  Future<List<Patient>> searchPatients(String query) async {
    return await (select(patients)
          ..where((p) => p.name.like('%$query%') | p.phone.like('%$query%'))
          ..orderBy([(p) => OrderingTerm.desc(p.createdAt)]))
        .get();
  }

  // ==================== HEALTH RECORDS OPERATIONS ====================

  // Get health records for a patient
  Future<List<HealthRecord>> getPatientHealthRecords(String patientId) async {
    return await (select(healthRecords)
          ..where((r) => r.patientId.equals(patientId))
          ..orderBy([(r) => OrderingTerm.desc(r.visitDate)]))
        .get();
  }

  // Add health record
  Future<String> addHealthRecord({
    required String patientId,
    double? weight,
    double? height,
    String? bloodPressure,
    double? temperature,
    String? pulse,
    String? notes,
    String? symptoms,
    String? medications,
    String? diagnosis,
    String? recommendations,
    DateTime? visitDate,
    String? createdBy,
  }) async {
    final id = _uuid.v4();
    
    await into(healthRecords).insert(HealthRecordsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      weight: Value.absentIfNull(weight),
      height: Value.absentIfNull(height),
      bloodPressure: Value.absentIfNull(bloodPressure),
      temperature: Value.absentIfNull(temperature),
      pulse: Value.absentIfNull(pulse),
      notes: Value.absentIfNull(notes),
      symptoms: Value.absentIfNull(symptoms),
      medications: Value.absentIfNull(medications),
      diagnosis: Value.absentIfNull(diagnosis),
      recommendations: Value.absentIfNull(recommendations),
      visitDate: Value(visitDate ?? DateTime.now()),
      createdBy: Value.absentIfNull(createdBy),
    ));

    return id;
  }

  // ==================== APPOINTMENTS OPERATIONS ====================

  // Get appointments for a specific date
  Future<List<Appointment>> getAppointmentsByDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await (select(appointments)
          ..where((a) => a.appointmentDate.isBetween(Variable(startOfDay), Variable(endOfDay)))
          ..orderBy([(a) => OrderingTerm.asc(a.appointmentTime)]))
        .get();
  }

  // Get upcoming appointments
  Future<List<Appointment>> getUpcomingAppointments({int limit = 10}) async {
    final now = DateTime.now();
    
    return await (select(appointments)
          ..where((a) => a.appointmentDate.isBiggerThanValue(now) & a.isCompleted.equals(false))
          ..orderBy([(a) => OrderingTerm.asc(a.appointmentDate)])
          ..limit(limit))
        .get();
  }

  // Add appointment
  Future<String> addAppointment({
    required String patientId,
    required DateTime appointmentDate,
    required String appointmentTime,
    required String type,
    String? notes,
    String? createdBy,
  }) async {
    final id = _uuid.v4();
    
    await into(appointments).insert(AppointmentsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      appointmentDate: Value(appointmentDate),
      appointmentTime: Value(appointmentTime),
      type: Value(type),
      notes: Value.absentIfNull(notes),
      createdBy: Value.absentIfNull(createdBy),
    ));

    return id;
  }

  // Update appointment completion status
  Future<bool> updateAppointmentCompletion(String id, bool isCompleted) async {
    final updatedRows = await (update(appointments)..where((a) => a.id.equals(id)))
        .write(AppointmentsCompanion(isCompleted: Value(isCompleted)));
    return updatedRows > 0;
  }

  // ==================== ASHA WORKER OPERATIONS ====================

  // Get ASHA worker by ID
  Future<AshaWorker?> getAshaWorkerById(String id) async {
    return await (select(ashaWorkers)..where((w) => w.id.equals(id))).getSingleOrNull();
  }

  // Get ASHA worker by phone
  Future<AshaWorker?> getAshaWorkerByPhone(String phone) async {
    return await (select(ashaWorkers)..where((w) => w.phone.equals(phone))).getSingleOrNull();
  }

  // Add ASHA worker
  Future<String> addAshaWorker({
    required String name,
    required String phone,
    String? village,
    String? block,
    String? district,
    String? state,
  }) async {
    final id = _uuid.v4();
    
    await into(ashaWorkers).insert(AshaWorkersCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      village: Value.absentIfNull(village),
      block: Value.absentIfNull(block),
      district: Value.absentIfNull(district),
      state: Value.absentIfNull(state),
    ));

    return id;
  }

  // Update last login
  Future<bool> updateLastLogin(String id) async {
    final updatedRows = await (update(ashaWorkers)..where((w) => w.id.equals(id)))
        .write(AshaWorkersCompanion(lastLogin: Value(DateTime.now())));
    return updatedRows > 0;
  }

  // ==================== DASHBOARD STATISTICS ====================

  // Get dashboard stats
  Future<Map<String, int>> getDashboardStats() async {
    final totalPatients = await (selectOnly(patients)..addColumns([patients.id.count()])).getSingle();
    
    final thisMonth = DateTime.now();
    final startOfMonth = DateTime(thisMonth.year, thisMonth.month, 1);
    final thisMonthPatients = await (selectOnly(patients)
          ..addColumns([patients.id.count()])
          ..where(patients.createdAt.isBiggerOrEqualValue(startOfMonth)))
        .getSingle();

    final highRiskPatients = await (selectOnly(patients)
          ..addColumns([patients.id.count()])
          ..where(patients.type.equals('pregnant')))
        .getSingle();

    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    final todayAppointments = await (selectOnly(appointments)
          ..addColumns([appointments.id.count()])
          ..where(appointments.appointmentDate.isBetween(Variable(startOfDay), Variable(endOfDay))))
        .getSingle();

    return {
      'totalPatients': totalPatients.read(patients.id.count()) ?? 0,
      'thisMonthPatients': thisMonthPatients.read(patients.id.count()) ?? 0,
      'highRiskPatients': highRiskPatients.read(patients.id.count()) ?? 0,
      'todayAppointments': todayAppointments.read(appointments.id.count()) ?? 0,
    };
  }

  // Get recent patients
  Future<List<Patient>> getRecentPatients({int limit = 5}) async {
    return await (select(patients)
          ..orderBy([(p) => OrderingTerm.desc(p.createdAt)])
          ..limit(limit))
        .get();
  }

  // ==================== MATERNAL HEALTH OPERATIONS ====================

  // Add maternal health record
  Future<String> addMaternalHealthRecord({
    required String patientId,
    int? pregnancyNumber,
    DateTime? lmpDate,
    DateTime? eddDate,
    int? gestationalAge,
    double? hemoglobin,
    String? bloodGroup,
    bool? highRiskPregnancy,
    String? riskFactors,
    String? complications,
    int? ancVisits,
    DateTime? lastAncDate,
    String? createdBy,
  }) async {
    final id = _uuid.v4();
    
    await into(maternalHealthRecords).insert(MaternalHealthRecordsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      pregnancyNumber: Value.absentIfNull(pregnancyNumber),
      lmpDate: Value.absentIfNull(lmpDate),
      eddDate: Value.absentIfNull(eddDate),
      gestationalAge: Value.absentIfNull(gestationalAge),
      hemoglobin: Value.absentIfNull(hemoglobin),
      bloodGroup: Value.absentIfNull(bloodGroup),
      highRiskPregnancy: Value(highRiskPregnancy ?? false),
      riskFactors: Value.absentIfNull(riskFactors),
      complications: Value.absentIfNull(complications),
      ancVisits: Value(ancVisits ?? 0),
      lastAncDate: Value.absentIfNull(lastAncDate),
      createdBy: Value.absentIfNull(createdBy),
    ));

    return id;
  }

  // ==================== CHILD HEALTH OPERATIONS ====================

  // Add child health record
  Future<String> addChildHealthRecord({
    required String patientId,
    required DateTime birthDate,
    double? birthWeight,
    double? currentWeight,
    double? currentHeight,
    String? feedingType,
    bool? isBreastfeeding,
    String? developmentStatus,
    String? growthStatus,
    DateTime? lastWeighingDate,
    String? nutritionStatus,
    String? complications,
    String? createdBy,
  }) async {
    final id = _uuid.v4();
    
    await into(childHealthRecords).insert(ChildHealthRecordsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      birthDate: Value(birthDate),
      birthWeight: Value.absentIfNull(birthWeight),
      currentWeight: Value.absentIfNull(currentWeight),
      currentHeight: Value.absentIfNull(currentHeight),
      feedingType: Value.absentIfNull(feedingType),
      isBreastfeeding: Value(isBreastfeeding ?? true),
      developmentStatus: Value.absentIfNull(developmentStatus),
      growthStatus: Value.absentIfNull(growthStatus),
      lastWeighingDate: Value.absentIfNull(lastWeighingDate),
      nutritionStatus: Value.absentIfNull(nutritionStatus),
      complications: Value.absentIfNull(complications),
      createdBy: Value.absentIfNull(createdBy),
    ));

    return id;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'asha_mitra.db'));
    return NativeDatabase(file);
  });
}
