// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PatientsTable extends Patients with TableInfo<$PatientsTable, Patient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lmpDateMeta =
      const VerificationMeta('lmpDate');
  @override
  late final GeneratedColumn<String> lmpDate = GeneratedColumn<String>(
      'lmp_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
      'height', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _bloodPressureMeta =
      const VerificationMeta('bloodPressure');
  @override
  late final GeneratedColumn<String> bloodPressure = GeneratedColumn<String>(
      'blood_pressure', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('general'));
  static const VerificationMeta _villageMeta =
      const VerificationMeta('village');
  @override
  late final GeneratedColumn<String> village = GeneratedColumn<String>(
      'village', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        age,
        phone,
        lmpDate,
        weight,
        height,
        bloodPressure,
        notes,
        type,
        village,
        address,
        isActive,
        createdAt,
        updatedAt,
        createdBy
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patients';
  @override
  VerificationContext validateIntegrity(Insertable<Patient> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('lmp_date')) {
      context.handle(_lmpDateMeta,
          lmpDate.isAcceptableOrUnknown(data['lmp_date']!, _lmpDateMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    }
    if (data.containsKey('blood_pressure')) {
      context.handle(
          _bloodPressureMeta,
          bloodPressure.isAcceptableOrUnknown(
              data['blood_pressure']!, _bloodPressureMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    }
    if (data.containsKey('village')) {
      context.handle(_villageMeta,
          village.isAcceptableOrUnknown(data['village']!, _villageMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Patient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Patient(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      lmpDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lmp_date']),
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight']),
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height']),
      bloodPressure: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blood_pressure']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      village: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}village']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by']),
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class Patient extends DataClass implements Insertable<Patient> {
  final String id;
  final String name;
  final int? age;
  final String? phone;
  final String? lmpDate;
  final double? weight;
  final double? height;
  final String? bloodPressure;
  final String? notes;
  final String type;
  final String? village;
  final String? address;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? createdBy;
  const Patient(
      {required this.id,
      required this.name,
      this.age,
      this.phone,
      this.lmpDate,
      this.weight,
      this.height,
      this.bloodPressure,
      this.notes,
      required this.type,
      this.village,
      this.address,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      this.createdBy});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || lmpDate != null) {
      map['lmp_date'] = Variable<String>(lmpDate);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || bloodPressure != null) {
      map['blood_pressure'] = Variable<String>(bloodPressure);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || village != null) {
      map['village'] = Variable<String>(village);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      name: Value(name),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      lmpDate: lmpDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lmpDate),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      bloodPressure: bloodPressure == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodPressure),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      type: Value(type),
      village: village == null && nullToAbsent
          ? const Value.absent()
          : Value(village),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
    );
  }

  factory Patient.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Patient(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int?>(json['age']),
      phone: serializer.fromJson<String?>(json['phone']),
      lmpDate: serializer.fromJson<String?>(json['lmpDate']),
      weight: serializer.fromJson<double?>(json['weight']),
      height: serializer.fromJson<double?>(json['height']),
      bloodPressure: serializer.fromJson<String?>(json['bloodPressure']),
      notes: serializer.fromJson<String?>(json['notes']),
      type: serializer.fromJson<String>(json['type']),
      village: serializer.fromJson<String?>(json['village']),
      address: serializer.fromJson<String?>(json['address']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int?>(age),
      'phone': serializer.toJson<String?>(phone),
      'lmpDate': serializer.toJson<String?>(lmpDate),
      'weight': serializer.toJson<double?>(weight),
      'height': serializer.toJson<double?>(height),
      'bloodPressure': serializer.toJson<String?>(bloodPressure),
      'notes': serializer.toJson<String?>(notes),
      'type': serializer.toJson<String>(type),
      'village': serializer.toJson<String?>(village),
      'address': serializer.toJson<String?>(address),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'createdBy': serializer.toJson<String?>(createdBy),
    };
  }

  Patient copyWith(
          {String? id,
          String? name,
          Value<int?> age = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> lmpDate = const Value.absent(),
          Value<double?> weight = const Value.absent(),
          Value<double?> height = const Value.absent(),
          Value<String?> bloodPressure = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          String? type,
          Value<String?> village = const Value.absent(),
          Value<String?> address = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<String?> createdBy = const Value.absent()}) =>
      Patient(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age.present ? age.value : this.age,
        phone: phone.present ? phone.value : this.phone,
        lmpDate: lmpDate.present ? lmpDate.value : this.lmpDate,
        weight: weight.present ? weight.value : this.weight,
        height: height.present ? height.value : this.height,
        bloodPressure:
            bloodPressure.present ? bloodPressure.value : this.bloodPressure,
        notes: notes.present ? notes.value : this.notes,
        type: type ?? this.type,
        village: village.present ? village.value : this.village,
        address: address.present ? address.value : this.address,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
      );
  Patient copyWithCompanion(PatientsCompanion data) {
    return Patient(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      age: data.age.present ? data.age.value : this.age,
      phone: data.phone.present ? data.phone.value : this.phone,
      lmpDate: data.lmpDate.present ? data.lmpDate.value : this.lmpDate,
      weight: data.weight.present ? data.weight.value : this.weight,
      height: data.height.present ? data.height.value : this.height,
      bloodPressure: data.bloodPressure.present
          ? data.bloodPressure.value
          : this.bloodPressure,
      notes: data.notes.present ? data.notes.value : this.notes,
      type: data.type.present ? data.type.value : this.type,
      village: data.village.present ? data.village.value : this.village,
      address: data.address.present ? data.address.value : this.address,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Patient(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('phone: $phone, ')
          ..write('lmpDate: $lmpDate, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('bloodPressure: $bloodPressure, ')
          ..write('notes: $notes, ')
          ..write('type: $type, ')
          ..write('village: $village, ')
          ..write('address: $address, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      age,
      phone,
      lmpDate,
      weight,
      height,
      bloodPressure,
      notes,
      type,
      village,
      address,
      isActive,
      createdAt,
      updatedAt,
      createdBy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age &&
          other.phone == this.phone &&
          other.lmpDate == this.lmpDate &&
          other.weight == this.weight &&
          other.height == this.height &&
          other.bloodPressure == this.bloodPressure &&
          other.notes == this.notes &&
          other.type == this.type &&
          other.village == this.village &&
          other.address == this.address &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.createdBy == this.createdBy);
}

class PatientsCompanion extends UpdateCompanion<Patient> {
  final Value<String> id;
  final Value<String> name;
  final Value<int?> age;
  final Value<String?> phone;
  final Value<String?> lmpDate;
  final Value<double?> weight;
  final Value<double?> height;
  final Value<String?> bloodPressure;
  final Value<String?> notes;
  final Value<String> type;
  final Value<String?> village;
  final Value<String?> address;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String?> createdBy;
  final Value<int> rowid;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.phone = const Value.absent(),
    this.lmpDate = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.bloodPressure = const Value.absent(),
    this.notes = const Value.absent(),
    this.type = const Value.absent(),
    this.village = const Value.absent(),
    this.address = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PatientsCompanion.insert({
    required String id,
    required String name,
    this.age = const Value.absent(),
    this.phone = const Value.absent(),
    this.lmpDate = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.bloodPressure = const Value.absent(),
    this.notes = const Value.absent(),
    this.type = const Value.absent(),
    this.village = const Value.absent(),
    this.address = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<Patient> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? age,
    Expression<String>? phone,
    Expression<String>? lmpDate,
    Expression<double>? weight,
    Expression<double>? height,
    Expression<String>? bloodPressure,
    Expression<String>? notes,
    Expression<String>? type,
    Expression<String>? village,
    Expression<String>? address,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? createdBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (phone != null) 'phone': phone,
      if (lmpDate != null) 'lmp_date': lmpDate,
      if (weight != null) 'weight': weight,
      if (height != null) 'height': height,
      if (bloodPressure != null) 'blood_pressure': bloodPressure,
      if (notes != null) 'notes': notes,
      if (type != null) 'type': type,
      if (village != null) 'village': village,
      if (address != null) 'address': address,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (createdBy != null) 'created_by': createdBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PatientsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int?>? age,
      Value<String?>? phone,
      Value<String?>? lmpDate,
      Value<double?>? weight,
      Value<double?>? height,
      Value<String?>? bloodPressure,
      Value<String?>? notes,
      Value<String>? type,
      Value<String?>? village,
      Value<String?>? address,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String?>? createdBy,
      Value<int>? rowid}) {
    return PatientsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      phone: phone ?? this.phone,
      lmpDate: lmpDate ?? this.lmpDate,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      notes: notes ?? this.notes,
      type: type ?? this.type,
      village: village ?? this.village,
      address: address ?? this.address,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (lmpDate.present) {
      map['lmp_date'] = Variable<String>(lmpDate.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (bloodPressure.present) {
      map['blood_pressure'] = Variable<String>(bloodPressure.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (village.present) {
      map['village'] = Variable<String>(village.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('phone: $phone, ')
          ..write('lmpDate: $lmpDate, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('bloodPressure: $bloodPressure, ')
          ..write('notes: $notes, ')
          ..write('type: $type, ')
          ..write('village: $village, ')
          ..write('address: $address, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('createdBy: $createdBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HealthRecordsTable extends HealthRecords
    with TableInfo<$HealthRecordsTable, HealthRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES patients (id)'));
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
      'height', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _bloodPressureMeta =
      const VerificationMeta('bloodPressure');
  @override
  late final GeneratedColumn<String> bloodPressure = GeneratedColumn<String>(
      'blood_pressure', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _temperatureMeta =
      const VerificationMeta('temperature');
  @override
  late final GeneratedColumn<double> temperature = GeneratedColumn<double>(
      'temperature', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _pulseMeta = const VerificationMeta('pulse');
  @override
  late final GeneratedColumn<String> pulse = GeneratedColumn<String>(
      'pulse', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _symptomsMeta =
      const VerificationMeta('symptoms');
  @override
  late final GeneratedColumn<String> symptoms = GeneratedColumn<String>(
      'symptoms', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _medicationsMeta =
      const VerificationMeta('medications');
  @override
  late final GeneratedColumn<String> medications = GeneratedColumn<String>(
      'medications', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _diagnosisMeta =
      const VerificationMeta('diagnosis');
  @override
  late final GeneratedColumn<String> diagnosis = GeneratedColumn<String>(
      'diagnosis', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _recommendationsMeta =
      const VerificationMeta('recommendations');
  @override
  late final GeneratedColumn<String> recommendations = GeneratedColumn<String>(
      'recommendations', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _visitDateMeta =
      const VerificationMeta('visitDate');
  @override
  late final GeneratedColumn<DateTime> visitDate = GeneratedColumn<DateTime>(
      'visit_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        patientId,
        weight,
        height,
        bloodPressure,
        temperature,
        pulse,
        notes,
        symptoms,
        medications,
        diagnosis,
        recommendations,
        visitDate,
        createdAt,
        createdBy
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'health_records';
  @override
  VerificationContext validateIntegrity(Insertable<HealthRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    }
    if (data.containsKey('blood_pressure')) {
      context.handle(
          _bloodPressureMeta,
          bloodPressure.isAcceptableOrUnknown(
              data['blood_pressure']!, _bloodPressureMeta));
    }
    if (data.containsKey('temperature')) {
      context.handle(
          _temperatureMeta,
          temperature.isAcceptableOrUnknown(
              data['temperature']!, _temperatureMeta));
    }
    if (data.containsKey('pulse')) {
      context.handle(
          _pulseMeta, pulse.isAcceptableOrUnknown(data['pulse']!, _pulseMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('symptoms')) {
      context.handle(_symptomsMeta,
          symptoms.isAcceptableOrUnknown(data['symptoms']!, _symptomsMeta));
    }
    if (data.containsKey('medications')) {
      context.handle(
          _medicationsMeta,
          medications.isAcceptableOrUnknown(
              data['medications']!, _medicationsMeta));
    }
    if (data.containsKey('diagnosis')) {
      context.handle(_diagnosisMeta,
          diagnosis.isAcceptableOrUnknown(data['diagnosis']!, _diagnosisMeta));
    }
    if (data.containsKey('recommendations')) {
      context.handle(
          _recommendationsMeta,
          recommendations.isAcceptableOrUnknown(
              data['recommendations']!, _recommendationsMeta));
    }
    if (data.containsKey('visit_date')) {
      context.handle(_visitDateMeta,
          visitDate.isAcceptableOrUnknown(data['visit_date']!, _visitDateMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HealthRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight']),
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height']),
      bloodPressure: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blood_pressure']),
      temperature: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}temperature']),
      pulse: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pulse']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      symptoms: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symptoms']),
      medications: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}medications']),
      diagnosis: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}diagnosis']),
      recommendations: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recommendations']),
      visitDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}visit_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by']),
    );
  }

  @override
  $HealthRecordsTable createAlias(String alias) {
    return $HealthRecordsTable(attachedDatabase, alias);
  }
}

class HealthRecord extends DataClass implements Insertable<HealthRecord> {
  final String id;
  final String patientId;
  final double? weight;
  final double? height;
  final String? bloodPressure;
  final double? temperature;
  final String? pulse;
  final String? notes;
  final String? symptoms;
  final String? medications;
  final String? diagnosis;
  final String? recommendations;
  final DateTime visitDate;
  final DateTime createdAt;
  final String? createdBy;
  const HealthRecord(
      {required this.id,
      required this.patientId,
      this.weight,
      this.height,
      this.bloodPressure,
      this.temperature,
      this.pulse,
      this.notes,
      this.symptoms,
      this.medications,
      this.diagnosis,
      this.recommendations,
      required this.visitDate,
      required this.createdAt,
      this.createdBy});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || bloodPressure != null) {
      map['blood_pressure'] = Variable<String>(bloodPressure);
    }
    if (!nullToAbsent || temperature != null) {
      map['temperature'] = Variable<double>(temperature);
    }
    if (!nullToAbsent || pulse != null) {
      map['pulse'] = Variable<String>(pulse);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || symptoms != null) {
      map['symptoms'] = Variable<String>(symptoms);
    }
    if (!nullToAbsent || medications != null) {
      map['medications'] = Variable<String>(medications);
    }
    if (!nullToAbsent || diagnosis != null) {
      map['diagnosis'] = Variable<String>(diagnosis);
    }
    if (!nullToAbsent || recommendations != null) {
      map['recommendations'] = Variable<String>(recommendations);
    }
    map['visit_date'] = Variable<DateTime>(visitDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    return map;
  }

  HealthRecordsCompanion toCompanion(bool nullToAbsent) {
    return HealthRecordsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      height:
          height == null && nullToAbsent ? const Value.absent() : Value(height),
      bloodPressure: bloodPressure == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodPressure),
      temperature: temperature == null && nullToAbsent
          ? const Value.absent()
          : Value(temperature),
      pulse:
          pulse == null && nullToAbsent ? const Value.absent() : Value(pulse),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      symptoms: symptoms == null && nullToAbsent
          ? const Value.absent()
          : Value(symptoms),
      medications: medications == null && nullToAbsent
          ? const Value.absent()
          : Value(medications),
      diagnosis: diagnosis == null && nullToAbsent
          ? const Value.absent()
          : Value(diagnosis),
      recommendations: recommendations == null && nullToAbsent
          ? const Value.absent()
          : Value(recommendations),
      visitDate: Value(visitDate),
      createdAt: Value(createdAt),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
    );
  }

  factory HealthRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthRecord(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      weight: serializer.fromJson<double?>(json['weight']),
      height: serializer.fromJson<double?>(json['height']),
      bloodPressure: serializer.fromJson<String?>(json['bloodPressure']),
      temperature: serializer.fromJson<double?>(json['temperature']),
      pulse: serializer.fromJson<String?>(json['pulse']),
      notes: serializer.fromJson<String?>(json['notes']),
      symptoms: serializer.fromJson<String?>(json['symptoms']),
      medications: serializer.fromJson<String?>(json['medications']),
      diagnosis: serializer.fromJson<String?>(json['diagnosis']),
      recommendations: serializer.fromJson<String?>(json['recommendations']),
      visitDate: serializer.fromJson<DateTime>(json['visitDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'weight': serializer.toJson<double?>(weight),
      'height': serializer.toJson<double?>(height),
      'bloodPressure': serializer.toJson<String?>(bloodPressure),
      'temperature': serializer.toJson<double?>(temperature),
      'pulse': serializer.toJson<String?>(pulse),
      'notes': serializer.toJson<String?>(notes),
      'symptoms': serializer.toJson<String?>(symptoms),
      'medications': serializer.toJson<String?>(medications),
      'diagnosis': serializer.toJson<String?>(diagnosis),
      'recommendations': serializer.toJson<String?>(recommendations),
      'visitDate': serializer.toJson<DateTime>(visitDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'createdBy': serializer.toJson<String?>(createdBy),
    };
  }

  HealthRecord copyWith(
          {String? id,
          String? patientId,
          Value<double?> weight = const Value.absent(),
          Value<double?> height = const Value.absent(),
          Value<String?> bloodPressure = const Value.absent(),
          Value<double?> temperature = const Value.absent(),
          Value<String?> pulse = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Value<String?> symptoms = const Value.absent(),
          Value<String?> medications = const Value.absent(),
          Value<String?> diagnosis = const Value.absent(),
          Value<String?> recommendations = const Value.absent(),
          DateTime? visitDate,
          DateTime? createdAt,
          Value<String?> createdBy = const Value.absent()}) =>
      HealthRecord(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        weight: weight.present ? weight.value : this.weight,
        height: height.present ? height.value : this.height,
        bloodPressure:
            bloodPressure.present ? bloodPressure.value : this.bloodPressure,
        temperature: temperature.present ? temperature.value : this.temperature,
        pulse: pulse.present ? pulse.value : this.pulse,
        notes: notes.present ? notes.value : this.notes,
        symptoms: symptoms.present ? symptoms.value : this.symptoms,
        medications: medications.present ? medications.value : this.medications,
        diagnosis: diagnosis.present ? diagnosis.value : this.diagnosis,
        recommendations: recommendations.present
            ? recommendations.value
            : this.recommendations,
        visitDate: visitDate ?? this.visitDate,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
      );
  HealthRecord copyWithCompanion(HealthRecordsCompanion data) {
    return HealthRecord(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      weight: data.weight.present ? data.weight.value : this.weight,
      height: data.height.present ? data.height.value : this.height,
      bloodPressure: data.bloodPressure.present
          ? data.bloodPressure.value
          : this.bloodPressure,
      temperature:
          data.temperature.present ? data.temperature.value : this.temperature,
      pulse: data.pulse.present ? data.pulse.value : this.pulse,
      notes: data.notes.present ? data.notes.value : this.notes,
      symptoms: data.symptoms.present ? data.symptoms.value : this.symptoms,
      medications:
          data.medications.present ? data.medications.value : this.medications,
      diagnosis: data.diagnosis.present ? data.diagnosis.value : this.diagnosis,
      recommendations: data.recommendations.present
          ? data.recommendations.value
          : this.recommendations,
      visitDate: data.visitDate.present ? data.visitDate.value : this.visitDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HealthRecord(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('bloodPressure: $bloodPressure, ')
          ..write('temperature: $temperature, ')
          ..write('pulse: $pulse, ')
          ..write('notes: $notes, ')
          ..write('symptoms: $symptoms, ')
          ..write('medications: $medications, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('recommendations: $recommendations, ')
          ..write('visitDate: $visitDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      patientId,
      weight,
      height,
      bloodPressure,
      temperature,
      pulse,
      notes,
      symptoms,
      medications,
      diagnosis,
      recommendations,
      visitDate,
      createdAt,
      createdBy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthRecord &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.weight == this.weight &&
          other.height == this.height &&
          other.bloodPressure == this.bloodPressure &&
          other.temperature == this.temperature &&
          other.pulse == this.pulse &&
          other.notes == this.notes &&
          other.symptoms == this.symptoms &&
          other.medications == this.medications &&
          other.diagnosis == this.diagnosis &&
          other.recommendations == this.recommendations &&
          other.visitDate == this.visitDate &&
          other.createdAt == this.createdAt &&
          other.createdBy == this.createdBy);
}

class HealthRecordsCompanion extends UpdateCompanion<HealthRecord> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<double?> weight;
  final Value<double?> height;
  final Value<String?> bloodPressure;
  final Value<double?> temperature;
  final Value<String?> pulse;
  final Value<String?> notes;
  final Value<String?> symptoms;
  final Value<String?> medications;
  final Value<String?> diagnosis;
  final Value<String?> recommendations;
  final Value<DateTime> visitDate;
  final Value<DateTime> createdAt;
  final Value<String?> createdBy;
  final Value<int> rowid;
  const HealthRecordsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.bloodPressure = const Value.absent(),
    this.temperature = const Value.absent(),
    this.pulse = const Value.absent(),
    this.notes = const Value.absent(),
    this.symptoms = const Value.absent(),
    this.medications = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.recommendations = const Value.absent(),
    this.visitDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HealthRecordsCompanion.insert({
    required String id,
    required String patientId,
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.bloodPressure = const Value.absent(),
    this.temperature = const Value.absent(),
    this.pulse = const Value.absent(),
    this.notes = const Value.absent(),
    this.symptoms = const Value.absent(),
    this.medications = const Value.absent(),
    this.diagnosis = const Value.absent(),
    this.recommendations = const Value.absent(),
    this.visitDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        patientId = Value(patientId);
  static Insertable<HealthRecord> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<double>? weight,
    Expression<double>? height,
    Expression<String>? bloodPressure,
    Expression<double>? temperature,
    Expression<String>? pulse,
    Expression<String>? notes,
    Expression<String>? symptoms,
    Expression<String>? medications,
    Expression<String>? diagnosis,
    Expression<String>? recommendations,
    Expression<DateTime>? visitDate,
    Expression<DateTime>? createdAt,
    Expression<String>? createdBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (weight != null) 'weight': weight,
      if (height != null) 'height': height,
      if (bloodPressure != null) 'blood_pressure': bloodPressure,
      if (temperature != null) 'temperature': temperature,
      if (pulse != null) 'pulse': pulse,
      if (notes != null) 'notes': notes,
      if (symptoms != null) 'symptoms': symptoms,
      if (medications != null) 'medications': medications,
      if (diagnosis != null) 'diagnosis': diagnosis,
      if (recommendations != null) 'recommendations': recommendations,
      if (visitDate != null) 'visit_date': visitDate,
      if (createdAt != null) 'created_at': createdAt,
      if (createdBy != null) 'created_by': createdBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HealthRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? patientId,
      Value<double?>? weight,
      Value<double?>? height,
      Value<String?>? bloodPressure,
      Value<double?>? temperature,
      Value<String?>? pulse,
      Value<String?>? notes,
      Value<String?>? symptoms,
      Value<String?>? medications,
      Value<String?>? diagnosis,
      Value<String?>? recommendations,
      Value<DateTime>? visitDate,
      Value<DateTime>? createdAt,
      Value<String?>? createdBy,
      Value<int>? rowid}) {
    return HealthRecordsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      bloodPressure: bloodPressure ?? this.bloodPressure,
      temperature: temperature ?? this.temperature,
      pulse: pulse ?? this.pulse,
      notes: notes ?? this.notes,
      symptoms: symptoms ?? this.symptoms,
      medications: medications ?? this.medications,
      diagnosis: diagnosis ?? this.diagnosis,
      recommendations: recommendations ?? this.recommendations,
      visitDate: visitDate ?? this.visitDate,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (bloodPressure.present) {
      map['blood_pressure'] = Variable<String>(bloodPressure.value);
    }
    if (temperature.present) {
      map['temperature'] = Variable<double>(temperature.value);
    }
    if (pulse.present) {
      map['pulse'] = Variable<String>(pulse.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (symptoms.present) {
      map['symptoms'] = Variable<String>(symptoms.value);
    }
    if (medications.present) {
      map['medications'] = Variable<String>(medications.value);
    }
    if (diagnosis.present) {
      map['diagnosis'] = Variable<String>(diagnosis.value);
    }
    if (recommendations.present) {
      map['recommendations'] = Variable<String>(recommendations.value);
    }
    if (visitDate.present) {
      map['visit_date'] = Variable<DateTime>(visitDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthRecordsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('bloodPressure: $bloodPressure, ')
          ..write('temperature: $temperature, ')
          ..write('pulse: $pulse, ')
          ..write('notes: $notes, ')
          ..write('symptoms: $symptoms, ')
          ..write('medications: $medications, ')
          ..write('diagnosis: $diagnosis, ')
          ..write('recommendations: $recommendations, ')
          ..write('visitDate: $visitDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppointmentsTable extends Appointments
    with TableInfo<$AppointmentsTable, Appointment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppointmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES patients (id)'));
  static const VerificationMeta _appointmentDateMeta =
      const VerificationMeta('appointmentDate');
  @override
  late final GeneratedColumn<DateTime> appointmentDate =
      GeneratedColumn<DateTime>('appointment_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _appointmentTimeMeta =
      const VerificationMeta('appointmentTime');
  @override
  late final GeneratedColumn<String> appointmentTime = GeneratedColumn<String>(
      'appointment_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isRemindedMeta =
      const VerificationMeta('isReminded');
  @override
  late final GeneratedColumn<bool> isReminded = GeneratedColumn<bool>(
      'is_reminded', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_reminded" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        patientId,
        appointmentDate,
        appointmentTime,
        type,
        notes,
        isCompleted,
        isReminded,
        createdAt,
        createdBy
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'appointments';
  @override
  VerificationContext validateIntegrity(Insertable<Appointment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('appointment_date')) {
      context.handle(
          _appointmentDateMeta,
          appointmentDate.isAcceptableOrUnknown(
              data['appointment_date']!, _appointmentDateMeta));
    } else if (isInserting) {
      context.missing(_appointmentDateMeta);
    }
    if (data.containsKey('appointment_time')) {
      context.handle(
          _appointmentTimeMeta,
          appointmentTime.isAcceptableOrUnknown(
              data['appointment_time']!, _appointmentTimeMeta));
    } else if (isInserting) {
      context.missing(_appointmentTimeMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('is_reminded')) {
      context.handle(
          _isRemindedMeta,
          isReminded.isAcceptableOrUnknown(
              data['is_reminded']!, _isRemindedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Appointment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Appointment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      appointmentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}appointment_date'])!,
      appointmentTime: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}appointment_time'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      isReminded: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_reminded'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by']),
    );
  }

  @override
  $AppointmentsTable createAlias(String alias) {
    return $AppointmentsTable(attachedDatabase, alias);
  }
}

class Appointment extends DataClass implements Insertable<Appointment> {
  final String id;
  final String patientId;
  final DateTime appointmentDate;
  final String appointmentTime;
  final String type;
  final String? notes;
  final bool isCompleted;
  final bool isReminded;
  final DateTime createdAt;
  final String? createdBy;
  const Appointment(
      {required this.id,
      required this.patientId,
      required this.appointmentDate,
      required this.appointmentTime,
      required this.type,
      this.notes,
      required this.isCompleted,
      required this.isReminded,
      required this.createdAt,
      this.createdBy});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    map['appointment_date'] = Variable<DateTime>(appointmentDate);
    map['appointment_time'] = Variable<String>(appointmentTime);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    map['is_reminded'] = Variable<bool>(isReminded);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    return map;
  }

  AppointmentsCompanion toCompanion(bool nullToAbsent) {
    return AppointmentsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      appointmentDate: Value(appointmentDate),
      appointmentTime: Value(appointmentTime),
      type: Value(type),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isCompleted: Value(isCompleted),
      isReminded: Value(isReminded),
      createdAt: Value(createdAt),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
    );
  }

  factory Appointment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Appointment(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      appointmentDate: serializer.fromJson<DateTime>(json['appointmentDate']),
      appointmentTime: serializer.fromJson<String>(json['appointmentTime']),
      type: serializer.fromJson<String>(json['type']),
      notes: serializer.fromJson<String?>(json['notes']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      isReminded: serializer.fromJson<bool>(json['isReminded']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'appointmentDate': serializer.toJson<DateTime>(appointmentDate),
      'appointmentTime': serializer.toJson<String>(appointmentTime),
      'type': serializer.toJson<String>(type),
      'notes': serializer.toJson<String?>(notes),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'isReminded': serializer.toJson<bool>(isReminded),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'createdBy': serializer.toJson<String?>(createdBy),
    };
  }

  Appointment copyWith(
          {String? id,
          String? patientId,
          DateTime? appointmentDate,
          String? appointmentTime,
          String? type,
          Value<String?> notes = const Value.absent(),
          bool? isCompleted,
          bool? isReminded,
          DateTime? createdAt,
          Value<String?> createdBy = const Value.absent()}) =>
      Appointment(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        appointmentDate: appointmentDate ?? this.appointmentDate,
        appointmentTime: appointmentTime ?? this.appointmentTime,
        type: type ?? this.type,
        notes: notes.present ? notes.value : this.notes,
        isCompleted: isCompleted ?? this.isCompleted,
        isReminded: isReminded ?? this.isReminded,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
      );
  Appointment copyWithCompanion(AppointmentsCompanion data) {
    return Appointment(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      appointmentDate: data.appointmentDate.present
          ? data.appointmentDate.value
          : this.appointmentDate,
      appointmentTime: data.appointmentTime.present
          ? data.appointmentTime.value
          : this.appointmentTime,
      type: data.type.present ? data.type.value : this.type,
      notes: data.notes.present ? data.notes.value : this.notes,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      isReminded:
          data.isReminded.present ? data.isReminded.value : this.isReminded,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Appointment(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('appointmentDate: $appointmentDate, ')
          ..write('appointmentTime: $appointmentTime, ')
          ..write('type: $type, ')
          ..write('notes: $notes, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isReminded: $isReminded, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      patientId,
      appointmentDate,
      appointmentTime,
      type,
      notes,
      isCompleted,
      isReminded,
      createdAt,
      createdBy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Appointment &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.appointmentDate == this.appointmentDate &&
          other.appointmentTime == this.appointmentTime &&
          other.type == this.type &&
          other.notes == this.notes &&
          other.isCompleted == this.isCompleted &&
          other.isReminded == this.isReminded &&
          other.createdAt == this.createdAt &&
          other.createdBy == this.createdBy);
}

class AppointmentsCompanion extends UpdateCompanion<Appointment> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<DateTime> appointmentDate;
  final Value<String> appointmentTime;
  final Value<String> type;
  final Value<String?> notes;
  final Value<bool> isCompleted;
  final Value<bool> isReminded;
  final Value<DateTime> createdAt;
  final Value<String?> createdBy;
  final Value<int> rowid;
  const AppointmentsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.appointmentDate = const Value.absent(),
    this.appointmentTime = const Value.absent(),
    this.type = const Value.absent(),
    this.notes = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isReminded = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppointmentsCompanion.insert({
    required String id,
    required String patientId,
    required DateTime appointmentDate,
    required String appointmentTime,
    required String type,
    this.notes = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.isReminded = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        patientId = Value(patientId),
        appointmentDate = Value(appointmentDate),
        appointmentTime = Value(appointmentTime),
        type = Value(type);
  static Insertable<Appointment> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<DateTime>? appointmentDate,
    Expression<String>? appointmentTime,
    Expression<String>? type,
    Expression<String>? notes,
    Expression<bool>? isCompleted,
    Expression<bool>? isReminded,
    Expression<DateTime>? createdAt,
    Expression<String>? createdBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (appointmentDate != null) 'appointment_date': appointmentDate,
      if (appointmentTime != null) 'appointment_time': appointmentTime,
      if (type != null) 'type': type,
      if (notes != null) 'notes': notes,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (isReminded != null) 'is_reminded': isReminded,
      if (createdAt != null) 'created_at': createdAt,
      if (createdBy != null) 'created_by': createdBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppointmentsCompanion copyWith(
      {Value<String>? id,
      Value<String>? patientId,
      Value<DateTime>? appointmentDate,
      Value<String>? appointmentTime,
      Value<String>? type,
      Value<String?>? notes,
      Value<bool>? isCompleted,
      Value<bool>? isReminded,
      Value<DateTime>? createdAt,
      Value<String?>? createdBy,
      Value<int>? rowid}) {
    return AppointmentsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      appointmentTime: appointmentTime ?? this.appointmentTime,
      type: type ?? this.type,
      notes: notes ?? this.notes,
      isCompleted: isCompleted ?? this.isCompleted,
      isReminded: isReminded ?? this.isReminded,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (appointmentDate.present) {
      map['appointment_date'] = Variable<DateTime>(appointmentDate.value);
    }
    if (appointmentTime.present) {
      map['appointment_time'] = Variable<String>(appointmentTime.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (isReminded.present) {
      map['is_reminded'] = Variable<bool>(isReminded.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('appointmentDate: $appointmentDate, ')
          ..write('appointmentTime: $appointmentTime, ')
          ..write('type: $type, ')
          ..write('notes: $notes, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('isReminded: $isReminded, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AshaWorkersTable extends AshaWorkers
    with TableInfo<$AshaWorkersTable, AshaWorker> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AshaWorkersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _villageMeta =
      const VerificationMeta('village');
  @override
  late final GeneratedColumn<String> village = GeneratedColumn<String>(
      'village', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _blockMeta = const VerificationMeta('block');
  @override
  late final GeneratedColumn<String> block = GeneratedColumn<String>(
      'block', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _districtMeta =
      const VerificationMeta('district');
  @override
  late final GeneratedColumn<String> district = GeneratedColumn<String>(
      'district', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _lastLoginMeta =
      const VerificationMeta('lastLogin');
  @override
  late final GeneratedColumn<DateTime> lastLogin = GeneratedColumn<DateTime>(
      'last_login', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        phone,
        village,
        block,
        district,
        state,
        isActive,
        lastLogin,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'asha_workers';
  @override
  VerificationContext validateIntegrity(Insertable<AshaWorker> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('village')) {
      context.handle(_villageMeta,
          village.isAcceptableOrUnknown(data['village']!, _villageMeta));
    }
    if (data.containsKey('block')) {
      context.handle(
          _blockMeta, block.isAcceptableOrUnknown(data['block']!, _blockMeta));
    }
    if (data.containsKey('district')) {
      context.handle(_districtMeta,
          district.isAcceptableOrUnknown(data['district']!, _districtMeta));
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('last_login')) {
      context.handle(_lastLoginMeta,
          lastLogin.isAcceptableOrUnknown(data['last_login']!, _lastLoginMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AshaWorker map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AshaWorker(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      village: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}village']),
      block: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}block']),
      district: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}district']),
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      lastLogin: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_login']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AshaWorkersTable createAlias(String alias) {
    return $AshaWorkersTable(attachedDatabase, alias);
  }
}

class AshaWorker extends DataClass implements Insertable<AshaWorker> {
  final String id;
  final String name;
  final String phone;
  final String? village;
  final String? block;
  final String? district;
  final String? state;
  final bool isActive;
  final DateTime? lastLogin;
  final DateTime createdAt;
  const AshaWorker(
      {required this.id,
      required this.name,
      required this.phone,
      this.village,
      this.block,
      this.district,
      this.state,
      required this.isActive,
      this.lastLogin,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    if (!nullToAbsent || village != null) {
      map['village'] = Variable<String>(village);
    }
    if (!nullToAbsent || block != null) {
      map['block'] = Variable<String>(block);
    }
    if (!nullToAbsent || district != null) {
      map['district'] = Variable<String>(district);
    }
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || lastLogin != null) {
      map['last_login'] = Variable<DateTime>(lastLogin);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AshaWorkersCompanion toCompanion(bool nullToAbsent) {
    return AshaWorkersCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      village: village == null && nullToAbsent
          ? const Value.absent()
          : Value(village),
      block:
          block == null && nullToAbsent ? const Value.absent() : Value(block),
      district: district == null && nullToAbsent
          ? const Value.absent()
          : Value(district),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      isActive: Value(isActive),
      lastLogin: lastLogin == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLogin),
      createdAt: Value(createdAt),
    );
  }

  factory AshaWorker.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AshaWorker(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      village: serializer.fromJson<String?>(json['village']),
      block: serializer.fromJson<String?>(json['block']),
      district: serializer.fromJson<String?>(json['district']),
      state: serializer.fromJson<String?>(json['state']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      lastLogin: serializer.fromJson<DateTime?>(json['lastLogin']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'village': serializer.toJson<String?>(village),
      'block': serializer.toJson<String?>(block),
      'district': serializer.toJson<String?>(district),
      'state': serializer.toJson<String?>(state),
      'isActive': serializer.toJson<bool>(isActive),
      'lastLogin': serializer.toJson<DateTime?>(lastLogin),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AshaWorker copyWith(
          {String? id,
          String? name,
          String? phone,
          Value<String?> village = const Value.absent(),
          Value<String?> block = const Value.absent(),
          Value<String?> district = const Value.absent(),
          Value<String?> state = const Value.absent(),
          bool? isActive,
          Value<DateTime?> lastLogin = const Value.absent(),
          DateTime? createdAt}) =>
      AshaWorker(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        village: village.present ? village.value : this.village,
        block: block.present ? block.value : this.block,
        district: district.present ? district.value : this.district,
        state: state.present ? state.value : this.state,
        isActive: isActive ?? this.isActive,
        lastLogin: lastLogin.present ? lastLogin.value : this.lastLogin,
        createdAt: createdAt ?? this.createdAt,
      );
  AshaWorker copyWithCompanion(AshaWorkersCompanion data) {
    return AshaWorker(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      village: data.village.present ? data.village.value : this.village,
      block: data.block.present ? data.block.value : this.block,
      district: data.district.present ? data.district.value : this.district,
      state: data.state.present ? data.state.value : this.state,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      lastLogin: data.lastLogin.present ? data.lastLogin.value : this.lastLogin,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AshaWorker(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('village: $village, ')
          ..write('block: $block, ')
          ..write('district: $district, ')
          ..write('state: $state, ')
          ..write('isActive: $isActive, ')
          ..write('lastLogin: $lastLogin, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, village, block, district,
      state, isActive, lastLogin, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AshaWorker &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.village == this.village &&
          other.block == this.block &&
          other.district == this.district &&
          other.state == this.state &&
          other.isActive == this.isActive &&
          other.lastLogin == this.lastLogin &&
          other.createdAt == this.createdAt);
}

class AshaWorkersCompanion extends UpdateCompanion<AshaWorker> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String?> village;
  final Value<String?> block;
  final Value<String?> district;
  final Value<String?> state;
  final Value<bool> isActive;
  final Value<DateTime?> lastLogin;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AshaWorkersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.village = const Value.absent(),
    this.block = const Value.absent(),
    this.district = const Value.absent(),
    this.state = const Value.absent(),
    this.isActive = const Value.absent(),
    this.lastLogin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AshaWorkersCompanion.insert({
    required String id,
    required String name,
    required String phone,
    this.village = const Value.absent(),
    this.block = const Value.absent(),
    this.district = const Value.absent(),
    this.state = const Value.absent(),
    this.isActive = const Value.absent(),
    this.lastLogin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        phone = Value(phone);
  static Insertable<AshaWorker> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? village,
    Expression<String>? block,
    Expression<String>? district,
    Expression<String>? state,
    Expression<bool>? isActive,
    Expression<DateTime>? lastLogin,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (village != null) 'village': village,
      if (block != null) 'block': block,
      if (district != null) 'district': district,
      if (state != null) 'state': state,
      if (isActive != null) 'is_active': isActive,
      if (lastLogin != null) 'last_login': lastLogin,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AshaWorkersCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? phone,
      Value<String?>? village,
      Value<String?>? block,
      Value<String?>? district,
      Value<String?>? state,
      Value<bool>? isActive,
      Value<DateTime?>? lastLogin,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return AshaWorkersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      village: village ?? this.village,
      block: block ?? this.block,
      district: district ?? this.district,
      state: state ?? this.state,
      isActive: isActive ?? this.isActive,
      lastLogin: lastLogin ?? this.lastLogin,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (village.present) {
      map['village'] = Variable<String>(village.value);
    }
    if (block.present) {
      map['block'] = Variable<String>(block.value);
    }
    if (district.present) {
      map['district'] = Variable<String>(district.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (lastLogin.present) {
      map['last_login'] = Variable<DateTime>(lastLogin.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AshaWorkersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('village: $village, ')
          ..write('block: $block, ')
          ..write('district: $district, ')
          ..write('state: $state, ')
          ..write('isActive: $isActive, ')
          ..write('lastLogin: $lastLogin, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ImmunizationsTable extends Immunizations
    with TableInfo<$ImmunizationsTable, Immunization> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImmunizationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES patients (id)'));
  static const VerificationMeta _vaccineNameMeta =
      const VerificationMeta('vaccineName');
  @override
  late final GeneratedColumn<String> vaccineName = GeneratedColumn<String>(
      'vaccine_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _givenDateMeta =
      const VerificationMeta('givenDate');
  @override
  late final GeneratedColumn<DateTime> givenDate = GeneratedColumn<DateTime>(
      'given_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<DateTime> dueDate = GeneratedColumn<DateTime>(
      'due_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _batchNumberMeta =
      const VerificationMeta('batchNumber');
  @override
  late final GeneratedColumn<String> batchNumber = GeneratedColumn<String>(
      'batch_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        patientId,
        vaccineName,
        givenDate,
        dueDate,
        batchNumber,
        notes,
        isCompleted,
        createdAt,
        createdBy
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'immunizations';
  @override
  VerificationContext validateIntegrity(Insertable<Immunization> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('vaccine_name')) {
      context.handle(
          _vaccineNameMeta,
          vaccineName.isAcceptableOrUnknown(
              data['vaccine_name']!, _vaccineNameMeta));
    } else if (isInserting) {
      context.missing(_vaccineNameMeta);
    }
    if (data.containsKey('given_date')) {
      context.handle(_givenDateMeta,
          givenDate.isAcceptableOrUnknown(data['given_date']!, _givenDateMeta));
    } else if (isInserting) {
      context.missing(_givenDateMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    }
    if (data.containsKey('batch_number')) {
      context.handle(
          _batchNumberMeta,
          batchNumber.isAcceptableOrUnknown(
              data['batch_number']!, _batchNumberMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Immunization map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Immunization(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      vaccineName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vaccine_name'])!,
      givenDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}given_date'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}due_date']),
      batchNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}batch_number']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by']),
    );
  }

  @override
  $ImmunizationsTable createAlias(String alias) {
    return $ImmunizationsTable(attachedDatabase, alias);
  }
}

class Immunization extends DataClass implements Insertable<Immunization> {
  final String id;
  final String patientId;
  final String vaccineName;
  final DateTime givenDate;
  final DateTime? dueDate;
  final String? batchNumber;
  final String? notes;
  final bool isCompleted;
  final DateTime createdAt;
  final String? createdBy;
  const Immunization(
      {required this.id,
      required this.patientId,
      required this.vaccineName,
      required this.givenDate,
      this.dueDate,
      this.batchNumber,
      this.notes,
      required this.isCompleted,
      required this.createdAt,
      this.createdBy});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    map['vaccine_name'] = Variable<String>(vaccineName);
    map['given_date'] = Variable<DateTime>(givenDate);
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<DateTime>(dueDate);
    }
    if (!nullToAbsent || batchNumber != null) {
      map['batch_number'] = Variable<String>(batchNumber);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    return map;
  }

  ImmunizationsCompanion toCompanion(bool nullToAbsent) {
    return ImmunizationsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      vaccineName: Value(vaccineName),
      givenDate: Value(givenDate),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      batchNumber: batchNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(batchNumber),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isCompleted: Value(isCompleted),
      createdAt: Value(createdAt),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
    );
  }

  factory Immunization.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Immunization(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      vaccineName: serializer.fromJson<String>(json['vaccineName']),
      givenDate: serializer.fromJson<DateTime>(json['givenDate']),
      dueDate: serializer.fromJson<DateTime?>(json['dueDate']),
      batchNumber: serializer.fromJson<String?>(json['batchNumber']),
      notes: serializer.fromJson<String?>(json['notes']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'vaccineName': serializer.toJson<String>(vaccineName),
      'givenDate': serializer.toJson<DateTime>(givenDate),
      'dueDate': serializer.toJson<DateTime?>(dueDate),
      'batchNumber': serializer.toJson<String?>(batchNumber),
      'notes': serializer.toJson<String?>(notes),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'createdBy': serializer.toJson<String?>(createdBy),
    };
  }

  Immunization copyWith(
          {String? id,
          String? patientId,
          String? vaccineName,
          DateTime? givenDate,
          Value<DateTime?> dueDate = const Value.absent(),
          Value<String?> batchNumber = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? isCompleted,
          DateTime? createdAt,
          Value<String?> createdBy = const Value.absent()}) =>
      Immunization(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        vaccineName: vaccineName ?? this.vaccineName,
        givenDate: givenDate ?? this.givenDate,
        dueDate: dueDate.present ? dueDate.value : this.dueDate,
        batchNumber: batchNumber.present ? batchNumber.value : this.batchNumber,
        notes: notes.present ? notes.value : this.notes,
        isCompleted: isCompleted ?? this.isCompleted,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
      );
  Immunization copyWithCompanion(ImmunizationsCompanion data) {
    return Immunization(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      vaccineName:
          data.vaccineName.present ? data.vaccineName.value : this.vaccineName,
      givenDate: data.givenDate.present ? data.givenDate.value : this.givenDate,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      batchNumber:
          data.batchNumber.present ? data.batchNumber.value : this.batchNumber,
      notes: data.notes.present ? data.notes.value : this.notes,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Immunization(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('vaccineName: $vaccineName, ')
          ..write('givenDate: $givenDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('batchNumber: $batchNumber, ')
          ..write('notes: $notes, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, patientId, vaccineName, givenDate,
      dueDate, batchNumber, notes, isCompleted, createdAt, createdBy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Immunization &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.vaccineName == this.vaccineName &&
          other.givenDate == this.givenDate &&
          other.dueDate == this.dueDate &&
          other.batchNumber == this.batchNumber &&
          other.notes == this.notes &&
          other.isCompleted == this.isCompleted &&
          other.createdAt == this.createdAt &&
          other.createdBy == this.createdBy);
}

class ImmunizationsCompanion extends UpdateCompanion<Immunization> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<String> vaccineName;
  final Value<DateTime> givenDate;
  final Value<DateTime?> dueDate;
  final Value<String?> batchNumber;
  final Value<String?> notes;
  final Value<bool> isCompleted;
  final Value<DateTime> createdAt;
  final Value<String?> createdBy;
  final Value<int> rowid;
  const ImmunizationsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.vaccineName = const Value.absent(),
    this.givenDate = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.batchNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ImmunizationsCompanion.insert({
    required String id,
    required String patientId,
    required String vaccineName,
    required DateTime givenDate,
    this.dueDate = const Value.absent(),
    this.batchNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        patientId = Value(patientId),
        vaccineName = Value(vaccineName),
        givenDate = Value(givenDate);
  static Insertable<Immunization> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<String>? vaccineName,
    Expression<DateTime>? givenDate,
    Expression<DateTime>? dueDate,
    Expression<String>? batchNumber,
    Expression<String>? notes,
    Expression<bool>? isCompleted,
    Expression<DateTime>? createdAt,
    Expression<String>? createdBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (vaccineName != null) 'vaccine_name': vaccineName,
      if (givenDate != null) 'given_date': givenDate,
      if (dueDate != null) 'due_date': dueDate,
      if (batchNumber != null) 'batch_number': batchNumber,
      if (notes != null) 'notes': notes,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (createdAt != null) 'created_at': createdAt,
      if (createdBy != null) 'created_by': createdBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ImmunizationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? patientId,
      Value<String>? vaccineName,
      Value<DateTime>? givenDate,
      Value<DateTime?>? dueDate,
      Value<String?>? batchNumber,
      Value<String?>? notes,
      Value<bool>? isCompleted,
      Value<DateTime>? createdAt,
      Value<String?>? createdBy,
      Value<int>? rowid}) {
    return ImmunizationsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      vaccineName: vaccineName ?? this.vaccineName,
      givenDate: givenDate ?? this.givenDate,
      dueDate: dueDate ?? this.dueDate,
      batchNumber: batchNumber ?? this.batchNumber,
      notes: notes ?? this.notes,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (vaccineName.present) {
      map['vaccine_name'] = Variable<String>(vaccineName.value);
    }
    if (givenDate.present) {
      map['given_date'] = Variable<DateTime>(givenDate.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<DateTime>(dueDate.value);
    }
    if (batchNumber.present) {
      map['batch_number'] = Variable<String>(batchNumber.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImmunizationsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('vaccineName: $vaccineName, ')
          ..write('givenDate: $givenDate, ')
          ..write('dueDate: $dueDate, ')
          ..write('batchNumber: $batchNumber, ')
          ..write('notes: $notes, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MaternalHealthRecordsTable extends MaternalHealthRecords
    with TableInfo<$MaternalHealthRecordsTable, MaternalHealthRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MaternalHealthRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES patients (id)'));
  static const VerificationMeta _pregnancyNumberMeta =
      const VerificationMeta('pregnancyNumber');
  @override
  late final GeneratedColumn<int> pregnancyNumber = GeneratedColumn<int>(
      'pregnancy_number', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lmpDateMeta =
      const VerificationMeta('lmpDate');
  @override
  late final GeneratedColumn<DateTime> lmpDate = GeneratedColumn<DateTime>(
      'lmp_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _eddDateMeta =
      const VerificationMeta('eddDate');
  @override
  late final GeneratedColumn<DateTime> eddDate = GeneratedColumn<DateTime>(
      'edd_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _gestationalAgeMeta =
      const VerificationMeta('gestationalAge');
  @override
  late final GeneratedColumn<int> gestationalAge = GeneratedColumn<int>(
      'gestational_age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _hemoglobinMeta =
      const VerificationMeta('hemoglobin');
  @override
  late final GeneratedColumn<double> hemoglobin = GeneratedColumn<double>(
      'hemoglobin', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _bloodGroupMeta =
      const VerificationMeta('bloodGroup');
  @override
  late final GeneratedColumn<String> bloodGroup = GeneratedColumn<String>(
      'blood_group', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _highRiskPregnancyMeta =
      const VerificationMeta('highRiskPregnancy');
  @override
  late final GeneratedColumn<bool> highRiskPregnancy = GeneratedColumn<bool>(
      'high_risk_pregnancy', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("high_risk_pregnancy" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _riskFactorsMeta =
      const VerificationMeta('riskFactors');
  @override
  late final GeneratedColumn<String> riskFactors = GeneratedColumn<String>(
      'risk_factors', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _complicationsMeta =
      const VerificationMeta('complications');
  @override
  late final GeneratedColumn<String> complications = GeneratedColumn<String>(
      'complications', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ancVisitsMeta =
      const VerificationMeta('ancVisits');
  @override
  late final GeneratedColumn<int> ancVisits = GeneratedColumn<int>(
      'anc_visits', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastAncDateMeta =
      const VerificationMeta('lastAncDate');
  @override
  late final GeneratedColumn<DateTime> lastAncDate = GeneratedColumn<DateTime>(
      'last_anc_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deliveryDateMeta =
      const VerificationMeta('deliveryDate');
  @override
  late final GeneratedColumn<DateTime> deliveryDate = GeneratedColumn<DateTime>(
      'delivery_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deliveryTypeMeta =
      const VerificationMeta('deliveryType');
  @override
  late final GeneratedColumn<String> deliveryType = GeneratedColumn<String>(
      'delivery_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deliveryLocationMeta =
      const VerificationMeta('deliveryLocation');
  @override
  late final GeneratedColumn<String> deliveryLocation = GeneratedColumn<String>(
      'delivery_location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _babyWeightMeta =
      const VerificationMeta('babyWeight');
  @override
  late final GeneratedColumn<double> babyWeight = GeneratedColumn<double>(
      'baby_weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        patientId,
        pregnancyNumber,
        lmpDate,
        eddDate,
        gestationalAge,
        hemoglobin,
        bloodGroup,
        highRiskPregnancy,
        riskFactors,
        complications,
        ancVisits,
        lastAncDate,
        deliveryDate,
        deliveryType,
        deliveryLocation,
        babyWeight,
        createdAt,
        createdBy
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'maternal_health_records';
  @override
  VerificationContext validateIntegrity(
      Insertable<MaternalHealthRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('pregnancy_number')) {
      context.handle(
          _pregnancyNumberMeta,
          pregnancyNumber.isAcceptableOrUnknown(
              data['pregnancy_number']!, _pregnancyNumberMeta));
    }
    if (data.containsKey('lmp_date')) {
      context.handle(_lmpDateMeta,
          lmpDate.isAcceptableOrUnknown(data['lmp_date']!, _lmpDateMeta));
    }
    if (data.containsKey('edd_date')) {
      context.handle(_eddDateMeta,
          eddDate.isAcceptableOrUnknown(data['edd_date']!, _eddDateMeta));
    }
    if (data.containsKey('gestational_age')) {
      context.handle(
          _gestationalAgeMeta,
          gestationalAge.isAcceptableOrUnknown(
              data['gestational_age']!, _gestationalAgeMeta));
    }
    if (data.containsKey('hemoglobin')) {
      context.handle(
          _hemoglobinMeta,
          hemoglobin.isAcceptableOrUnknown(
              data['hemoglobin']!, _hemoglobinMeta));
    }
    if (data.containsKey('blood_group')) {
      context.handle(
          _bloodGroupMeta,
          bloodGroup.isAcceptableOrUnknown(
              data['blood_group']!, _bloodGroupMeta));
    }
    if (data.containsKey('high_risk_pregnancy')) {
      context.handle(
          _highRiskPregnancyMeta,
          highRiskPregnancy.isAcceptableOrUnknown(
              data['high_risk_pregnancy']!, _highRiskPregnancyMeta));
    }
    if (data.containsKey('risk_factors')) {
      context.handle(
          _riskFactorsMeta,
          riskFactors.isAcceptableOrUnknown(
              data['risk_factors']!, _riskFactorsMeta));
    }
    if (data.containsKey('complications')) {
      context.handle(
          _complicationsMeta,
          complications.isAcceptableOrUnknown(
              data['complications']!, _complicationsMeta));
    }
    if (data.containsKey('anc_visits')) {
      context.handle(_ancVisitsMeta,
          ancVisits.isAcceptableOrUnknown(data['anc_visits']!, _ancVisitsMeta));
    }
    if (data.containsKey('last_anc_date')) {
      context.handle(
          _lastAncDateMeta,
          lastAncDate.isAcceptableOrUnknown(
              data['last_anc_date']!, _lastAncDateMeta));
    }
    if (data.containsKey('delivery_date')) {
      context.handle(
          _deliveryDateMeta,
          deliveryDate.isAcceptableOrUnknown(
              data['delivery_date']!, _deliveryDateMeta));
    }
    if (data.containsKey('delivery_type')) {
      context.handle(
          _deliveryTypeMeta,
          deliveryType.isAcceptableOrUnknown(
              data['delivery_type']!, _deliveryTypeMeta));
    }
    if (data.containsKey('delivery_location')) {
      context.handle(
          _deliveryLocationMeta,
          deliveryLocation.isAcceptableOrUnknown(
              data['delivery_location']!, _deliveryLocationMeta));
    }
    if (data.containsKey('baby_weight')) {
      context.handle(
          _babyWeightMeta,
          babyWeight.isAcceptableOrUnknown(
              data['baby_weight']!, _babyWeightMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MaternalHealthRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MaternalHealthRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      pregnancyNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pregnancy_number']),
      lmpDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}lmp_date']),
      eddDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}edd_date']),
      gestationalAge: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gestational_age']),
      hemoglobin: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}hemoglobin']),
      bloodGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}blood_group']),
      highRiskPregnancy: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}high_risk_pregnancy'])!,
      riskFactors: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}risk_factors']),
      complications: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}complications']),
      ancVisits: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}anc_visits'])!,
      lastAncDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_anc_date']),
      deliveryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}delivery_date']),
      deliveryType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}delivery_type']),
      deliveryLocation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}delivery_location']),
      babyWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}baby_weight']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by']),
    );
  }

  @override
  $MaternalHealthRecordsTable createAlias(String alias) {
    return $MaternalHealthRecordsTable(attachedDatabase, alias);
  }
}

class MaternalHealthRecord extends DataClass
    implements Insertable<MaternalHealthRecord> {
  final String id;
  final String patientId;
  final int? pregnancyNumber;
  final DateTime? lmpDate;
  final DateTime? eddDate;
  final int? gestationalAge;
  final double? hemoglobin;
  final String? bloodGroup;
  final bool highRiskPregnancy;
  final String? riskFactors;
  final String? complications;
  final int ancVisits;
  final DateTime? lastAncDate;
  final DateTime? deliveryDate;
  final String? deliveryType;
  final String? deliveryLocation;
  final double? babyWeight;
  final DateTime createdAt;
  final String? createdBy;
  const MaternalHealthRecord(
      {required this.id,
      required this.patientId,
      this.pregnancyNumber,
      this.lmpDate,
      this.eddDate,
      this.gestationalAge,
      this.hemoglobin,
      this.bloodGroup,
      required this.highRiskPregnancy,
      this.riskFactors,
      this.complications,
      required this.ancVisits,
      this.lastAncDate,
      this.deliveryDate,
      this.deliveryType,
      this.deliveryLocation,
      this.babyWeight,
      required this.createdAt,
      this.createdBy});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    if (!nullToAbsent || pregnancyNumber != null) {
      map['pregnancy_number'] = Variable<int>(pregnancyNumber);
    }
    if (!nullToAbsent || lmpDate != null) {
      map['lmp_date'] = Variable<DateTime>(lmpDate);
    }
    if (!nullToAbsent || eddDate != null) {
      map['edd_date'] = Variable<DateTime>(eddDate);
    }
    if (!nullToAbsent || gestationalAge != null) {
      map['gestational_age'] = Variable<int>(gestationalAge);
    }
    if (!nullToAbsent || hemoglobin != null) {
      map['hemoglobin'] = Variable<double>(hemoglobin);
    }
    if (!nullToAbsent || bloodGroup != null) {
      map['blood_group'] = Variable<String>(bloodGroup);
    }
    map['high_risk_pregnancy'] = Variable<bool>(highRiskPregnancy);
    if (!nullToAbsent || riskFactors != null) {
      map['risk_factors'] = Variable<String>(riskFactors);
    }
    if (!nullToAbsent || complications != null) {
      map['complications'] = Variable<String>(complications);
    }
    map['anc_visits'] = Variable<int>(ancVisits);
    if (!nullToAbsent || lastAncDate != null) {
      map['last_anc_date'] = Variable<DateTime>(lastAncDate);
    }
    if (!nullToAbsent || deliveryDate != null) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate);
    }
    if (!nullToAbsent || deliveryType != null) {
      map['delivery_type'] = Variable<String>(deliveryType);
    }
    if (!nullToAbsent || deliveryLocation != null) {
      map['delivery_location'] = Variable<String>(deliveryLocation);
    }
    if (!nullToAbsent || babyWeight != null) {
      map['baby_weight'] = Variable<double>(babyWeight);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    return map;
  }

  MaternalHealthRecordsCompanion toCompanion(bool nullToAbsent) {
    return MaternalHealthRecordsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      pregnancyNumber: pregnancyNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(pregnancyNumber),
      lmpDate: lmpDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lmpDate),
      eddDate: eddDate == null && nullToAbsent
          ? const Value.absent()
          : Value(eddDate),
      gestationalAge: gestationalAge == null && nullToAbsent
          ? const Value.absent()
          : Value(gestationalAge),
      hemoglobin: hemoglobin == null && nullToAbsent
          ? const Value.absent()
          : Value(hemoglobin),
      bloodGroup: bloodGroup == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodGroup),
      highRiskPregnancy: Value(highRiskPregnancy),
      riskFactors: riskFactors == null && nullToAbsent
          ? const Value.absent()
          : Value(riskFactors),
      complications: complications == null && nullToAbsent
          ? const Value.absent()
          : Value(complications),
      ancVisits: Value(ancVisits),
      lastAncDate: lastAncDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAncDate),
      deliveryDate: deliveryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryDate),
      deliveryType: deliveryType == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryType),
      deliveryLocation: deliveryLocation == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryLocation),
      babyWeight: babyWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(babyWeight),
      createdAt: Value(createdAt),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
    );
  }

  factory MaternalHealthRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MaternalHealthRecord(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      pregnancyNumber: serializer.fromJson<int?>(json['pregnancyNumber']),
      lmpDate: serializer.fromJson<DateTime?>(json['lmpDate']),
      eddDate: serializer.fromJson<DateTime?>(json['eddDate']),
      gestationalAge: serializer.fromJson<int?>(json['gestationalAge']),
      hemoglobin: serializer.fromJson<double?>(json['hemoglobin']),
      bloodGroup: serializer.fromJson<String?>(json['bloodGroup']),
      highRiskPregnancy: serializer.fromJson<bool>(json['highRiskPregnancy']),
      riskFactors: serializer.fromJson<String?>(json['riskFactors']),
      complications: serializer.fromJson<String?>(json['complications']),
      ancVisits: serializer.fromJson<int>(json['ancVisits']),
      lastAncDate: serializer.fromJson<DateTime?>(json['lastAncDate']),
      deliveryDate: serializer.fromJson<DateTime?>(json['deliveryDate']),
      deliveryType: serializer.fromJson<String?>(json['deliveryType']),
      deliveryLocation: serializer.fromJson<String?>(json['deliveryLocation']),
      babyWeight: serializer.fromJson<double?>(json['babyWeight']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'pregnancyNumber': serializer.toJson<int?>(pregnancyNumber),
      'lmpDate': serializer.toJson<DateTime?>(lmpDate),
      'eddDate': serializer.toJson<DateTime?>(eddDate),
      'gestationalAge': serializer.toJson<int?>(gestationalAge),
      'hemoglobin': serializer.toJson<double?>(hemoglobin),
      'bloodGroup': serializer.toJson<String?>(bloodGroup),
      'highRiskPregnancy': serializer.toJson<bool>(highRiskPregnancy),
      'riskFactors': serializer.toJson<String?>(riskFactors),
      'complications': serializer.toJson<String?>(complications),
      'ancVisits': serializer.toJson<int>(ancVisits),
      'lastAncDate': serializer.toJson<DateTime?>(lastAncDate),
      'deliveryDate': serializer.toJson<DateTime?>(deliveryDate),
      'deliveryType': serializer.toJson<String?>(deliveryType),
      'deliveryLocation': serializer.toJson<String?>(deliveryLocation),
      'babyWeight': serializer.toJson<double?>(babyWeight),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'createdBy': serializer.toJson<String?>(createdBy),
    };
  }

  MaternalHealthRecord copyWith(
          {String? id,
          String? patientId,
          Value<int?> pregnancyNumber = const Value.absent(),
          Value<DateTime?> lmpDate = const Value.absent(),
          Value<DateTime?> eddDate = const Value.absent(),
          Value<int?> gestationalAge = const Value.absent(),
          Value<double?> hemoglobin = const Value.absent(),
          Value<String?> bloodGroup = const Value.absent(),
          bool? highRiskPregnancy,
          Value<String?> riskFactors = const Value.absent(),
          Value<String?> complications = const Value.absent(),
          int? ancVisits,
          Value<DateTime?> lastAncDate = const Value.absent(),
          Value<DateTime?> deliveryDate = const Value.absent(),
          Value<String?> deliveryType = const Value.absent(),
          Value<String?> deliveryLocation = const Value.absent(),
          Value<double?> babyWeight = const Value.absent(),
          DateTime? createdAt,
          Value<String?> createdBy = const Value.absent()}) =>
      MaternalHealthRecord(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        pregnancyNumber: pregnancyNumber.present
            ? pregnancyNumber.value
            : this.pregnancyNumber,
        lmpDate: lmpDate.present ? lmpDate.value : this.lmpDate,
        eddDate: eddDate.present ? eddDate.value : this.eddDate,
        gestationalAge:
            gestationalAge.present ? gestationalAge.value : this.gestationalAge,
        hemoglobin: hemoglobin.present ? hemoglobin.value : this.hemoglobin,
        bloodGroup: bloodGroup.present ? bloodGroup.value : this.bloodGroup,
        highRiskPregnancy: highRiskPregnancy ?? this.highRiskPregnancy,
        riskFactors: riskFactors.present ? riskFactors.value : this.riskFactors,
        complications:
            complications.present ? complications.value : this.complications,
        ancVisits: ancVisits ?? this.ancVisits,
        lastAncDate: lastAncDate.present ? lastAncDate.value : this.lastAncDate,
        deliveryDate:
            deliveryDate.present ? deliveryDate.value : this.deliveryDate,
        deliveryType:
            deliveryType.present ? deliveryType.value : this.deliveryType,
        deliveryLocation: deliveryLocation.present
            ? deliveryLocation.value
            : this.deliveryLocation,
        babyWeight: babyWeight.present ? babyWeight.value : this.babyWeight,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
      );
  MaternalHealthRecord copyWithCompanion(MaternalHealthRecordsCompanion data) {
    return MaternalHealthRecord(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      pregnancyNumber: data.pregnancyNumber.present
          ? data.pregnancyNumber.value
          : this.pregnancyNumber,
      lmpDate: data.lmpDate.present ? data.lmpDate.value : this.lmpDate,
      eddDate: data.eddDate.present ? data.eddDate.value : this.eddDate,
      gestationalAge: data.gestationalAge.present
          ? data.gestationalAge.value
          : this.gestationalAge,
      hemoglobin:
          data.hemoglobin.present ? data.hemoglobin.value : this.hemoglobin,
      bloodGroup:
          data.bloodGroup.present ? data.bloodGroup.value : this.bloodGroup,
      highRiskPregnancy: data.highRiskPregnancy.present
          ? data.highRiskPregnancy.value
          : this.highRiskPregnancy,
      riskFactors:
          data.riskFactors.present ? data.riskFactors.value : this.riskFactors,
      complications: data.complications.present
          ? data.complications.value
          : this.complications,
      ancVisits: data.ancVisits.present ? data.ancVisits.value : this.ancVisits,
      lastAncDate:
          data.lastAncDate.present ? data.lastAncDate.value : this.lastAncDate,
      deliveryDate: data.deliveryDate.present
          ? data.deliveryDate.value
          : this.deliveryDate,
      deliveryType: data.deliveryType.present
          ? data.deliveryType.value
          : this.deliveryType,
      deliveryLocation: data.deliveryLocation.present
          ? data.deliveryLocation.value
          : this.deliveryLocation,
      babyWeight:
          data.babyWeight.present ? data.babyWeight.value : this.babyWeight,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MaternalHealthRecord(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('pregnancyNumber: $pregnancyNumber, ')
          ..write('lmpDate: $lmpDate, ')
          ..write('eddDate: $eddDate, ')
          ..write('gestationalAge: $gestationalAge, ')
          ..write('hemoglobin: $hemoglobin, ')
          ..write('bloodGroup: $bloodGroup, ')
          ..write('highRiskPregnancy: $highRiskPregnancy, ')
          ..write('riskFactors: $riskFactors, ')
          ..write('complications: $complications, ')
          ..write('ancVisits: $ancVisits, ')
          ..write('lastAncDate: $lastAncDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('deliveryType: $deliveryType, ')
          ..write('deliveryLocation: $deliveryLocation, ')
          ..write('babyWeight: $babyWeight, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      patientId,
      pregnancyNumber,
      lmpDate,
      eddDate,
      gestationalAge,
      hemoglobin,
      bloodGroup,
      highRiskPregnancy,
      riskFactors,
      complications,
      ancVisits,
      lastAncDate,
      deliveryDate,
      deliveryType,
      deliveryLocation,
      babyWeight,
      createdAt,
      createdBy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MaternalHealthRecord &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.pregnancyNumber == this.pregnancyNumber &&
          other.lmpDate == this.lmpDate &&
          other.eddDate == this.eddDate &&
          other.gestationalAge == this.gestationalAge &&
          other.hemoglobin == this.hemoglobin &&
          other.bloodGroup == this.bloodGroup &&
          other.highRiskPregnancy == this.highRiskPregnancy &&
          other.riskFactors == this.riskFactors &&
          other.complications == this.complications &&
          other.ancVisits == this.ancVisits &&
          other.lastAncDate == this.lastAncDate &&
          other.deliveryDate == this.deliveryDate &&
          other.deliveryType == this.deliveryType &&
          other.deliveryLocation == this.deliveryLocation &&
          other.babyWeight == this.babyWeight &&
          other.createdAt == this.createdAt &&
          other.createdBy == this.createdBy);
}

class MaternalHealthRecordsCompanion
    extends UpdateCompanion<MaternalHealthRecord> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<int?> pregnancyNumber;
  final Value<DateTime?> lmpDate;
  final Value<DateTime?> eddDate;
  final Value<int?> gestationalAge;
  final Value<double?> hemoglobin;
  final Value<String?> bloodGroup;
  final Value<bool> highRiskPregnancy;
  final Value<String?> riskFactors;
  final Value<String?> complications;
  final Value<int> ancVisits;
  final Value<DateTime?> lastAncDate;
  final Value<DateTime?> deliveryDate;
  final Value<String?> deliveryType;
  final Value<String?> deliveryLocation;
  final Value<double?> babyWeight;
  final Value<DateTime> createdAt;
  final Value<String?> createdBy;
  final Value<int> rowid;
  const MaternalHealthRecordsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.pregnancyNumber = const Value.absent(),
    this.lmpDate = const Value.absent(),
    this.eddDate = const Value.absent(),
    this.gestationalAge = const Value.absent(),
    this.hemoglobin = const Value.absent(),
    this.bloodGroup = const Value.absent(),
    this.highRiskPregnancy = const Value.absent(),
    this.riskFactors = const Value.absent(),
    this.complications = const Value.absent(),
    this.ancVisits = const Value.absent(),
    this.lastAncDate = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.deliveryType = const Value.absent(),
    this.deliveryLocation = const Value.absent(),
    this.babyWeight = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MaternalHealthRecordsCompanion.insert({
    required String id,
    required String patientId,
    this.pregnancyNumber = const Value.absent(),
    this.lmpDate = const Value.absent(),
    this.eddDate = const Value.absent(),
    this.gestationalAge = const Value.absent(),
    this.hemoglobin = const Value.absent(),
    this.bloodGroup = const Value.absent(),
    this.highRiskPregnancy = const Value.absent(),
    this.riskFactors = const Value.absent(),
    this.complications = const Value.absent(),
    this.ancVisits = const Value.absent(),
    this.lastAncDate = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.deliveryType = const Value.absent(),
    this.deliveryLocation = const Value.absent(),
    this.babyWeight = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        patientId = Value(patientId);
  static Insertable<MaternalHealthRecord> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<int>? pregnancyNumber,
    Expression<DateTime>? lmpDate,
    Expression<DateTime>? eddDate,
    Expression<int>? gestationalAge,
    Expression<double>? hemoglobin,
    Expression<String>? bloodGroup,
    Expression<bool>? highRiskPregnancy,
    Expression<String>? riskFactors,
    Expression<String>? complications,
    Expression<int>? ancVisits,
    Expression<DateTime>? lastAncDate,
    Expression<DateTime>? deliveryDate,
    Expression<String>? deliveryType,
    Expression<String>? deliveryLocation,
    Expression<double>? babyWeight,
    Expression<DateTime>? createdAt,
    Expression<String>? createdBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (pregnancyNumber != null) 'pregnancy_number': pregnancyNumber,
      if (lmpDate != null) 'lmp_date': lmpDate,
      if (eddDate != null) 'edd_date': eddDate,
      if (gestationalAge != null) 'gestational_age': gestationalAge,
      if (hemoglobin != null) 'hemoglobin': hemoglobin,
      if (bloodGroup != null) 'blood_group': bloodGroup,
      if (highRiskPregnancy != null) 'high_risk_pregnancy': highRiskPregnancy,
      if (riskFactors != null) 'risk_factors': riskFactors,
      if (complications != null) 'complications': complications,
      if (ancVisits != null) 'anc_visits': ancVisits,
      if (lastAncDate != null) 'last_anc_date': lastAncDate,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (deliveryType != null) 'delivery_type': deliveryType,
      if (deliveryLocation != null) 'delivery_location': deliveryLocation,
      if (babyWeight != null) 'baby_weight': babyWeight,
      if (createdAt != null) 'created_at': createdAt,
      if (createdBy != null) 'created_by': createdBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MaternalHealthRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? patientId,
      Value<int?>? pregnancyNumber,
      Value<DateTime?>? lmpDate,
      Value<DateTime?>? eddDate,
      Value<int?>? gestationalAge,
      Value<double?>? hemoglobin,
      Value<String?>? bloodGroup,
      Value<bool>? highRiskPregnancy,
      Value<String?>? riskFactors,
      Value<String?>? complications,
      Value<int>? ancVisits,
      Value<DateTime?>? lastAncDate,
      Value<DateTime?>? deliveryDate,
      Value<String?>? deliveryType,
      Value<String?>? deliveryLocation,
      Value<double?>? babyWeight,
      Value<DateTime>? createdAt,
      Value<String?>? createdBy,
      Value<int>? rowid}) {
    return MaternalHealthRecordsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      pregnancyNumber: pregnancyNumber ?? this.pregnancyNumber,
      lmpDate: lmpDate ?? this.lmpDate,
      eddDate: eddDate ?? this.eddDate,
      gestationalAge: gestationalAge ?? this.gestationalAge,
      hemoglobin: hemoglobin ?? this.hemoglobin,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      highRiskPregnancy: highRiskPregnancy ?? this.highRiskPregnancy,
      riskFactors: riskFactors ?? this.riskFactors,
      complications: complications ?? this.complications,
      ancVisits: ancVisits ?? this.ancVisits,
      lastAncDate: lastAncDate ?? this.lastAncDate,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      deliveryType: deliveryType ?? this.deliveryType,
      deliveryLocation: deliveryLocation ?? this.deliveryLocation,
      babyWeight: babyWeight ?? this.babyWeight,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (pregnancyNumber.present) {
      map['pregnancy_number'] = Variable<int>(pregnancyNumber.value);
    }
    if (lmpDate.present) {
      map['lmp_date'] = Variable<DateTime>(lmpDate.value);
    }
    if (eddDate.present) {
      map['edd_date'] = Variable<DateTime>(eddDate.value);
    }
    if (gestationalAge.present) {
      map['gestational_age'] = Variable<int>(gestationalAge.value);
    }
    if (hemoglobin.present) {
      map['hemoglobin'] = Variable<double>(hemoglobin.value);
    }
    if (bloodGroup.present) {
      map['blood_group'] = Variable<String>(bloodGroup.value);
    }
    if (highRiskPregnancy.present) {
      map['high_risk_pregnancy'] = Variable<bool>(highRiskPregnancy.value);
    }
    if (riskFactors.present) {
      map['risk_factors'] = Variable<String>(riskFactors.value);
    }
    if (complications.present) {
      map['complications'] = Variable<String>(complications.value);
    }
    if (ancVisits.present) {
      map['anc_visits'] = Variable<int>(ancVisits.value);
    }
    if (lastAncDate.present) {
      map['last_anc_date'] = Variable<DateTime>(lastAncDate.value);
    }
    if (deliveryDate.present) {
      map['delivery_date'] = Variable<DateTime>(deliveryDate.value);
    }
    if (deliveryType.present) {
      map['delivery_type'] = Variable<String>(deliveryType.value);
    }
    if (deliveryLocation.present) {
      map['delivery_location'] = Variable<String>(deliveryLocation.value);
    }
    if (babyWeight.present) {
      map['baby_weight'] = Variable<double>(babyWeight.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MaternalHealthRecordsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('pregnancyNumber: $pregnancyNumber, ')
          ..write('lmpDate: $lmpDate, ')
          ..write('eddDate: $eddDate, ')
          ..write('gestationalAge: $gestationalAge, ')
          ..write('hemoglobin: $hemoglobin, ')
          ..write('bloodGroup: $bloodGroup, ')
          ..write('highRiskPregnancy: $highRiskPregnancy, ')
          ..write('riskFactors: $riskFactors, ')
          ..write('complications: $complications, ')
          ..write('ancVisits: $ancVisits, ')
          ..write('lastAncDate: $lastAncDate, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('deliveryType: $deliveryType, ')
          ..write('deliveryLocation: $deliveryLocation, ')
          ..write('babyWeight: $babyWeight, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChildHealthRecordsTable extends ChildHealthRecords
    with TableInfo<$ChildHealthRecordsTable, ChildHealthRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChildHealthRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _patientIdMeta =
      const VerificationMeta('patientId');
  @override
  late final GeneratedColumn<String> patientId = GeneratedColumn<String>(
      'patient_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES patients (id)'));
  static const VerificationMeta _birthDateMeta =
      const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
      'birth_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _birthWeightMeta =
      const VerificationMeta('birthWeight');
  @override
  late final GeneratedColumn<double> birthWeight = GeneratedColumn<double>(
      'birth_weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _currentWeightMeta =
      const VerificationMeta('currentWeight');
  @override
  late final GeneratedColumn<double> currentWeight = GeneratedColumn<double>(
      'current_weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _currentHeightMeta =
      const VerificationMeta('currentHeight');
  @override
  late final GeneratedColumn<double> currentHeight = GeneratedColumn<double>(
      'current_height', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _feedingTypeMeta =
      const VerificationMeta('feedingType');
  @override
  late final GeneratedColumn<String> feedingType = GeneratedColumn<String>(
      'feeding_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isBreastfeedingMeta =
      const VerificationMeta('isBreastfeeding');
  @override
  late final GeneratedColumn<bool> isBreastfeeding = GeneratedColumn<bool>(
      'is_breastfeeding', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_breastfeeding" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _developmentStatusMeta =
      const VerificationMeta('developmentStatus');
  @override
  late final GeneratedColumn<String> developmentStatus =
      GeneratedColumn<String>('development_status', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _growthStatusMeta =
      const VerificationMeta('growthStatus');
  @override
  late final GeneratedColumn<String> growthStatus = GeneratedColumn<String>(
      'growth_status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastWeighingDateMeta =
      const VerificationMeta('lastWeighingDate');
  @override
  late final GeneratedColumn<DateTime> lastWeighingDate =
      GeneratedColumn<DateTime>('last_weighing_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _nutritionStatusMeta =
      const VerificationMeta('nutritionStatus');
  @override
  late final GeneratedColumn<String> nutritionStatus = GeneratedColumn<String>(
      'nutrition_status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _complicationsMeta =
      const VerificationMeta('complications');
  @override
  late final GeneratedColumn<String> complications = GeneratedColumn<String>(
      'complications', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        patientId,
        birthDate,
        birthWeight,
        currentWeight,
        currentHeight,
        feedingType,
        isBreastfeeding,
        developmentStatus,
        growthStatus,
        lastWeighingDate,
        nutritionStatus,
        complications,
        createdAt,
        createdBy
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'child_health_records';
  @override
  VerificationContext validateIntegrity(Insertable<ChildHealthRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('patient_id')) {
      context.handle(_patientIdMeta,
          patientId.isAcceptableOrUnknown(data['patient_id']!, _patientIdMeta));
    } else if (isInserting) {
      context.missing(_patientIdMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('birth_weight')) {
      context.handle(
          _birthWeightMeta,
          birthWeight.isAcceptableOrUnknown(
              data['birth_weight']!, _birthWeightMeta));
    }
    if (data.containsKey('current_weight')) {
      context.handle(
          _currentWeightMeta,
          currentWeight.isAcceptableOrUnknown(
              data['current_weight']!, _currentWeightMeta));
    }
    if (data.containsKey('current_height')) {
      context.handle(
          _currentHeightMeta,
          currentHeight.isAcceptableOrUnknown(
              data['current_height']!, _currentHeightMeta));
    }
    if (data.containsKey('feeding_type')) {
      context.handle(
          _feedingTypeMeta,
          feedingType.isAcceptableOrUnknown(
              data['feeding_type']!, _feedingTypeMeta));
    }
    if (data.containsKey('is_breastfeeding')) {
      context.handle(
          _isBreastfeedingMeta,
          isBreastfeeding.isAcceptableOrUnknown(
              data['is_breastfeeding']!, _isBreastfeedingMeta));
    }
    if (data.containsKey('development_status')) {
      context.handle(
          _developmentStatusMeta,
          developmentStatus.isAcceptableOrUnknown(
              data['development_status']!, _developmentStatusMeta));
    }
    if (data.containsKey('growth_status')) {
      context.handle(
          _growthStatusMeta,
          growthStatus.isAcceptableOrUnknown(
              data['growth_status']!, _growthStatusMeta));
    }
    if (data.containsKey('last_weighing_date')) {
      context.handle(
          _lastWeighingDateMeta,
          lastWeighingDate.isAcceptableOrUnknown(
              data['last_weighing_date']!, _lastWeighingDateMeta));
    }
    if (data.containsKey('nutrition_status')) {
      context.handle(
          _nutritionStatusMeta,
          nutritionStatus.isAcceptableOrUnknown(
              data['nutrition_status']!, _nutritionStatusMeta));
    }
    if (data.containsKey('complications')) {
      context.handle(
          _complicationsMeta,
          complications.isAcceptableOrUnknown(
              data['complications']!, _complicationsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChildHealthRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChildHealthRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      patientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}patient_id'])!,
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth_date'])!,
      birthWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}birth_weight']),
      currentWeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}current_weight']),
      currentHeight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}current_height']),
      feedingType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}feeding_type']),
      isBreastfeeding: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_breastfeeding'])!,
      developmentStatus: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}development_status']),
      growthStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}growth_status']),
      lastWeighingDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_weighing_date']),
      nutritionStatus: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}nutrition_status']),
      complications: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}complications']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by']),
    );
  }

  @override
  $ChildHealthRecordsTable createAlias(String alias) {
    return $ChildHealthRecordsTable(attachedDatabase, alias);
  }
}

class ChildHealthRecord extends DataClass
    implements Insertable<ChildHealthRecord> {
  final String id;
  final String patientId;
  final DateTime birthDate;
  final double? birthWeight;
  final double? currentWeight;
  final double? currentHeight;
  final String? feedingType;
  final bool isBreastfeeding;
  final String? developmentStatus;
  final String? growthStatus;
  final DateTime? lastWeighingDate;
  final String? nutritionStatus;
  final String? complications;
  final DateTime createdAt;
  final String? createdBy;
  const ChildHealthRecord(
      {required this.id,
      required this.patientId,
      required this.birthDate,
      this.birthWeight,
      this.currentWeight,
      this.currentHeight,
      this.feedingType,
      required this.isBreastfeeding,
      this.developmentStatus,
      this.growthStatus,
      this.lastWeighingDate,
      this.nutritionStatus,
      this.complications,
      required this.createdAt,
      this.createdBy});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['patient_id'] = Variable<String>(patientId);
    map['birth_date'] = Variable<DateTime>(birthDate);
    if (!nullToAbsent || birthWeight != null) {
      map['birth_weight'] = Variable<double>(birthWeight);
    }
    if (!nullToAbsent || currentWeight != null) {
      map['current_weight'] = Variable<double>(currentWeight);
    }
    if (!nullToAbsent || currentHeight != null) {
      map['current_height'] = Variable<double>(currentHeight);
    }
    if (!nullToAbsent || feedingType != null) {
      map['feeding_type'] = Variable<String>(feedingType);
    }
    map['is_breastfeeding'] = Variable<bool>(isBreastfeeding);
    if (!nullToAbsent || developmentStatus != null) {
      map['development_status'] = Variable<String>(developmentStatus);
    }
    if (!nullToAbsent || growthStatus != null) {
      map['growth_status'] = Variable<String>(growthStatus);
    }
    if (!nullToAbsent || lastWeighingDate != null) {
      map['last_weighing_date'] = Variable<DateTime>(lastWeighingDate);
    }
    if (!nullToAbsent || nutritionStatus != null) {
      map['nutrition_status'] = Variable<String>(nutritionStatus);
    }
    if (!nullToAbsent || complications != null) {
      map['complications'] = Variable<String>(complications);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || createdBy != null) {
      map['created_by'] = Variable<String>(createdBy);
    }
    return map;
  }

  ChildHealthRecordsCompanion toCompanion(bool nullToAbsent) {
    return ChildHealthRecordsCompanion(
      id: Value(id),
      patientId: Value(patientId),
      birthDate: Value(birthDate),
      birthWeight: birthWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(birthWeight),
      currentWeight: currentWeight == null && nullToAbsent
          ? const Value.absent()
          : Value(currentWeight),
      currentHeight: currentHeight == null && nullToAbsent
          ? const Value.absent()
          : Value(currentHeight),
      feedingType: feedingType == null && nullToAbsent
          ? const Value.absent()
          : Value(feedingType),
      isBreastfeeding: Value(isBreastfeeding),
      developmentStatus: developmentStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(developmentStatus),
      growthStatus: growthStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(growthStatus),
      lastWeighingDate: lastWeighingDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastWeighingDate),
      nutritionStatus: nutritionStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(nutritionStatus),
      complications: complications == null && nullToAbsent
          ? const Value.absent()
          : Value(complications),
      createdAt: Value(createdAt),
      createdBy: createdBy == null && nullToAbsent
          ? const Value.absent()
          : Value(createdBy),
    );
  }

  factory ChildHealthRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChildHealthRecord(
      id: serializer.fromJson<String>(json['id']),
      patientId: serializer.fromJson<String>(json['patientId']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      birthWeight: serializer.fromJson<double?>(json['birthWeight']),
      currentWeight: serializer.fromJson<double?>(json['currentWeight']),
      currentHeight: serializer.fromJson<double?>(json['currentHeight']),
      feedingType: serializer.fromJson<String?>(json['feedingType']),
      isBreastfeeding: serializer.fromJson<bool>(json['isBreastfeeding']),
      developmentStatus:
          serializer.fromJson<String?>(json['developmentStatus']),
      growthStatus: serializer.fromJson<String?>(json['growthStatus']),
      lastWeighingDate:
          serializer.fromJson<DateTime?>(json['lastWeighingDate']),
      nutritionStatus: serializer.fromJson<String?>(json['nutritionStatus']),
      complications: serializer.fromJson<String?>(json['complications']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      createdBy: serializer.fromJson<String?>(json['createdBy']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'patientId': serializer.toJson<String>(patientId),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'birthWeight': serializer.toJson<double?>(birthWeight),
      'currentWeight': serializer.toJson<double?>(currentWeight),
      'currentHeight': serializer.toJson<double?>(currentHeight),
      'feedingType': serializer.toJson<String?>(feedingType),
      'isBreastfeeding': serializer.toJson<bool>(isBreastfeeding),
      'developmentStatus': serializer.toJson<String?>(developmentStatus),
      'growthStatus': serializer.toJson<String?>(growthStatus),
      'lastWeighingDate': serializer.toJson<DateTime?>(lastWeighingDate),
      'nutritionStatus': serializer.toJson<String?>(nutritionStatus),
      'complications': serializer.toJson<String?>(complications),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'createdBy': serializer.toJson<String?>(createdBy),
    };
  }

  ChildHealthRecord copyWith(
          {String? id,
          String? patientId,
          DateTime? birthDate,
          Value<double?> birthWeight = const Value.absent(),
          Value<double?> currentWeight = const Value.absent(),
          Value<double?> currentHeight = const Value.absent(),
          Value<String?> feedingType = const Value.absent(),
          bool? isBreastfeeding,
          Value<String?> developmentStatus = const Value.absent(),
          Value<String?> growthStatus = const Value.absent(),
          Value<DateTime?> lastWeighingDate = const Value.absent(),
          Value<String?> nutritionStatus = const Value.absent(),
          Value<String?> complications = const Value.absent(),
          DateTime? createdAt,
          Value<String?> createdBy = const Value.absent()}) =>
      ChildHealthRecord(
        id: id ?? this.id,
        patientId: patientId ?? this.patientId,
        birthDate: birthDate ?? this.birthDate,
        birthWeight: birthWeight.present ? birthWeight.value : this.birthWeight,
        currentWeight:
            currentWeight.present ? currentWeight.value : this.currentWeight,
        currentHeight:
            currentHeight.present ? currentHeight.value : this.currentHeight,
        feedingType: feedingType.present ? feedingType.value : this.feedingType,
        isBreastfeeding: isBreastfeeding ?? this.isBreastfeeding,
        developmentStatus: developmentStatus.present
            ? developmentStatus.value
            : this.developmentStatus,
        growthStatus:
            growthStatus.present ? growthStatus.value : this.growthStatus,
        lastWeighingDate: lastWeighingDate.present
            ? lastWeighingDate.value
            : this.lastWeighingDate,
        nutritionStatus: nutritionStatus.present
            ? nutritionStatus.value
            : this.nutritionStatus,
        complications:
            complications.present ? complications.value : this.complications,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy.present ? createdBy.value : this.createdBy,
      );
  ChildHealthRecord copyWithCompanion(ChildHealthRecordsCompanion data) {
    return ChildHealthRecord(
      id: data.id.present ? data.id.value : this.id,
      patientId: data.patientId.present ? data.patientId.value : this.patientId,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      birthWeight:
          data.birthWeight.present ? data.birthWeight.value : this.birthWeight,
      currentWeight: data.currentWeight.present
          ? data.currentWeight.value
          : this.currentWeight,
      currentHeight: data.currentHeight.present
          ? data.currentHeight.value
          : this.currentHeight,
      feedingType:
          data.feedingType.present ? data.feedingType.value : this.feedingType,
      isBreastfeeding: data.isBreastfeeding.present
          ? data.isBreastfeeding.value
          : this.isBreastfeeding,
      developmentStatus: data.developmentStatus.present
          ? data.developmentStatus.value
          : this.developmentStatus,
      growthStatus: data.growthStatus.present
          ? data.growthStatus.value
          : this.growthStatus,
      lastWeighingDate: data.lastWeighingDate.present
          ? data.lastWeighingDate.value
          : this.lastWeighingDate,
      nutritionStatus: data.nutritionStatus.present
          ? data.nutritionStatus.value
          : this.nutritionStatus,
      complications: data.complications.present
          ? data.complications.value
          : this.complications,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChildHealthRecord(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('birthDate: $birthDate, ')
          ..write('birthWeight: $birthWeight, ')
          ..write('currentWeight: $currentWeight, ')
          ..write('currentHeight: $currentHeight, ')
          ..write('feedingType: $feedingType, ')
          ..write('isBreastfeeding: $isBreastfeeding, ')
          ..write('developmentStatus: $developmentStatus, ')
          ..write('growthStatus: $growthStatus, ')
          ..write('lastWeighingDate: $lastWeighingDate, ')
          ..write('nutritionStatus: $nutritionStatus, ')
          ..write('complications: $complications, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      patientId,
      birthDate,
      birthWeight,
      currentWeight,
      currentHeight,
      feedingType,
      isBreastfeeding,
      developmentStatus,
      growthStatus,
      lastWeighingDate,
      nutritionStatus,
      complications,
      createdAt,
      createdBy);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChildHealthRecord &&
          other.id == this.id &&
          other.patientId == this.patientId &&
          other.birthDate == this.birthDate &&
          other.birthWeight == this.birthWeight &&
          other.currentWeight == this.currentWeight &&
          other.currentHeight == this.currentHeight &&
          other.feedingType == this.feedingType &&
          other.isBreastfeeding == this.isBreastfeeding &&
          other.developmentStatus == this.developmentStatus &&
          other.growthStatus == this.growthStatus &&
          other.lastWeighingDate == this.lastWeighingDate &&
          other.nutritionStatus == this.nutritionStatus &&
          other.complications == this.complications &&
          other.createdAt == this.createdAt &&
          other.createdBy == this.createdBy);
}

class ChildHealthRecordsCompanion extends UpdateCompanion<ChildHealthRecord> {
  final Value<String> id;
  final Value<String> patientId;
  final Value<DateTime> birthDate;
  final Value<double?> birthWeight;
  final Value<double?> currentWeight;
  final Value<double?> currentHeight;
  final Value<String?> feedingType;
  final Value<bool> isBreastfeeding;
  final Value<String?> developmentStatus;
  final Value<String?> growthStatus;
  final Value<DateTime?> lastWeighingDate;
  final Value<String?> nutritionStatus;
  final Value<String?> complications;
  final Value<DateTime> createdAt;
  final Value<String?> createdBy;
  final Value<int> rowid;
  const ChildHealthRecordsCompanion({
    this.id = const Value.absent(),
    this.patientId = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.birthWeight = const Value.absent(),
    this.currentWeight = const Value.absent(),
    this.currentHeight = const Value.absent(),
    this.feedingType = const Value.absent(),
    this.isBreastfeeding = const Value.absent(),
    this.developmentStatus = const Value.absent(),
    this.growthStatus = const Value.absent(),
    this.lastWeighingDate = const Value.absent(),
    this.nutritionStatus = const Value.absent(),
    this.complications = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChildHealthRecordsCompanion.insert({
    required String id,
    required String patientId,
    required DateTime birthDate,
    this.birthWeight = const Value.absent(),
    this.currentWeight = const Value.absent(),
    this.currentHeight = const Value.absent(),
    this.feedingType = const Value.absent(),
    this.isBreastfeeding = const Value.absent(),
    this.developmentStatus = const Value.absent(),
    this.growthStatus = const Value.absent(),
    this.lastWeighingDate = const Value.absent(),
    this.nutritionStatus = const Value.absent(),
    this.complications = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        patientId = Value(patientId),
        birthDate = Value(birthDate);
  static Insertable<ChildHealthRecord> custom({
    Expression<String>? id,
    Expression<String>? patientId,
    Expression<DateTime>? birthDate,
    Expression<double>? birthWeight,
    Expression<double>? currentWeight,
    Expression<double>? currentHeight,
    Expression<String>? feedingType,
    Expression<bool>? isBreastfeeding,
    Expression<String>? developmentStatus,
    Expression<String>? growthStatus,
    Expression<DateTime>? lastWeighingDate,
    Expression<String>? nutritionStatus,
    Expression<String>? complications,
    Expression<DateTime>? createdAt,
    Expression<String>? createdBy,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (patientId != null) 'patient_id': patientId,
      if (birthDate != null) 'birth_date': birthDate,
      if (birthWeight != null) 'birth_weight': birthWeight,
      if (currentWeight != null) 'current_weight': currentWeight,
      if (currentHeight != null) 'current_height': currentHeight,
      if (feedingType != null) 'feeding_type': feedingType,
      if (isBreastfeeding != null) 'is_breastfeeding': isBreastfeeding,
      if (developmentStatus != null) 'development_status': developmentStatus,
      if (growthStatus != null) 'growth_status': growthStatus,
      if (lastWeighingDate != null) 'last_weighing_date': lastWeighingDate,
      if (nutritionStatus != null) 'nutrition_status': nutritionStatus,
      if (complications != null) 'complications': complications,
      if (createdAt != null) 'created_at': createdAt,
      if (createdBy != null) 'created_by': createdBy,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChildHealthRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? patientId,
      Value<DateTime>? birthDate,
      Value<double?>? birthWeight,
      Value<double?>? currentWeight,
      Value<double?>? currentHeight,
      Value<String?>? feedingType,
      Value<bool>? isBreastfeeding,
      Value<String?>? developmentStatus,
      Value<String?>? growthStatus,
      Value<DateTime?>? lastWeighingDate,
      Value<String?>? nutritionStatus,
      Value<String?>? complications,
      Value<DateTime>? createdAt,
      Value<String?>? createdBy,
      Value<int>? rowid}) {
    return ChildHealthRecordsCompanion(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      birthDate: birthDate ?? this.birthDate,
      birthWeight: birthWeight ?? this.birthWeight,
      currentWeight: currentWeight ?? this.currentWeight,
      currentHeight: currentHeight ?? this.currentHeight,
      feedingType: feedingType ?? this.feedingType,
      isBreastfeeding: isBreastfeeding ?? this.isBreastfeeding,
      developmentStatus: developmentStatus ?? this.developmentStatus,
      growthStatus: growthStatus ?? this.growthStatus,
      lastWeighingDate: lastWeighingDate ?? this.lastWeighingDate,
      nutritionStatus: nutritionStatus ?? this.nutritionStatus,
      complications: complications ?? this.complications,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (patientId.present) {
      map['patient_id'] = Variable<String>(patientId.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (birthWeight.present) {
      map['birth_weight'] = Variable<double>(birthWeight.value);
    }
    if (currentWeight.present) {
      map['current_weight'] = Variable<double>(currentWeight.value);
    }
    if (currentHeight.present) {
      map['current_height'] = Variable<double>(currentHeight.value);
    }
    if (feedingType.present) {
      map['feeding_type'] = Variable<String>(feedingType.value);
    }
    if (isBreastfeeding.present) {
      map['is_breastfeeding'] = Variable<bool>(isBreastfeeding.value);
    }
    if (developmentStatus.present) {
      map['development_status'] = Variable<String>(developmentStatus.value);
    }
    if (growthStatus.present) {
      map['growth_status'] = Variable<String>(growthStatus.value);
    }
    if (lastWeighingDate.present) {
      map['last_weighing_date'] = Variable<DateTime>(lastWeighingDate.value);
    }
    if (nutritionStatus.present) {
      map['nutrition_status'] = Variable<String>(nutritionStatus.value);
    }
    if (complications.present) {
      map['complications'] = Variable<String>(complications.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChildHealthRecordsCompanion(')
          ..write('id: $id, ')
          ..write('patientId: $patientId, ')
          ..write('birthDate: $birthDate, ')
          ..write('birthWeight: $birthWeight, ')
          ..write('currentWeight: $currentWeight, ')
          ..write('currentHeight: $currentHeight, ')
          ..write('feedingType: $feedingType, ')
          ..write('isBreastfeeding: $isBreastfeeding, ')
          ..write('developmentStatus: $developmentStatus, ')
          ..write('growthStatus: $growthStatus, ')
          ..write('lastWeighingDate: $lastWeighingDate, ')
          ..write('nutritionStatus: $nutritionStatus, ')
          ..write('complications: $complications, ')
          ..write('createdAt: $createdAt, ')
          ..write('createdBy: $createdBy, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PatientsTable patients = $PatientsTable(this);
  late final $HealthRecordsTable healthRecords = $HealthRecordsTable(this);
  late final $AppointmentsTable appointments = $AppointmentsTable(this);
  late final $AshaWorkersTable ashaWorkers = $AshaWorkersTable(this);
  late final $ImmunizationsTable immunizations = $ImmunizationsTable(this);
  late final $MaternalHealthRecordsTable maternalHealthRecords =
      $MaternalHealthRecordsTable(this);
  late final $ChildHealthRecordsTable childHealthRecords =
      $ChildHealthRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        patients,
        healthRecords,
        appointments,
        ashaWorkers,
        immunizations,
        maternalHealthRecords,
        childHealthRecords
      ];
}

typedef $$PatientsTableCreateCompanionBuilder = PatientsCompanion Function({
  required String id,
  required String name,
  Value<int?> age,
  Value<String?> phone,
  Value<String?> lmpDate,
  Value<double?> weight,
  Value<double?> height,
  Value<String?> bloodPressure,
  Value<String?> notes,
  Value<String> type,
  Value<String?> village,
  Value<String?> address,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String?> createdBy,
  Value<int> rowid,
});
typedef $$PatientsTableUpdateCompanionBuilder = PatientsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<int?> age,
  Value<String?> phone,
  Value<String?> lmpDate,
  Value<double?> weight,
  Value<double?> height,
  Value<String?> bloodPressure,
  Value<String?> notes,
  Value<String> type,
  Value<String?> village,
  Value<String?> address,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String?> createdBy,
  Value<int> rowid,
});

final class $$PatientsTableReferences
    extends BaseReferences<_$AppDatabase, $PatientsTable, Patient> {
  $$PatientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HealthRecordsTable, List<HealthRecord>>
      _healthRecordsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.healthRecords,
              aliasName: $_aliasNameGenerator(
                  db.patients.id, db.healthRecords.patientId));

  $$HealthRecordsTableProcessedTableManager get healthRecordsRefs {
    final manager = $$HealthRecordsTableTableManager($_db, $_db.healthRecords)
        .filter((f) => f.patientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_healthRecordsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$AppointmentsTable, List<Appointment>>
      _appointmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.appointments,
          aliasName:
              $_aliasNameGenerator(db.patients.id, db.appointments.patientId));

  $$AppointmentsTableProcessedTableManager get appointmentsRefs {
    final manager = $$AppointmentsTableTableManager($_db, $_db.appointments)
        .filter((f) => f.patientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_appointmentsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ImmunizationsTable, List<Immunization>>
      _immunizationsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.immunizations,
              aliasName: $_aliasNameGenerator(
                  db.patients.id, db.immunizations.patientId));

  $$ImmunizationsTableProcessedTableManager get immunizationsRefs {
    final manager = $$ImmunizationsTableTableManager($_db, $_db.immunizations)
        .filter((f) => f.patientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_immunizationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$MaternalHealthRecordsTable,
      List<MaternalHealthRecord>> _maternalHealthRecordsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.maternalHealthRecords,
          aliasName: $_aliasNameGenerator(
              db.patients.id, db.maternalHealthRecords.patientId));

  $$MaternalHealthRecordsTableProcessedTableManager
      get maternalHealthRecordsRefs {
    final manager = $$MaternalHealthRecordsTableTableManager(
            $_db, $_db.maternalHealthRecords)
        .filter((f) => f.patientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_maternalHealthRecordsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ChildHealthRecordsTable, List<ChildHealthRecord>>
      _childHealthRecordsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.childHealthRecords,
              aliasName: $_aliasNameGenerator(
                  db.patients.id, db.childHealthRecords.patientId));

  $$ChildHealthRecordsTableProcessedTableManager get childHealthRecordsRefs {
    final manager = $$ChildHealthRecordsTableTableManager(
            $_db, $_db.childHealthRecords)
        .filter((f) => f.patientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_childHealthRecordsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PatientsTableFilterComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lmpDate => $composableBuilder(
      column: $table.lmpDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bloodPressure => $composableBuilder(
      column: $table.bloodPressure, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get village => $composableBuilder(
      column: $table.village, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  Expression<bool> healthRecordsRefs(
      Expression<bool> Function($$HealthRecordsTableFilterComposer f) f) {
    final $$HealthRecordsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.healthRecords,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HealthRecordsTableFilterComposer(
              $db: $db,
              $table: $db.healthRecords,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> appointmentsRefs(
      Expression<bool> Function($$AppointmentsTableFilterComposer f) f) {
    final $$AppointmentsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.appointments,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AppointmentsTableFilterComposer(
              $db: $db,
              $table: $db.appointments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> immunizationsRefs(
      Expression<bool> Function($$ImmunizationsTableFilterComposer f) f) {
    final $$ImmunizationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.immunizations,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ImmunizationsTableFilterComposer(
              $db: $db,
              $table: $db.immunizations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> maternalHealthRecordsRefs(
      Expression<bool> Function($$MaternalHealthRecordsTableFilterComposer f)
          f) {
    final $$MaternalHealthRecordsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.maternalHealthRecords,
            getReferencedColumn: (t) => t.patientId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MaternalHealthRecordsTableFilterComposer(
                  $db: $db,
                  $table: $db.maternalHealthRecords,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> childHealthRecordsRefs(
      Expression<bool> Function($$ChildHealthRecordsTableFilterComposer f) f) {
    final $$ChildHealthRecordsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.childHealthRecords,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ChildHealthRecordsTableFilterComposer(
              $db: $db,
              $table: $db.childHealthRecords,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PatientsTableOrderingComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lmpDate => $composableBuilder(
      column: $table.lmpDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bloodPressure => $composableBuilder(
      column: $table.bloodPressure,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get village => $composableBuilder(
      column: $table.village, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));
}

class $$PatientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get lmpDate =>
      $composableBuilder(column: $table.lmpDate, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<String> get bloodPressure => $composableBuilder(
      column: $table.bloodPressure, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get village =>
      $composableBuilder(column: $table.village, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  Expression<T> healthRecordsRefs<T extends Object>(
      Expression<T> Function($$HealthRecordsTableAnnotationComposer a) f) {
    final $$HealthRecordsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.healthRecords,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$HealthRecordsTableAnnotationComposer(
              $db: $db,
              $table: $db.healthRecords,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> appointmentsRefs<T extends Object>(
      Expression<T> Function($$AppointmentsTableAnnotationComposer a) f) {
    final $$AppointmentsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.appointments,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AppointmentsTableAnnotationComposer(
              $db: $db,
              $table: $db.appointments,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> immunizationsRefs<T extends Object>(
      Expression<T> Function($$ImmunizationsTableAnnotationComposer a) f) {
    final $$ImmunizationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.immunizations,
        getReferencedColumn: (t) => t.patientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ImmunizationsTableAnnotationComposer(
              $db: $db,
              $table: $db.immunizations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> maternalHealthRecordsRefs<T extends Object>(
      Expression<T> Function($$MaternalHealthRecordsTableAnnotationComposer a)
          f) {
    final $$MaternalHealthRecordsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.maternalHealthRecords,
            getReferencedColumn: (t) => t.patientId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$MaternalHealthRecordsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.maternalHealthRecords,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> childHealthRecordsRefs<T extends Object>(
      Expression<T> Function($$ChildHealthRecordsTableAnnotationComposer a) f) {
    final $$ChildHealthRecordsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.childHealthRecords,
            getReferencedColumn: (t) => t.patientId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ChildHealthRecordsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.childHealthRecords,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PatientsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PatientsTable,
    Patient,
    $$PatientsTableFilterComposer,
    $$PatientsTableOrderingComposer,
    $$PatientsTableAnnotationComposer,
    $$PatientsTableCreateCompanionBuilder,
    $$PatientsTableUpdateCompanionBuilder,
    (Patient, $$PatientsTableReferences),
    Patient,
    PrefetchHooks Function(
        {bool healthRecordsRefs,
        bool appointmentsRefs,
        bool immunizationsRefs,
        bool maternalHealthRecordsRefs,
        bool childHealthRecordsRefs})> {
  $$PatientsTableTableManager(_$AppDatabase db, $PatientsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PatientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PatientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PatientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> lmpDate = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<double?> height = const Value.absent(),
            Value<String?> bloodPressure = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> village = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PatientsCompanion(
            id: id,
            name: name,
            age: age,
            phone: phone,
            lmpDate: lmpDate,
            weight: weight,
            height: height,
            bloodPressure: bloodPressure,
            notes: notes,
            type: type,
            village: village,
            address: address,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<int?> age = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> lmpDate = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<double?> height = const Value.absent(),
            Value<String?> bloodPressure = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> village = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PatientsCompanion.insert(
            id: id,
            name: name,
            age: age,
            phone: phone,
            lmpDate: lmpDate,
            weight: weight,
            height: height,
            bloodPressure: bloodPressure,
            notes: notes,
            type: type,
            village: village,
            address: address,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$PatientsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {healthRecordsRefs = false,
              appointmentsRefs = false,
              immunizationsRefs = false,
              maternalHealthRecordsRefs = false,
              childHealthRecordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (healthRecordsRefs) db.healthRecords,
                if (appointmentsRefs) db.appointments,
                if (immunizationsRefs) db.immunizations,
                if (maternalHealthRecordsRefs) db.maternalHealthRecords,
                if (childHealthRecordsRefs) db.childHealthRecords
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (healthRecordsRefs)
                    await $_getPrefetchedData<Patient, $PatientsTable,
                            HealthRecord>(
                        currentTable: table,
                        referencedTable: $$PatientsTableReferences
                            ._healthRecordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PatientsTableReferences(db, table, p0)
                                .healthRecordsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.patientId == item.id),
                        typedResults: items),
                  if (appointmentsRefs)
                    await $_getPrefetchedData<Patient, $PatientsTable,
                            Appointment>(
                        currentTable: table,
                        referencedTable: $$PatientsTableReferences
                            ._appointmentsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PatientsTableReferences(db, table, p0)
                                .appointmentsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.patientId == item.id),
                        typedResults: items),
                  if (immunizationsRefs)
                    await $_getPrefetchedData<Patient, $PatientsTable,
                            Immunization>(
                        currentTable: table,
                        referencedTable: $$PatientsTableReferences
                            ._immunizationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PatientsTableReferences(db, table, p0)
                                .immunizationsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.patientId == item.id),
                        typedResults: items),
                  if (maternalHealthRecordsRefs)
                    await $_getPrefetchedData<Patient, $PatientsTable,
                            MaternalHealthRecord>(
                        currentTable: table,
                        referencedTable: $$PatientsTableReferences
                            ._maternalHealthRecordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PatientsTableReferences(db, table, p0)
                                .maternalHealthRecordsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.patientId == item.id),
                        typedResults: items),
                  if (childHealthRecordsRefs)
                    await $_getPrefetchedData<Patient, $PatientsTable,
                            ChildHealthRecord>(
                        currentTable: table,
                        referencedTable: $$PatientsTableReferences
                            ._childHealthRecordsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PatientsTableReferences(db, table, p0)
                                .childHealthRecordsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.patientId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PatientsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PatientsTable,
    Patient,
    $$PatientsTableFilterComposer,
    $$PatientsTableOrderingComposer,
    $$PatientsTableAnnotationComposer,
    $$PatientsTableCreateCompanionBuilder,
    $$PatientsTableUpdateCompanionBuilder,
    (Patient, $$PatientsTableReferences),
    Patient,
    PrefetchHooks Function(
        {bool healthRecordsRefs,
        bool appointmentsRefs,
        bool immunizationsRefs,
        bool maternalHealthRecordsRefs,
        bool childHealthRecordsRefs})>;
typedef $$HealthRecordsTableCreateCompanionBuilder = HealthRecordsCompanion
    Function({
  required String id,
  required String patientId,
  Value<double?> weight,
  Value<double?> height,
  Value<String?> bloodPressure,
  Value<double?> temperature,
  Value<String?> pulse,
  Value<String?> notes,
  Value<String?> symptoms,
  Value<String?> medications,
  Value<String?> diagnosis,
  Value<String?> recommendations,
  Value<DateTime> visitDate,
  Value<DateTime> createdAt,
  Value<String?> createdBy,
  Value<int> rowid,
});
typedef $$HealthRecordsTableUpdateCompanionBuilder = HealthRecordsCompanion
    Function({
  Value<String> id,
  Value<String> patientId,
  Value<double?> weight,
  Value<double?> height,
  Value<String?> bloodPressure,
  Value<double?> temperature,
  Value<String?> pulse,
  Value<String?> notes,
  Value<String?> symptoms,
  Value<String?> medications,
  Value<String?> diagnosis,
  Value<String?> recommendations,
  Value<DateTime> visitDate,
  Value<DateTime> createdAt,
  Value<String?> createdBy,
  Value<int> rowid,
});

final class $$HealthRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $HealthRecordsTable, HealthRecord> {
  $$HealthRecordsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PatientsTable _patientIdTable(_$AppDatabase db) =>
      db.patients.createAlias(
          $_aliasNameGenerator(db.healthRecords.patientId, db.patients.id));

  $$PatientsTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<String>('patient_id')!;

    final manager = $$PatientsTableTableManager($_db, $_db.patients)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$HealthRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $HealthRecordsTable> {
  $$HealthRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bloodPressure => $composableBuilder(
      column: $table.bloodPressure, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pulse => $composableBuilder(
      column: $table.pulse, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get symptoms => $composableBuilder(
      column: $table.symptoms, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get medications => $composableBuilder(
      column: $table.medications, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get diagnosis => $composableBuilder(
      column: $table.diagnosis, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recommendations => $composableBuilder(
      column: $table.recommendations,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get visitDate => $composableBuilder(
      column: $table.visitDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  $$PatientsTableFilterComposer get patientId {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableFilterComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HealthRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $HealthRecordsTable> {
  $$HealthRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bloodPressure => $composableBuilder(
      column: $table.bloodPressure,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pulse => $composableBuilder(
      column: $table.pulse, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get symptoms => $composableBuilder(
      column: $table.symptoms, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get medications => $composableBuilder(
      column: $table.medications, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get diagnosis => $composableBuilder(
      column: $table.diagnosis, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recommendations => $composableBuilder(
      column: $table.recommendations,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get visitDate => $composableBuilder(
      column: $table.visitDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  $$PatientsTableOrderingComposer get patientId {
    final $$PatientsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableOrderingComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HealthRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HealthRecordsTable> {
  $$HealthRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<String> get bloodPressure => $composableBuilder(
      column: $table.bloodPressure, builder: (column) => column);

  GeneratedColumn<double> get temperature => $composableBuilder(
      column: $table.temperature, builder: (column) => column);

  GeneratedColumn<String> get pulse =>
      $composableBuilder(column: $table.pulse, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get symptoms =>
      $composableBuilder(column: $table.symptoms, builder: (column) => column);

  GeneratedColumn<String> get medications => $composableBuilder(
      column: $table.medications, builder: (column) => column);

  GeneratedColumn<String> get diagnosis =>
      $composableBuilder(column: $table.diagnosis, builder: (column) => column);

  GeneratedColumn<String> get recommendations => $composableBuilder(
      column: $table.recommendations, builder: (column) => column);

  GeneratedColumn<DateTime> get visitDate =>
      $composableBuilder(column: $table.visitDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  $$PatientsTableAnnotationComposer get patientId {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableAnnotationComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$HealthRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HealthRecordsTable,
    HealthRecord,
    $$HealthRecordsTableFilterComposer,
    $$HealthRecordsTableOrderingComposer,
    $$HealthRecordsTableAnnotationComposer,
    $$HealthRecordsTableCreateCompanionBuilder,
    $$HealthRecordsTableUpdateCompanionBuilder,
    (HealthRecord, $$HealthRecordsTableReferences),
    HealthRecord,
    PrefetchHooks Function({bool patientId})> {
  $$HealthRecordsTableTableManager(_$AppDatabase db, $HealthRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HealthRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HealthRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HealthRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> patientId = const Value.absent(),
            Value<double?> weight = const Value.absent(),
            Value<double?> height = const Value.absent(),
            Value<String?> bloodPressure = const Value.absent(),
            Value<double?> temperature = const Value.absent(),
            Value<String?> pulse = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> symptoms = const Value.absent(),
            Value<String?> medications = const Value.absent(),
            Value<String?> diagnosis = const Value.absent(),
            Value<String?> recommendations = const Value.absent(),
            Value<DateTime> visitDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HealthRecordsCompanion(
            id: id,
            patientId: patientId,
            weight: weight,
            height: height,
            bloodPressure: bloodPressure,
            temperature: temperature,
            pulse: pulse,
            notes: notes,
            symptoms: symptoms,
            medications: medications,
            diagnosis: diagnosis,
            recommendations: recommendations,
            visitDate: visitDate,
            createdAt: createdAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String patientId,
            Value<double?> weight = const Value.absent(),
            Value<double?> height = const Value.absent(),
            Value<String?> bloodPressure = const Value.absent(),
            Value<double?> temperature = const Value.absent(),
            Value<String?> pulse = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> symptoms = const Value.absent(),
            Value<String?> medications = const Value.absent(),
            Value<String?> diagnosis = const Value.absent(),
            Value<String?> recommendations = const Value.absent(),
            Value<DateTime> visitDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HealthRecordsCompanion.insert(
            id: id,
            patientId: patientId,
            weight: weight,
            height: height,
            bloodPressure: bloodPressure,
            temperature: temperature,
            pulse: pulse,
            notes: notes,
            symptoms: symptoms,
            medications: medications,
            diagnosis: diagnosis,
            recommendations: recommendations,
            visitDate: visitDate,
            createdAt: createdAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$HealthRecordsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (patientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.patientId,
                    referencedTable:
                        $$HealthRecordsTableReferences._patientIdTable(db),
                    referencedColumn:
                        $$HealthRecordsTableReferences._patientIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$HealthRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HealthRecordsTable,
    HealthRecord,
    $$HealthRecordsTableFilterComposer,
    $$HealthRecordsTableOrderingComposer,
    $$HealthRecordsTableAnnotationComposer,
    $$HealthRecordsTableCreateCompanionBuilder,
    $$HealthRecordsTableUpdateCompanionBuilder,
    (HealthRecord, $$HealthRecordsTableReferences),
    HealthRecord,
    PrefetchHooks Function({bool patientId})>;
typedef $$AppointmentsTableCreateCompanionBuilder = AppointmentsCompanion
    Function({
  required String id,
  required String patientId,
  required DateTime appointmentDate,
  required String appointmentTime,
  required String type,
  Value<String?> notes,
  Value<bool> isCompleted,
  Value<bool> isReminded,
  Value<DateTime> createdAt,
  Value<String?> createdBy,
  Value<int> rowid,
});
typedef $$AppointmentsTableUpdateCompanionBuilder = AppointmentsCompanion
    Function({
  Value<String> id,
  Value<String> patientId,
  Value<DateTime> appointmentDate,
  Value<String> appointmentTime,
  Value<String> type,
  Value<String?> notes,
  Value<bool> isCompleted,
  Value<bool> isReminded,
  Value<DateTime> createdAt,
  Value<String?> createdBy,
  Value<int> rowid,
});

final class $$AppointmentsTableReferences
    extends BaseReferences<_$AppDatabase, $AppointmentsTable, Appointment> {
  $$AppointmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PatientsTable _patientIdTable(_$AppDatabase db) =>
      db.patients.createAlias(
          $_aliasNameGenerator(db.appointments.patientId, db.patients.id));

  $$PatientsTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<String>('patient_id')!;

    final manager = $$PatientsTableTableManager($_db, $_db.patients)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$AppointmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get appointmentDate => $composableBuilder(
      column: $table.appointmentDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get appointmentTime => $composableBuilder(
      column: $table.appointmentTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isReminded => $composableBuilder(
      column: $table.isReminded, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  $$PatientsTableFilterComposer get patientId {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableFilterComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AppointmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get appointmentDate => $composableBuilder(
      column: $table.appointmentDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get appointmentTime => $composableBuilder(
      column: $table.appointmentTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isReminded => $composableBuilder(
      column: $table.isReminded, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  $$PatientsTableOrderingComposer get patientId {
    final $$PatientsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableOrderingComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AppointmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get appointmentDate => $composableBuilder(
      column: $table.appointmentDate, builder: (column) => column);

  GeneratedColumn<String> get appointmentTime => $composableBuilder(
      column: $table.appointmentTime, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumn<bool> get isReminded => $composableBuilder(
      column: $table.isReminded, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  $$PatientsTableAnnotationComposer get patientId {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableAnnotationComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AppointmentsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppointmentsTable,
    Appointment,
    $$AppointmentsTableFilterComposer,
    $$AppointmentsTableOrderingComposer,
    $$AppointmentsTableAnnotationComposer,
    $$AppointmentsTableCreateCompanionBuilder,
    $$AppointmentsTableUpdateCompanionBuilder,
    (Appointment, $$AppointmentsTableReferences),
    Appointment,
    PrefetchHooks Function({bool patientId})> {
  $$AppointmentsTableTableManager(_$AppDatabase db, $AppointmentsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppointmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppointmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppointmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> patientId = const Value.absent(),
            Value<DateTime> appointmentDate = const Value.absent(),
            Value<String> appointmentTime = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<bool> isReminded = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppointmentsCompanion(
            id: id,
            patientId: patientId,
            appointmentDate: appointmentDate,
            appointmentTime: appointmentTime,
            type: type,
            notes: notes,
            isCompleted: isCompleted,
            isReminded: isReminded,
            createdAt: createdAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String patientId,
            required DateTime appointmentDate,
            required String appointmentTime,
            required String type,
            Value<String?> notes = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<bool> isReminded = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppointmentsCompanion.insert(
            id: id,
            patientId: patientId,
            appointmentDate: appointmentDate,
            appointmentTime: appointmentTime,
            type: type,
            notes: notes,
            isCompleted: isCompleted,
            isReminded: isReminded,
            createdAt: createdAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AppointmentsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (patientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.patientId,
                    referencedTable:
                        $$AppointmentsTableReferences._patientIdTable(db),
                    referencedColumn:
                        $$AppointmentsTableReferences._patientIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$AppointmentsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppointmentsTable,
    Appointment,
    $$AppointmentsTableFilterComposer,
    $$AppointmentsTableOrderingComposer,
    $$AppointmentsTableAnnotationComposer,
    $$AppointmentsTableCreateCompanionBuilder,
    $$AppointmentsTableUpdateCompanionBuilder,
    (Appointment, $$AppointmentsTableReferences),
    Appointment,
    PrefetchHooks Function({bool patientId})>;
typedef $$AshaWorkersTableCreateCompanionBuilder = AshaWorkersCompanion
    Function({
  required String id,
  required String name,
  required String phone,
  Value<String?> village,
  Value<String?> block,
  Value<String?> district,
  Value<String?> state,
  Value<bool> isActive,
  Value<DateTime?> lastLogin,
  Value<DateTime> createdAt,
  Value<int> rowid,
});
typedef $$AshaWorkersTableUpdateCompanionBuilder = AshaWorkersCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> phone,
  Value<String?> village,
  Value<String?> block,
  Value<String?> district,
  Value<String?> state,
  Value<bool> isActive,
  Value<DateTime?> lastLogin,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$AshaWorkersTableFilterComposer
    extends Composer<_$AppDatabase, $AshaWorkersTable> {
  $$AshaWorkersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get village => $composableBuilder(
      column: $table.village, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get block => $composableBuilder(
      column: $table.block, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get district => $composableBuilder(
      column: $table.district, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastLogin => $composableBuilder(
      column: $table.lastLogin, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$AshaWorkersTableOrderingComposer
    extends Composer<_$AppDatabase, $AshaWorkersTable> {
  $$AshaWorkersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get village => $composableBuilder(
      column: $table.village, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get block => $composableBuilder(
      column: $table.block, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get district => $composableBuilder(
      column: $table.district, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastLogin => $composableBuilder(
      column: $table.lastLogin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$AshaWorkersTableAnnotationComposer
    extends Composer<_$AppDatabase, $AshaWorkersTable> {
  $$AshaWorkersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get village =>
      $composableBuilder(column: $table.village, builder: (column) => column);

  GeneratedColumn<String> get block =>
      $composableBuilder(column: $table.block, builder: (column) => column);

  GeneratedColumn<String> get district =>
      $composableBuilder(column: $table.district, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get lastLogin =>
      $composableBuilder(column: $table.lastLogin, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AshaWorkersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AshaWorkersTable,
    AshaWorker,
    $$AshaWorkersTableFilterComposer,
    $$AshaWorkersTableOrderingComposer,
    $$AshaWorkersTableAnnotationComposer,
    $$AshaWorkersTableCreateCompanionBuilder,
    $$AshaWorkersTableUpdateCompanionBuilder,
    (AshaWorker, BaseReferences<_$AppDatabase, $AshaWorkersTable, AshaWorker>),
    AshaWorker,
    PrefetchHooks Function()> {
  $$AshaWorkersTableTableManager(_$AppDatabase db, $AshaWorkersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AshaWorkersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AshaWorkersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AshaWorkersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<String?> village = const Value.absent(),
            Value<String?> block = const Value.absent(),
            Value<String?> district = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime?> lastLogin = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AshaWorkersCompanion(
            id: id,
            name: name,
            phone: phone,
            village: village,
            block: block,
            district: district,
            state: state,
            isActive: isActive,
            lastLogin: lastLogin,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String phone,
            Value<String?> village = const Value.absent(),
            Value<String?> block = const Value.absent(),
            Value<String?> district = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime?> lastLogin = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AshaWorkersCompanion.insert(
            id: id,
            name: name,
            phone: phone,
            village: village,
            block: block,
            district: district,
            state: state,
            isActive: isActive,
            lastLogin: lastLogin,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AshaWorkersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AshaWorkersTable,
    AshaWorker,
    $$AshaWorkersTableFilterComposer,
    $$AshaWorkersTableOrderingComposer,
    $$AshaWorkersTableAnnotationComposer,
    $$AshaWorkersTableCreateCompanionBuilder,
    $$AshaWorkersTableUpdateCompanionBuilder,
    (AshaWorker, BaseReferences<_$AppDatabase, $AshaWorkersTable, AshaWorker>),
    AshaWorker,
    PrefetchHooks Function()>;
typedef $$ImmunizationsTableCreateCompanionBuilder = ImmunizationsCompanion
    Function({
  required String id,
  required String patientId,
  required String vaccineName,
  required DateTime givenDate,
  Value<DateTime?> dueDate,
  Value<String?> batchNumber,
  Value<String?> notes,
  Value<bool> isCompleted,
  Value<DateTime> createdAt,
  Value<String?> createdBy,
  Value<int> rowid,
});
typedef $$ImmunizationsTableUpdateCompanionBuilder = ImmunizationsCompanion
    Function({
  Value<String> id,
  Value<String> patientId,
  Value<String> vaccineName,
  Value<DateTime> givenDate,
  Value<DateTime?> dueDate,
  Value<String?> batchNumber,
  Value<String?> notes,
  Value<bool> isCompleted,
  Value<DateTime> createdAt,
  Value<String?> createdBy,
  Value<int> rowid,
});

final class $$ImmunizationsTableReferences
    extends BaseReferences<_$AppDatabase, $ImmunizationsTable, Immunization> {
  $$ImmunizationsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PatientsTable _patientIdTable(_$AppDatabase db) =>
      db.patients.createAlias(
          $_aliasNameGenerator(db.immunizations.patientId, db.patients.id));

  $$PatientsTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<String>('patient_id')!;

    final manager = $$PatientsTableTableManager($_db, $_db.patients)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ImmunizationsTableFilterComposer
    extends Composer<_$AppDatabase, $ImmunizationsTable> {
  $$ImmunizationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vaccineName => $composableBuilder(
      column: $table.vaccineName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get givenDate => $composableBuilder(
      column: $table.givenDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get batchNumber => $composableBuilder(
      column: $table.batchNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  $$PatientsTableFilterComposer get patientId {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableFilterComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ImmunizationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ImmunizationsTable> {
  $$ImmunizationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vaccineName => $composableBuilder(
      column: $table.vaccineName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get givenDate => $composableBuilder(
      column: $table.givenDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get batchNumber => $composableBuilder(
      column: $table.batchNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  $$PatientsTableOrderingComposer get patientId {
    final $$PatientsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableOrderingComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ImmunizationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ImmunizationsTable> {
  $$ImmunizationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vaccineName => $composableBuilder(
      column: $table.vaccineName, builder: (column) => column);

  GeneratedColumn<DateTime> get givenDate =>
      $composableBuilder(column: $table.givenDate, builder: (column) => column);

  GeneratedColumn<DateTime> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<String> get batchNumber => $composableBuilder(
      column: $table.batchNumber, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  $$PatientsTableAnnotationComposer get patientId {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableAnnotationComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ImmunizationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ImmunizationsTable,
    Immunization,
    $$ImmunizationsTableFilterComposer,
    $$ImmunizationsTableOrderingComposer,
    $$ImmunizationsTableAnnotationComposer,
    $$ImmunizationsTableCreateCompanionBuilder,
    $$ImmunizationsTableUpdateCompanionBuilder,
    (Immunization, $$ImmunizationsTableReferences),
    Immunization,
    PrefetchHooks Function({bool patientId})> {
  $$ImmunizationsTableTableManager(_$AppDatabase db, $ImmunizationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImmunizationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImmunizationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImmunizationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> patientId = const Value.absent(),
            Value<String> vaccineName = const Value.absent(),
            Value<DateTime> givenDate = const Value.absent(),
            Value<DateTime?> dueDate = const Value.absent(),
            Value<String?> batchNumber = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ImmunizationsCompanion(
            id: id,
            patientId: patientId,
            vaccineName: vaccineName,
            givenDate: givenDate,
            dueDate: dueDate,
            batchNumber: batchNumber,
            notes: notes,
            isCompleted: isCompleted,
            createdAt: createdAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String patientId,
            required String vaccineName,
            required DateTime givenDate,
            Value<DateTime?> dueDate = const Value.absent(),
            Value<String?> batchNumber = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ImmunizationsCompanion.insert(
            id: id,
            patientId: patientId,
            vaccineName: vaccineName,
            givenDate: givenDate,
            dueDate: dueDate,
            batchNumber: batchNumber,
            notes: notes,
            isCompleted: isCompleted,
            createdAt: createdAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ImmunizationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (patientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.patientId,
                    referencedTable:
                        $$ImmunizationsTableReferences._patientIdTable(db),
                    referencedColumn:
                        $$ImmunizationsTableReferences._patientIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ImmunizationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ImmunizationsTable,
    Immunization,
    $$ImmunizationsTableFilterComposer,
    $$ImmunizationsTableOrderingComposer,
    $$ImmunizationsTableAnnotationComposer,
    $$ImmunizationsTableCreateCompanionBuilder,
    $$ImmunizationsTableUpdateCompanionBuilder,
    (Immunization, $$ImmunizationsTableReferences),
    Immunization,
    PrefetchHooks Function({bool patientId})>;
typedef $$MaternalHealthRecordsTableCreateCompanionBuilder
    = MaternalHealthRecordsCompanion Function({
  required String id,
  required String patientId,
  Value<int?> pregnancyNumber,
  Value<DateTime?> lmpDate,
  Value<DateTime?> eddDate,
  Value<int?> gestationalAge,
  Value<double?> hemoglobin,
  Value<String?> bloodGroup,
  Value<bool> highRiskPregnancy,
  Value<String?> riskFactors,
  Value<String?> complications,
  Value<int> ancVisits,
  Value<DateTime?> lastAncDate,
  Value<DateTime?> deliveryDate,
  Value<String?> deliveryType,
  Value<String?> deliveryLocation,
  Value<double?> babyWeight,
  Value<DateTime> createdAt,
  Value<String?> createdBy,
  Value<int> rowid,
});
typedef $$MaternalHealthRecordsTableUpdateCompanionBuilder
    = MaternalHealthRecordsCompanion Function({
  Value<String> id,
  Value<String> patientId,
  Value<int?> pregnancyNumber,
  Value<DateTime?> lmpDate,
  Value<DateTime?> eddDate,
  Value<int?> gestationalAge,
  Value<double?> hemoglobin,
  Value<String?> bloodGroup,
  Value<bool> highRiskPregnancy,
  Value<String?> riskFactors,
  Value<String?> complications,
  Value<int> ancVisits,
  Value<DateTime?> lastAncDate,
  Value<DateTime?> deliveryDate,
  Value<String?> deliveryType,
  Value<String?> deliveryLocation,
  Value<double?> babyWeight,
  Value<DateTime> createdAt,
  Value<String?> createdBy,
  Value<int> rowid,
});

final class $$MaternalHealthRecordsTableReferences extends BaseReferences<
    _$AppDatabase, $MaternalHealthRecordsTable, MaternalHealthRecord> {
  $$MaternalHealthRecordsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PatientsTable _patientIdTable(_$AppDatabase db) =>
      db.patients.createAlias($_aliasNameGenerator(
          db.maternalHealthRecords.patientId, db.patients.id));

  $$PatientsTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<String>('patient_id')!;

    final manager = $$PatientsTableTableManager($_db, $_db.patients)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$MaternalHealthRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $MaternalHealthRecordsTable> {
  $$MaternalHealthRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get pregnancyNumber => $composableBuilder(
      column: $table.pregnancyNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lmpDate => $composableBuilder(
      column: $table.lmpDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get eddDate => $composableBuilder(
      column: $table.eddDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get gestationalAge => $composableBuilder(
      column: $table.gestationalAge,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get hemoglobin => $composableBuilder(
      column: $table.hemoglobin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bloodGroup => $composableBuilder(
      column: $table.bloodGroup, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get highRiskPregnancy => $composableBuilder(
      column: $table.highRiskPregnancy,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get riskFactors => $composableBuilder(
      column: $table.riskFactors, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get complications => $composableBuilder(
      column: $table.complications, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ancVisits => $composableBuilder(
      column: $table.ancVisits, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastAncDate => $composableBuilder(
      column: $table.lastAncDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deliveryDate => $composableBuilder(
      column: $table.deliveryDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deliveryType => $composableBuilder(
      column: $table.deliveryType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get deliveryLocation => $composableBuilder(
      column: $table.deliveryLocation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get babyWeight => $composableBuilder(
      column: $table.babyWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  $$PatientsTableFilterComposer get patientId {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableFilterComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaternalHealthRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $MaternalHealthRecordsTable> {
  $$MaternalHealthRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get pregnancyNumber => $composableBuilder(
      column: $table.pregnancyNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lmpDate => $composableBuilder(
      column: $table.lmpDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get eddDate => $composableBuilder(
      column: $table.eddDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get gestationalAge => $composableBuilder(
      column: $table.gestationalAge,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get hemoglobin => $composableBuilder(
      column: $table.hemoglobin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bloodGroup => $composableBuilder(
      column: $table.bloodGroup, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get highRiskPregnancy => $composableBuilder(
      column: $table.highRiskPregnancy,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get riskFactors => $composableBuilder(
      column: $table.riskFactors, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get complications => $composableBuilder(
      column: $table.complications,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ancVisits => $composableBuilder(
      column: $table.ancVisits, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastAncDate => $composableBuilder(
      column: $table.lastAncDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deliveryDate => $composableBuilder(
      column: $table.deliveryDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deliveryType => $composableBuilder(
      column: $table.deliveryType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deliveryLocation => $composableBuilder(
      column: $table.deliveryLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get babyWeight => $composableBuilder(
      column: $table.babyWeight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  $$PatientsTableOrderingComposer get patientId {
    final $$PatientsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableOrderingComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaternalHealthRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MaternalHealthRecordsTable> {
  $$MaternalHealthRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pregnancyNumber => $composableBuilder(
      column: $table.pregnancyNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get lmpDate =>
      $composableBuilder(column: $table.lmpDate, builder: (column) => column);

  GeneratedColumn<DateTime> get eddDate =>
      $composableBuilder(column: $table.eddDate, builder: (column) => column);

  GeneratedColumn<int> get gestationalAge => $composableBuilder(
      column: $table.gestationalAge, builder: (column) => column);

  GeneratedColumn<double> get hemoglobin => $composableBuilder(
      column: $table.hemoglobin, builder: (column) => column);

  GeneratedColumn<String> get bloodGroup => $composableBuilder(
      column: $table.bloodGroup, builder: (column) => column);

  GeneratedColumn<bool> get highRiskPregnancy => $composableBuilder(
      column: $table.highRiskPregnancy, builder: (column) => column);

  GeneratedColumn<String> get riskFactors => $composableBuilder(
      column: $table.riskFactors, builder: (column) => column);

  GeneratedColumn<String> get complications => $composableBuilder(
      column: $table.complications, builder: (column) => column);

  GeneratedColumn<int> get ancVisits =>
      $composableBuilder(column: $table.ancVisits, builder: (column) => column);

  GeneratedColumn<DateTime> get lastAncDate => $composableBuilder(
      column: $table.lastAncDate, builder: (column) => column);

  GeneratedColumn<DateTime> get deliveryDate => $composableBuilder(
      column: $table.deliveryDate, builder: (column) => column);

  GeneratedColumn<String> get deliveryType => $composableBuilder(
      column: $table.deliveryType, builder: (column) => column);

  GeneratedColumn<String> get deliveryLocation => $composableBuilder(
      column: $table.deliveryLocation, builder: (column) => column);

  GeneratedColumn<double> get babyWeight => $composableBuilder(
      column: $table.babyWeight, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  $$PatientsTableAnnotationComposer get patientId {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableAnnotationComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$MaternalHealthRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MaternalHealthRecordsTable,
    MaternalHealthRecord,
    $$MaternalHealthRecordsTableFilterComposer,
    $$MaternalHealthRecordsTableOrderingComposer,
    $$MaternalHealthRecordsTableAnnotationComposer,
    $$MaternalHealthRecordsTableCreateCompanionBuilder,
    $$MaternalHealthRecordsTableUpdateCompanionBuilder,
    (MaternalHealthRecord, $$MaternalHealthRecordsTableReferences),
    MaternalHealthRecord,
    PrefetchHooks Function({bool patientId})> {
  $$MaternalHealthRecordsTableTableManager(
      _$AppDatabase db, $MaternalHealthRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MaternalHealthRecordsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MaternalHealthRecordsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MaternalHealthRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> patientId = const Value.absent(),
            Value<int?> pregnancyNumber = const Value.absent(),
            Value<DateTime?> lmpDate = const Value.absent(),
            Value<DateTime?> eddDate = const Value.absent(),
            Value<int?> gestationalAge = const Value.absent(),
            Value<double?> hemoglobin = const Value.absent(),
            Value<String?> bloodGroup = const Value.absent(),
            Value<bool> highRiskPregnancy = const Value.absent(),
            Value<String?> riskFactors = const Value.absent(),
            Value<String?> complications = const Value.absent(),
            Value<int> ancVisits = const Value.absent(),
            Value<DateTime?> lastAncDate = const Value.absent(),
            Value<DateTime?> deliveryDate = const Value.absent(),
            Value<String?> deliveryType = const Value.absent(),
            Value<String?> deliveryLocation = const Value.absent(),
            Value<double?> babyWeight = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MaternalHealthRecordsCompanion(
            id: id,
            patientId: patientId,
            pregnancyNumber: pregnancyNumber,
            lmpDate: lmpDate,
            eddDate: eddDate,
            gestationalAge: gestationalAge,
            hemoglobin: hemoglobin,
            bloodGroup: bloodGroup,
            highRiskPregnancy: highRiskPregnancy,
            riskFactors: riskFactors,
            complications: complications,
            ancVisits: ancVisits,
            lastAncDate: lastAncDate,
            deliveryDate: deliveryDate,
            deliveryType: deliveryType,
            deliveryLocation: deliveryLocation,
            babyWeight: babyWeight,
            createdAt: createdAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String patientId,
            Value<int?> pregnancyNumber = const Value.absent(),
            Value<DateTime?> lmpDate = const Value.absent(),
            Value<DateTime?> eddDate = const Value.absent(),
            Value<int?> gestationalAge = const Value.absent(),
            Value<double?> hemoglobin = const Value.absent(),
            Value<String?> bloodGroup = const Value.absent(),
            Value<bool> highRiskPregnancy = const Value.absent(),
            Value<String?> riskFactors = const Value.absent(),
            Value<String?> complications = const Value.absent(),
            Value<int> ancVisits = const Value.absent(),
            Value<DateTime?> lastAncDate = const Value.absent(),
            Value<DateTime?> deliveryDate = const Value.absent(),
            Value<String?> deliveryType = const Value.absent(),
            Value<String?> deliveryLocation = const Value.absent(),
            Value<double?> babyWeight = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MaternalHealthRecordsCompanion.insert(
            id: id,
            patientId: patientId,
            pregnancyNumber: pregnancyNumber,
            lmpDate: lmpDate,
            eddDate: eddDate,
            gestationalAge: gestationalAge,
            hemoglobin: hemoglobin,
            bloodGroup: bloodGroup,
            highRiskPregnancy: highRiskPregnancy,
            riskFactors: riskFactors,
            complications: complications,
            ancVisits: ancVisits,
            lastAncDate: lastAncDate,
            deliveryDate: deliveryDate,
            deliveryType: deliveryType,
            deliveryLocation: deliveryLocation,
            babyWeight: babyWeight,
            createdAt: createdAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$MaternalHealthRecordsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (patientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.patientId,
                    referencedTable: $$MaternalHealthRecordsTableReferences
                        ._patientIdTable(db),
                    referencedColumn: $$MaternalHealthRecordsTableReferences
                        ._patientIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$MaternalHealthRecordsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $MaternalHealthRecordsTable,
        MaternalHealthRecord,
        $$MaternalHealthRecordsTableFilterComposer,
        $$MaternalHealthRecordsTableOrderingComposer,
        $$MaternalHealthRecordsTableAnnotationComposer,
        $$MaternalHealthRecordsTableCreateCompanionBuilder,
        $$MaternalHealthRecordsTableUpdateCompanionBuilder,
        (MaternalHealthRecord, $$MaternalHealthRecordsTableReferences),
        MaternalHealthRecord,
        PrefetchHooks Function({bool patientId})>;
typedef $$ChildHealthRecordsTableCreateCompanionBuilder
    = ChildHealthRecordsCompanion Function({
  required String id,
  required String patientId,
  required DateTime birthDate,
  Value<double?> birthWeight,
  Value<double?> currentWeight,
  Value<double?> currentHeight,
  Value<String?> feedingType,
  Value<bool> isBreastfeeding,
  Value<String?> developmentStatus,
  Value<String?> growthStatus,
  Value<DateTime?> lastWeighingDate,
  Value<String?> nutritionStatus,
  Value<String?> complications,
  Value<DateTime> createdAt,
  Value<String?> createdBy,
  Value<int> rowid,
});
typedef $$ChildHealthRecordsTableUpdateCompanionBuilder
    = ChildHealthRecordsCompanion Function({
  Value<String> id,
  Value<String> patientId,
  Value<DateTime> birthDate,
  Value<double?> birthWeight,
  Value<double?> currentWeight,
  Value<double?> currentHeight,
  Value<String?> feedingType,
  Value<bool> isBreastfeeding,
  Value<String?> developmentStatus,
  Value<String?> growthStatus,
  Value<DateTime?> lastWeighingDate,
  Value<String?> nutritionStatus,
  Value<String?> complications,
  Value<DateTime> createdAt,
  Value<String?> createdBy,
  Value<int> rowid,
});

final class $$ChildHealthRecordsTableReferences extends BaseReferences<
    _$AppDatabase, $ChildHealthRecordsTable, ChildHealthRecord> {
  $$ChildHealthRecordsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PatientsTable _patientIdTable(_$AppDatabase db) =>
      db.patients.createAlias($_aliasNameGenerator(
          db.childHealthRecords.patientId, db.patients.id));

  $$PatientsTableProcessedTableManager get patientId {
    final $_column = $_itemColumn<String>('patient_id')!;

    final manager = $$PatientsTableTableManager($_db, $_db.patients)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_patientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ChildHealthRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $ChildHealthRecordsTable> {
  $$ChildHealthRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
      column: $table.birthDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get birthWeight => $composableBuilder(
      column: $table.birthWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentWeight => $composableBuilder(
      column: $table.currentWeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get currentHeight => $composableBuilder(
      column: $table.currentHeight, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get feedingType => $composableBuilder(
      column: $table.feedingType, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBreastfeeding => $composableBuilder(
      column: $table.isBreastfeeding,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get developmentStatus => $composableBuilder(
      column: $table.developmentStatus,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get growthStatus => $composableBuilder(
      column: $table.growthStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastWeighingDate => $composableBuilder(
      column: $table.lastWeighingDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nutritionStatus => $composableBuilder(
      column: $table.nutritionStatus,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get complications => $composableBuilder(
      column: $table.complications, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  $$PatientsTableFilterComposer get patientId {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableFilterComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ChildHealthRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $ChildHealthRecordsTable> {
  $$ChildHealthRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
      column: $table.birthDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get birthWeight => $composableBuilder(
      column: $table.birthWeight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentWeight => $composableBuilder(
      column: $table.currentWeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get currentHeight => $composableBuilder(
      column: $table.currentHeight,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get feedingType => $composableBuilder(
      column: $table.feedingType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBreastfeeding => $composableBuilder(
      column: $table.isBreastfeeding,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get developmentStatus => $composableBuilder(
      column: $table.developmentStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get growthStatus => $composableBuilder(
      column: $table.growthStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastWeighingDate => $composableBuilder(
      column: $table.lastWeighingDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nutritionStatus => $composableBuilder(
      column: $table.nutritionStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get complications => $composableBuilder(
      column: $table.complications,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  $$PatientsTableOrderingComposer get patientId {
    final $$PatientsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableOrderingComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ChildHealthRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChildHealthRecordsTable> {
  $$ChildHealthRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<double> get birthWeight => $composableBuilder(
      column: $table.birthWeight, builder: (column) => column);

  GeneratedColumn<double> get currentWeight => $composableBuilder(
      column: $table.currentWeight, builder: (column) => column);

  GeneratedColumn<double> get currentHeight => $composableBuilder(
      column: $table.currentHeight, builder: (column) => column);

  GeneratedColumn<String> get feedingType => $composableBuilder(
      column: $table.feedingType, builder: (column) => column);

  GeneratedColumn<bool> get isBreastfeeding => $composableBuilder(
      column: $table.isBreastfeeding, builder: (column) => column);

  GeneratedColumn<String> get developmentStatus => $composableBuilder(
      column: $table.developmentStatus, builder: (column) => column);

  GeneratedColumn<String> get growthStatus => $composableBuilder(
      column: $table.growthStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get lastWeighingDate => $composableBuilder(
      column: $table.lastWeighingDate, builder: (column) => column);

  GeneratedColumn<String> get nutritionStatus => $composableBuilder(
      column: $table.nutritionStatus, builder: (column) => column);

  GeneratedColumn<String> get complications => $composableBuilder(
      column: $table.complications, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  $$PatientsTableAnnotationComposer get patientId {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.patientId,
        referencedTable: $db.patients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PatientsTableAnnotationComposer(
              $db: $db,
              $table: $db.patients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ChildHealthRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChildHealthRecordsTable,
    ChildHealthRecord,
    $$ChildHealthRecordsTableFilterComposer,
    $$ChildHealthRecordsTableOrderingComposer,
    $$ChildHealthRecordsTableAnnotationComposer,
    $$ChildHealthRecordsTableCreateCompanionBuilder,
    $$ChildHealthRecordsTableUpdateCompanionBuilder,
    (ChildHealthRecord, $$ChildHealthRecordsTableReferences),
    ChildHealthRecord,
    PrefetchHooks Function({bool patientId})> {
  $$ChildHealthRecordsTableTableManager(
      _$AppDatabase db, $ChildHealthRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChildHealthRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChildHealthRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChildHealthRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> patientId = const Value.absent(),
            Value<DateTime> birthDate = const Value.absent(),
            Value<double?> birthWeight = const Value.absent(),
            Value<double?> currentWeight = const Value.absent(),
            Value<double?> currentHeight = const Value.absent(),
            Value<String?> feedingType = const Value.absent(),
            Value<bool> isBreastfeeding = const Value.absent(),
            Value<String?> developmentStatus = const Value.absent(),
            Value<String?> growthStatus = const Value.absent(),
            Value<DateTime?> lastWeighingDate = const Value.absent(),
            Value<String?> nutritionStatus = const Value.absent(),
            Value<String?> complications = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChildHealthRecordsCompanion(
            id: id,
            patientId: patientId,
            birthDate: birthDate,
            birthWeight: birthWeight,
            currentWeight: currentWeight,
            currentHeight: currentHeight,
            feedingType: feedingType,
            isBreastfeeding: isBreastfeeding,
            developmentStatus: developmentStatus,
            growthStatus: growthStatus,
            lastWeighingDate: lastWeighingDate,
            nutritionStatus: nutritionStatus,
            complications: complications,
            createdAt: createdAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String patientId,
            required DateTime birthDate,
            Value<double?> birthWeight = const Value.absent(),
            Value<double?> currentWeight = const Value.absent(),
            Value<double?> currentHeight = const Value.absent(),
            Value<String?> feedingType = const Value.absent(),
            Value<bool> isBreastfeeding = const Value.absent(),
            Value<String?> developmentStatus = const Value.absent(),
            Value<String?> growthStatus = const Value.absent(),
            Value<DateTime?> lastWeighingDate = const Value.absent(),
            Value<String?> nutritionStatus = const Value.absent(),
            Value<String?> complications = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<String?> createdBy = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ChildHealthRecordsCompanion.insert(
            id: id,
            patientId: patientId,
            birthDate: birthDate,
            birthWeight: birthWeight,
            currentWeight: currentWeight,
            currentHeight: currentHeight,
            feedingType: feedingType,
            isBreastfeeding: isBreastfeeding,
            developmentStatus: developmentStatus,
            growthStatus: growthStatus,
            lastWeighingDate: lastWeighingDate,
            nutritionStatus: nutritionStatus,
            complications: complications,
            createdAt: createdAt,
            createdBy: createdBy,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ChildHealthRecordsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({patientId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (patientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.patientId,
                    referencedTable:
                        $$ChildHealthRecordsTableReferences._patientIdTable(db),
                    referencedColumn: $$ChildHealthRecordsTableReferences
                        ._patientIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ChildHealthRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ChildHealthRecordsTable,
    ChildHealthRecord,
    $$ChildHealthRecordsTableFilterComposer,
    $$ChildHealthRecordsTableOrderingComposer,
    $$ChildHealthRecordsTableAnnotationComposer,
    $$ChildHealthRecordsTableCreateCompanionBuilder,
    $$ChildHealthRecordsTableUpdateCompanionBuilder,
    (ChildHealthRecord, $$ChildHealthRecordsTableReferences),
    ChildHealthRecord,
    PrefetchHooks Function({bool patientId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db, _db.patients);
  $$HealthRecordsTableTableManager get healthRecords =>
      $$HealthRecordsTableTableManager(_db, _db.healthRecords);
  $$AppointmentsTableTableManager get appointments =>
      $$AppointmentsTableTableManager(_db, _db.appointments);
  $$AshaWorkersTableTableManager get ashaWorkers =>
      $$AshaWorkersTableTableManager(_db, _db.ashaWorkers);
  $$ImmunizationsTableTableManager get immunizations =>
      $$ImmunizationsTableTableManager(_db, _db.immunizations);
  $$MaternalHealthRecordsTableTableManager get maternalHealthRecords =>
      $$MaternalHealthRecordsTableTableManager(_db, _db.maternalHealthRecords);
  $$ChildHealthRecordsTableTableManager get childHealthRecords =>
      $$ChildHealthRecordsTableTableManager(_db, _db.childHealthRecords);
}
