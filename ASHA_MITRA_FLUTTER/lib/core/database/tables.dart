import 'package:drift/drift.dart';

// Patients table
class Patients extends Table {
  TextColumn get id => text().withLength(min: 1, max: 50)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get age => integer().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get lmpDate => text().nullable()(); // Last Menstrual Period
  RealColumn get weight => real().nullable()();
  RealColumn get height => real().nullable()();
  TextColumn get bloodPressure => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get type => text().withDefault(const Constant('general'))(); // pregnant, newborn, child, general
  TextColumn get village => text().nullable()();
  TextColumn get address => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdBy => text().nullable()(); // ASHA worker ID
  
  @override
  Set<Column> get primaryKey => {id};
}

// Health Records table
class HealthRecords extends Table {
  TextColumn get id => text().withLength(min: 1, max: 50)();
  TextColumn get patientId => text().references(Patients, #id)();
  RealColumn get weight => real().nullable()();
  RealColumn get height => real().nullable()();
  TextColumn get bloodPressure => text().nullable()();
  RealColumn get temperature => real().nullable()();
  TextColumn get pulse => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get symptoms => text().nullable()();
  TextColumn get medications => text().nullable()();
  TextColumn get diagnosis => text().nullable()();
  TextColumn get recommendations => text().nullable()();
  DateTimeColumn get visitDate => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdBy => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}

// Appointments table
class Appointments extends Table {
  TextColumn get id => text().withLength(min: 1, max: 50)();
  TextColumn get patientId => text().references(Patients, #id)();
  DateTimeColumn get appointmentDate => dateTime()();
  TextColumn get appointmentTime => text()();
  TextColumn get type => text()(); // ANC, checkup, vaccination, follow-up
  TextColumn get notes => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  BoolColumn get isReminded => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdBy => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}

// ASHA Workers (Users) table
class AshaWorkers extends Table {
  TextColumn get id => text().withLength(min: 1, max: 50)();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get phone => text().unique()();
  TextColumn get village => text().nullable()();
  TextColumn get block => text().nullable()();
  TextColumn get district => text().nullable()();
  TextColumn get state => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get lastLogin => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  
  @override
  Set<Column> get primaryKey => {id};
}

// Immunizations table
class Immunizations extends Table {
  TextColumn get id => text().withLength(min: 1, max: 50)();
  TextColumn get patientId => text().references(Patients, #id)();
  TextColumn get vaccineName => text()();
  DateTimeColumn get givenDate => dateTime()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get batchNumber => text().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdBy => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}

// Maternal Health Records table
class MaternalHealthRecords extends Table {
  TextColumn get id => text().withLength(min: 1, max: 50)();
  TextColumn get patientId => text().references(Patients, #id)();
  IntColumn get pregnancyNumber => integer().nullable()();
  DateTimeColumn get lmpDate => dateTime().nullable()();
  DateTimeColumn get eddDate => dateTime().nullable()(); // Expected Date of Delivery
  IntColumn get gestationalAge => integer().nullable()(); // in weeks
  RealColumn get hemoglobin => real().nullable()();
  TextColumn get bloodGroup => text().nullable()();
  BoolColumn get highRiskPregnancy => boolean().withDefault(const Constant(false))();
  TextColumn get riskFactors => text().nullable()();
  TextColumn get complications => text().nullable()();
  IntColumn get ancVisits => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastAncDate => dateTime().nullable()();
  DateTimeColumn get deliveryDate => dateTime().nullable()();
  TextColumn get deliveryType => text().nullable()(); // Normal, C-Section
  TextColumn get deliveryLocation => text().nullable()();
  RealColumn get babyWeight => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdBy => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}

// Child Health Records table
class ChildHealthRecords extends Table {
  TextColumn get id => text().withLength(min: 1, max: 50)();
  TextColumn get patientId => text().references(Patients, #id)();
  DateTimeColumn get birthDate => dateTime()();
  RealColumn get birthWeight => real().nullable()();
  RealColumn get currentWeight => real().nullable()();
  RealColumn get currentHeight => real().nullable()();
  TextColumn get feedingType => text().nullable()(); // Breastfeeding, Formula, Mixed
  BoolColumn get isBreastfeeding => boolean().withDefault(const Constant(true))();
  TextColumn get developmentStatus => text().nullable()();
  TextColumn get growthStatus => text().nullable()(); // Normal, Underweight, Stunted
  DateTimeColumn get lastWeighingDate => dateTime().nullable()();
  TextColumn get nutritionStatus => text().nullable()();
  TextColumn get complications => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get createdBy => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}
