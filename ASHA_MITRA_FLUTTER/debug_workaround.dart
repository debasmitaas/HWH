// TEMPORARY WORKAROUND for testing OTP UI
// This bypasses Supabase and shows the OTP field for UI testing
// Remove this after fixing Supabase configuration


// Debug methods for AuthNotifier to simulate OTP sending
// Move these methods inside your AuthNotifier class definition:

// Add these methods inside the AuthNotifier class in lib/shared/providers/auth_provider.dart:

/*
  Future<void> signInWithPhoneDebug(String phone) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final formattedPhone = formatPhoneNumber(phone);
      debugPrint('🔐 DEBUG: Simulating OTP send for phone: $formattedPhone');
      
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Simulate successful OTP send by setting loading to false without error
      state = state.copyWith(isLoading: false);
      
      debugPrint('✅ DEBUG: Simulated OTP sent successfully');
    } catch (e) {
      debugPrint('❌ DEBUG: Error in simulation: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> signUpWithPhoneDebug(String phone, {
    required String fullName,
    required String district,
    required String block,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final formattedPhone = formatPhoneNumber(phone);
      debugPrint('📝 DEBUG: Simulating OTP send for sign up with phone: $formattedPhone');
      debugPrint('📝 DEBUG: User details - Name: $fullName, District: $district, Block: $block');
      
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Simulate successful OTP send by setting loading to false without error
      state = state.copyWith(isLoading: false);
      
      debugPrint('✅ DEBUG: Simulated OTP sent successfully for sign up');
    } catch (e) {
      debugPrint('❌ DEBUG: Error in sign up simulation: $e');
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
*/

// To use this:
// 1. Import this file in your auth provider or login screen
// 2. Replace the call to signInWithPhone(phone) with signInWithPhoneDebug(phone)
// 3. Replace the call to signUpWithPhone(phone, ...) with signUpWithPhoneDebug(phone, ...)
// 4. This will simulate OTP sending and navigate to the OTP screen
// 5. Remember to revert back to real Supabase calls after testing
