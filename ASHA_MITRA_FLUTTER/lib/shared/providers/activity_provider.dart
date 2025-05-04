import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

/// Represents a user activity in the application
class Activity {
  final String id;
  final String title;
  final String? description;
  final ActivityType type;
  final String? patientId;
  final String? patientName;
  final DateTime createdAt;

  Activity({
    required this.id,
    required this.title,
    this.description,
    required this.type,
    this.patientId,
    this.patientName,
    required this.createdAt,
  });
}

/// Types of activities that can be recorded
enum ActivityType {
  patientAdded,
  patientUpdated,
  recordAdded,
  recordDeleted,
  appointmentScheduled,
  appointmentCompleted,
}

/// Maps activity types to icons
IconData getActivityIcon(ActivityType type) {
  switch (type) {
    case ActivityType.patientAdded:
      return Icons.person_add;
    case ActivityType.patientUpdated:
      return Icons.edit;
    case ActivityType.recordAdded:
      return Icons.medical_services;
    case ActivityType.recordDeleted:
      return Icons.delete;
    case ActivityType.appointmentScheduled:
      return Icons.calendar_today;
    case ActivityType.appointmentCompleted:
      return Icons.check_circle;
  }
}

/// Maps activity types to colors
Color getActivityColor(ActivityType type) {
  switch (type) {
    case ActivityType.patientAdded:
      return Colors.green;
    case ActivityType.patientUpdated:
      return Colors.blue;
    case ActivityType.recordAdded:
      return Colors.purple;
    case ActivityType.recordDeleted:
      return Colors.red;
    case ActivityType.appointmentScheduled:
      return Colors.orange;
    case ActivityType.appointmentCompleted:
      return Colors.teal;
  }
}

/// Returns a formatted string for the time elapsed since the activity
String getTimeElapsed(DateTime dateTime, BuildContext context) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);
  
  if (difference.inDays > 30) {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  } else if (difference.inDays > 1) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays == 1) {
    return 'Yesterday';
  } else if (difference.inHours >= 1) {
    return '${difference.inHours} hours ago';
  } else if (difference.inMinutes >= 1) {
    return '${difference.inMinutes} minutes ago';
  } else {
    return 'Just now';
  }
}

class ActivityNotifier extends StateNotifier<List<Activity>> {
  ActivityNotifier() : super([]);

  /// Add a new activity
  void addActivity({
    required String title,
    String? description,
    required ActivityType type,
    String? patientId,
    String? patientName,
  }) {
    final activity = Activity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      type: type,
      patientId: patientId,
      patientName: patientName,
      createdAt: DateTime.now(),
    );
    
    state = [activity, ...state];
    
    // Limit the list to the last 50 activities to avoid memory issues
    if (state.length > 50) {
      state = state.sublist(0, 50);
    }
  }

  /// Get the most recent activities, limited by count
  List<Activity> getRecentActivities({int count = 5}) {
    return state.length <= count ? state : state.sublist(0, count);
  }

  /// Clear all activities
  void clearActivities() {
    state = [];
  }
}

/// Provider for activities
final activityProvider = StateNotifierProvider<ActivityNotifier, List<Activity>>(
  (ref) => ActivityNotifier(),
);
