/*
 * SupabaseService - Phone-based Authentication Service
 * 
 * This service provides phone number authentication using Supabase.
 * It supports SMS OTP verification for both signup and signin.
 * 
 * Features:
 * - Phone number validation and formatting for India (+91)
 * - SMS OTP authentication
 * - User session management
 * - CRUD operations for patients, health records, and appointments
 * 
 * Usage Example:
 * ```dart
 * final authNotifier = ref.read(authProvider.notifier);
 * 
 * // Sign up with phone
 * await authNotifier.signUpWithPhone('+919876543210');
 * 
 * // Verify OTP
 * await authNotifier.verifyOtp('+919876543210', '123456');
 * ```
 * 
 * Note: Make sure to configure Supabase with proper phone auth settings
 * and update the supabaseUrl and supabaseKey with your actual values.
 */

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseService {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? 'YOUR_SUPABASE_URL';
  static String get supabaseKey => dotenv.env['SUPABASE_ANON_KEY'] ?? 'YOUR_SUPABASE_ANON_KEY';
  
  static SupabaseClient get client => Supabase.instance.client;
  
  static Future<void> initialize() async {
    try {
      // Load environment variables
      await dotenv.load(fileName: ".env");
      
      // Check if environment variables are loaded
      if (supabaseUrl == 'YOUR_SUPABASE_URL' || supabaseKey == 'YOUR_SUPABASE_ANON_KEY') {
        debugPrint('⚠️ Warning: Using default Supabase credentials. Please update your .env file');
        debugPrint('Expected format in .env file:');
        debugPrint('SUPABASE_URL=https://your-project-id.supabase.co');
        debugPrint('SUPABASE_ANON_KEY=your-anon-key-here');
      }
      
      await Supabase.initialize(
        url: supabaseUrl,
        anonKey: supabaseKey,
        debug: kDebugMode,
      );
      debugPrint('✅ Supabase initialized successfully');
      debugPrint('🔗 Connected to: $supabaseUrl');
    } catch (e) {
      debugPrint('❌ Supabase initialization failed: $e');
      // For development, we'll continue without Supabase
      // In production, you might want to handle this differently
    }
  }
  
  // Auth methods - Phone-based authentication
  static Future<AuthResponse> verifyOtp({
    required String phone,
    required String token,
  }) async {
    return await client.auth.verifyOTP(
      phone: phone,
      token: token,
      type: OtpType.sms,
    );
  }
  
  static Future<void> signOutStatic() async {
    await client.auth.signOut();
  }
  
  static User? get currentUser => client.auth.currentUser;
  
  static Stream<AuthState> get authStateChanges => client.auth.onAuthStateChange;
  
  // Patient methods
  static Future<List<Map<String, dynamic>>> getPatients({
    String? searchQuery,
    String? filter,
  }) async {
    try {
      var query = client.from('patients').select();
      
      if (searchQuery != null && searchQuery.isNotEmpty) {
        query = query.ilike('name', '%$searchQuery%');
      }
      
      if (filter != null && filter != 'all') {
        query = query.eq('type', filter);
      }
      
      final response = await query.order('created_at', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      debugPrint('Error fetching patients: $e');
      return [];
    }
  }
  
  static Future<Map<String, dynamic>?> getPatient(String id) async {
    try {
      final response = await client
          .from('patients')
          .select()
          .eq('id', id)
          .single();
      return response;
    } catch (e) {
      debugPrint('Error fetching patient: $e');
      return null;
    }
  }
  
  static Future<bool> addPatient(Map<String, dynamic> patientData) async {
    try {
      await client.from('patients').insert(patientData);
      return true;
    } catch (e) {
      debugPrint('Error adding patient: $e');
      return false;
    }
  }
  
  static Future<bool> updatePatient(String id, Map<String, dynamic> updates) async {
    try {
      await client.from('patients').update(updates).eq('id', id);
      return true;
    } catch (e) {
      debugPrint('Error updating patient: $e');
      return false;
    }
  }
  
  static Future<bool> deletePatient(String id) async {
    try {
      await client.from('patients').delete().eq('id', id);
      return true;
    } catch (e) {
      debugPrint('Error deleting patient: $e');
      return false;
    }
  }
  
  // Health records methods
  static Future<List<Map<String, dynamic>>> getHealthRecords(String patientId) async {
    try {
      final response = await client
          .from('health_records')
          .select()
          .eq('patient_id', patientId)
          .order('created_at', ascending: false);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      debugPrint('Error fetching health records: $e');
      return [];
    }
  }
  
  static Future<bool> addHealthRecord(Map<String, dynamic> recordData) async {
    try {
      await client.from('health_records').insert(recordData);
      return true;
    } catch (e) {
      debugPrint('Error adding health record: $e');
      return false;
    }
  }
  
  // Appointments methods
  static Future<List<Map<String, dynamic>>> getAppointments({
    DateTime? date,
  }) async {
    try {
      var query = client.from('appointments').select('''
        *,
        patients (
          id,
          name,
          age
        )
      ''');
      
      if (date != null) {
        final dateStr = date.toIso8601String().split('T')[0];
        query = query.eq('date', dateStr);
      }
      
      final response = await query.order('time', ascending: true);
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      debugPrint('Error fetching appointments: $e');
      return [];
    }
  }
  
  static Future<bool> addAppointment(Map<String, dynamic> appointmentData) async {
    try {
      await client.from('appointments').insert(appointmentData);
      return true;
    } catch (e) {
      debugPrint('Error adding appointment: $e');
      return false;
    }
  }
  
  static Future<bool> updateAppointment(String id, Map<String, dynamic> updates) async {
    try {
      await client.from('appointments').update(updates).eq('id', id);
      return true;
    } catch (e) {
      debugPrint('Error updating appointment: $e');
      return false;
    }
  }
  
  // Add instance methods for phone-based auth
  Session? get currentSession => client.auth.currentSession;
  Stream<AuthState> get authStateStream => client.auth.onAuthStateChange;
  
  Future<void> signUpWithPhone(String phone) async {
    final formattedPhone = SupabaseService.formatPhoneNumber(phone);
    debugPrint('📱 Supabase signUpWithPhone - Raw phone: $phone');
    debugPrint('📱 Supabase signUpWithPhone - Formatted phone: $formattedPhone');
    await client.auth.signInWithOtp(phone: formattedPhone);
  }
  
  Future<void> signInWithPhone(String phone) async {
    final formattedPhone = SupabaseService.formatPhoneNumber(phone);
    debugPrint('📱 Supabase signInWithPhone - Raw phone: $phone');
    debugPrint('📱 Supabase signInWithPhone - Formatted phone: $formattedPhone');
    await client.auth.signInWithOtp(phone: formattedPhone);
  }
  
  Future<AuthResponse> verifyPhoneOtp(String phone, String token) async {
    final formattedPhone = SupabaseService.formatPhoneNumber(phone);
    return await client.auth.verifyOTP(
      phone: formattedPhone,
      token: token,
      type: OtpType.sms,
    );
  }
  
  Future<void> signOut() async {
    await client.auth.signOut();
  }
  
  // Authentication status helpers
  bool get isAuthenticated => currentSession != null;
  String? get userPhone => currentUser?.phone;
  String? get userId => currentUser?.id;

  // Utility methods for phone authentication
  static String formatPhoneNumber(String phone) {
    // Remove any non-digit characters
    String cleaned = phone.replaceAll(RegExp(r'[^\d]'), '');
    debugPrint('📞 Phone formatting - Input: "$phone", Cleaned: "$cleaned"');
    
    // Handle different input formats for Indian phone numbers
    if (cleaned.length == 10 && RegExp(r'^[6-9]').hasMatch(cleaned)) {
      // 10-digit number starting with 6-9 (valid Indian mobile)
      cleaned = '91$cleaned';
    } else if (cleaned.length == 11 && cleaned.startsWith('0')) {
      // 11-digit number starting with 0 (remove leading 0 and add 91)
      cleaned = '91${cleaned.substring(1)}';
    } else if (cleaned.length == 12 && cleaned.startsWith('91')) {
      // Already has 91 prefix, keep as is
    } else if (cleaned.length == 13 && cleaned.startsWith('091')) {
      // Handle 091 prefix (remove 0)
      cleaned = cleaned.substring(1);
    } else {
      debugPrint('⚠️ Unexpected phone number format: $cleaned');
    }
    
    final formatted = '+$cleaned';
    debugPrint('📞 Phone formatting - Output: "$formatted"');
    return formatted;
  }
  
  static bool isValidPhoneNumber(String phone) {
    // Remove any non-digit characters for validation
    String cleaned = phone.replaceAll(RegExp(r'[^\d]'), '');
    
    // Check if it's a valid Indian phone number
    // Should be 10 digits starting with 6-9, or 12 digits starting with 91
    if (cleaned.length == 10 && RegExp(r'^[6-9]').hasMatch(cleaned)) {
      return true;
    } else if (cleaned.length == 12 && cleaned.startsWith('91') && RegExp(r'^91[6-9]').hasMatch(cleaned)) {
      return true;
    } else if (cleaned.length == 11 && cleaned.startsWith('0') && RegExp(r'^0[6-9]').hasMatch(cleaned)) {
      return true; // Handle numbers like 09876543210
    }
    
    return false;
  }
}

final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  return SupabaseService();
});
