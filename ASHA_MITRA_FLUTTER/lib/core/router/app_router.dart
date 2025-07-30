import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/screens/simple_login_screen.dart';
import '../../features/dashboard/screens/dashboard_screen.dart';
import '../../features/patient/screens/patient_list_screen.dart';
import '../../features/patient/screens/patient_detail_screen.dart';
import '../../features/patient/screens/add_patient_screen.dart';
import '../../features/patient/screens/add_record_screen.dart';
import '../../features/appointments/screens/appointment_list_screen.dart';
import '../../features/appointments/screens/schedule_appointment_screen.dart';
import '../../features/reports/screens/reports_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/help/screens/help_screen.dart';
import '../../features/help/screens/voice_help_screen.dart';
import '../../features/chatbot/screens/chatbot_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login', // Start with login screen
    redirect: (context, state) {
      debugPrint('🔍 ROUTER REDIRECT - Path: ${state.matchedLocation}, FullPath: ${state.fullPath}');
      
      // Check if user is logged in using provider
      final isLoggedIn = ref.read(isLoggedInProvider);
      
      // If not logged in and trying to access a protected route, redirect to login
      if (!isLoggedIn && !state.matchedLocation.startsWith('/login')) {
        return '/login';
      }
      
      // If logged in and trying to access login page, redirect to dashboard
      if (isLoggedIn && state.matchedLocation.startsWith('/login')) {
        return '/dashboard';
      }
      
      return null;
    },
    routes: [
      // Auth Route - Simple Login/Signup
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      
      // Main App Routes
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      
      // Patient Management Routes
      GoRoute(
        path: '/patients',
        name: 'patients',
        builder: (context, state) => const PatientListScreen(),
      ),
      GoRoute(
        path: '/patients/add',
        name: 'add-patient',
        builder: (context, state) => const AddPatientScreen(),
      ),
      GoRoute(
        path: '/patients/:id',
        name: 'patient-detail',
        builder: (context, state) {
          final patientId = state.pathParameters['id']!;
          return PatientDetailScreen(patientId: patientId);
        },
      ),
      GoRoute(
        path: '/patients/:id/add-record',
        name: 'add-record',
        builder: (context, state) {
          final patientId = state.pathParameters['id']!;
          return AddRecordScreen(patientId: patientId);
        },
      ),
      
      // Appointments Routes
      GoRoute(
        path: '/appointments',
        name: 'appointments',
        builder: (context, state) => const AppointmentListScreen(),
      ),
      GoRoute(
        path: '/appointments/schedule',
        name: 'schedule-appointment',
        builder: (context, state) => const ScheduleAppointmentScreen(),
      ),
      GoRoute(
        path: '/appointments/schedule/:patientId',
        name: 'schedule-appointment-patient',
        builder: (context, state) {
          final patientId = state.pathParameters['patientId']!;
          return ScheduleAppointmentScreen(patientId: patientId);
        },
      ),
      
      // Reports Route
      GoRoute(
        path: '/reports',
        name: 'reports',
        builder: (context, state) => const ReportsScreen(),
      ),
      
      // Profile Route
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      
      // Help Routes
      GoRoute(
        path: '/help',
        name: 'help',
        builder: (context, state) => const HelpScreen(),
      ),
      GoRoute(
        path: '/help/voice',
        name: 'voice-help',
        builder: (context, state) => const VoiceHelpScreen(),
      ),
      
      // Chatbot Route
      GoRoute(
        path: '/chatbot',
        name: 'chatbot',
        builder: (context, state) => const ChatbotScreen(),
      ),
    ],
  );
});
