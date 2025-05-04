
class HealthRecord {
  final String id;
  final String patientId;
  final String title;
  final String notes;
  final DateTime date;
  final DateTime createdAt;

  HealthRecord({
    required this.id,
    required this.patientId,
    required this.title,
    required this.notes,
    required this.date,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'title': title,
      'notes': notes,
      'date': date.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory HealthRecord.fromJson(Map<String, dynamic> json) {
    return HealthRecord(
      id: json['id'],
      patientId: json['patientId'],
      title: json['title'],
      notes: json['notes'],
      date: DateTime.parse(json['date']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  @override
  String toString() {
    return 'HealthRecord{id: $id, patientId: $patientId, title: $title, date: $date}';
  }
}
