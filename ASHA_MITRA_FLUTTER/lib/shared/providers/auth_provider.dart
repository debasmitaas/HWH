import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/supabase_service.dart';

class AuthState {
  final bool isAuthenticated;
  final User? user;
  final bool isLoading;
  final String? error;

  const AuthState({
    this.isAuthenticated = false,
    this.user,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final SupabaseService _supabaseService;

  AuthNotifier(this._supabaseService) : super(const AuthState()) {
    _checkAuthState();
    _setupAuthListener();
  }

  void _checkAuthState() {
    final session = _supabaseService.currentSession;
    state = state.copyWith(
      isAuthenticated: session != null,
      user: session?.user,
    );
  }

  void _setupAuthListener() {
    _supabaseService.authStateStream.listen((event) {
      state = state.copyWith(
        isAuthenticated: event.session != null,
        user: event.session?.user,
      );
    });
  }

  Future<void> signInWithPhone(String phone) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final formattedPhone = formatPhoneNumber(phone);
      debugPrint('🔐 Attempting sign in with phone: $formattedPhone');
      
      // Add timeout to prevent infinite loading
      await _supabaseService.signInWithPhone(phone).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Request timed out after 10 seconds. Please check your internet connection and try again.');
        },
      );
      
      debugPrint('✅ OTP request sent successfully');
      // Clear loading state after successful OTP send
      state = state.copyWith(isLoading: false);
    } catch (e) {
      debugPrint('❌ Sign in error: $e');
      debugPrint('❌ Error type: ${e.runtimeType}');
      if (e is AuthException) {
        debugPrint('❌ Auth error message: ${e.message}');
        debugPrint('❌ Auth error status code: ${e.statusCode}');
      }
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> signUpWithPhone(String phone, {
    required String fullName,
    required String district,
    required String block,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final formattedPhone = formatPhoneNumber(phone);
      debugPrint('📝 Attempting sign up with phone: $formattedPhone');
      debugPrint('📝 User details - Name: $fullName, District: $district, Block: $block');
      
      // Add timeout to prevent infinite loading
      await _supabaseService.signUpWithPhone(phone).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw Exception('Request timed out after 10 seconds. Please check your internet connection and try again.');
        },
      );
      
      debugPrint('✅ OTP request sent successfully for sign up');
      // Clear loading state after successful OTP send
      state = state.copyWith(isLoading: false);
      // Note: User metadata should be saved after OTP verification
      // You may want to store this data temporarily and save it after verification
    } catch (e) {
      debugPrint('❌ Sign up error: $e');
      debugPrint('❌ Error type: ${e.runtimeType}');
      if (e is AuthException) {
        debugPrint('❌ Auth error message: ${e.message}');
        debugPrint('❌ Auth error status code: ${e.statusCode}');
      }
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
  
  Future<void> verifyOtp(String phone, String token) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      await _supabaseService.verifyPhoneOtp(phone, token);
      // State will be updated by the auth listener
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);
    
    try {
      await _supabaseService.signOut();
      // State will be updated by the auth listener
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void forceStopLoading() {
    debugPrint('🛑 Force stopping loading state');
    state = state.copyWith(isLoading: false, error: 'Request timed out. Please try again.');
  }

  // Helper methods for phone authentication
  bool isValidPhoneNumber(String phone) {
    return SupabaseService.isValidPhoneNumber(phone);
  }
  
  String formatPhoneNumber(String phone) {
    return SupabaseService.formatPhoneNumber(phone);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final supabaseService = ref.watch(supabaseServiceProvider);
  return AuthNotifier(supabaseService);
});
