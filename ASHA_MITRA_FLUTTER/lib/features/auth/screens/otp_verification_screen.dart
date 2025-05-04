import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/providers/auth_provider.dart';
import '../../../shared/providers/language_provider.dart';
import '../../../shared/widgets/direct_text_updater.dart';
import '../../../shared/widgets/voice_input_button.dart';
import '../../../shared/widgets/language_toggle.dart';

// Helper function to convert Bengali numerals to English numerals
String convertBengaliToEnglishNumerals(String input) {
  const bengaliNumerals = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
  
  String output = input;
  for (int i = 0; i < bengaliNumerals.length; i++) {
    output = output.replaceAll(bengaliNumerals[i], i.toString());
  }
  
  debugPrint('🔢 Converting Bengali "$input" to English "$output"');
  return output;
}

class OtpVerificationScreen extends ConsumerStatefulWidget {
  final String phoneNumber;
  final bool isSignUp;
  final Map<String, String>? signUpData;

  OtpVerificationScreen({
    super.key,
    required this.phoneNumber,
    required this.isSignUp,
    this.signUpData,
  }) {
    print('🔍 OTP SCREEN CONSTRUCTOR - Phone: "$phoneNumber", IsSignUp: $isSignUp, SignUpData: $signUpData');
  }

  @override
  ConsumerState<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  Timer? _resendTimer;
  int _resendSeconds = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    print('🔍 OTP SCREEN INIT - Phone: ${widget.phoneNumber}, IsSignUp: ${widget.isSignUp}');
    _startResendTimer();
  }

  void _startResendTimer() {
    _canResend = false;
    _resendSeconds = 30;
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendSeconds > 0) {
          _resendSeconds--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('🔍 OTP SCREEN BUILD CALLED - Phone: ${widget.phoneNumber}');
    final authState = ref.watch(authProvider);
    final texts = ref.watch(textsProvider);
    
    // Listen for authentication success
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.isAuthenticated && !next.isLoading) {
        context.go('/dashboard');
        return;
      }
      
      if (next.error != null && (previous?.error != next.error)) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.error!),
              backgroundColor: Colors.red,
              action: SnackBarAction(
                label: 'Try Again',
                onPressed: () {
                  ref.read(authProvider.notifier).clearError();
                },
              ),
            ),
          );
        }
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          texts.verifyOtp,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          LanguageToggle(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              
              // OTP Icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.security,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Title
              Text(
                texts.enterVerificationCode,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 16),
              
              // Phone number display - BOLD AND VISIBLE
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${texts.otpSentTo}: ${widget.phoneNumber}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              // OTP Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _otpController,
                      decoration: InputDecoration(
                        labelText: texts.enterSixDigitOtp,
                        hintText: '123456',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: VoiceInputButton(
                              heroTag: "voice_otp_button",
                              onVoiceInput: (String text) {
                                debugPrint('📝 OTP field: Voice input received: "$text" (length: ${text.length})');
                                
                                if (text.isEmpty) {
                                  debugPrint('📝 OTP field: Empty text received, ignoring');
                                  return;
                                }
                                
                                // First convert Bengali numerals to English if needed
                                String normalizedText = convertBengaliToEnglishNumerals(text);
                                
                                // Extract digits from the spoken text
                                final numbers = normalizedText.replaceAll(RegExp(r'[^0-9]'), '');
                                
                                if (numbers.isEmpty) {
                                  debugPrint('📝 OTP field: No numbers found in "$text", ignoring');
                                  return;
                                }
                                
                                // Limit to 6 digits
                                final newText = numbers.length <= 6 ? numbers : numbers.substring(0, 6);
                                debugPrint('📝 OTP field: Extracted digits: "$newText"');
                                
                                // Use our special utility to ensure the text gets set properly
                                try {
                                  if (mounted) {
                                    DirectTextUpdater.updateText(
                                      controller: _otpController,
                                      text: newText,
                                      setState: setState,
                                    );
                                    
                                    // Force redraw after a small delay
                                    Future.delayed(const Duration(milliseconds: 200), () {
                                      if (mounted) setState(() {});
                                    });
                                    
                                    // If OTP is complete (6 digits), auto-submit after a delay
                                    if (newText.length == 6) {
                                      debugPrint('📝 OTP field: Complete OTP detected, auto-submitting...');
                                      Future.delayed(const Duration(seconds: 1), () {
                                        if (mounted) _verifyOtp();
                                      });
                                    }
                                  }
                                } catch (e) {
                                  debugPrint('📝 OTP field: Error updating text: $e');
                                }
                              },
                              hint: texts.enterSixDigitOtp,
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      autofocus: true,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return texts.pleaseEnterOtp;
                        }
                        
                        // Convert Bengali numerals to English if needed
                        String normalizedValue = convertBengaliToEnglishNumerals(value);
                        
                        if (normalizedValue.length != 6) {
                          return texts.otpMustBeSixDigits;
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Verify Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: authState.isLoading ? null : _verifyOtp,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: authState.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Text(
                                widget.isSignUp ? texts.verifyAndSignUp : texts.verifyAndSignIn,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Resend OTP
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${texts.didntReceiveCode} ",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        if (_canResend)
                          TextButton(
                            onPressed: _resendOtp,
                            child: Text(
                              texts.resendOtp,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          )
                        else
                          Text(
                            '${texts.resendIn} ${_resendSeconds}s',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 50),
              
              // Debug info (only in debug mode)
              if (kDebugMode)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DEBUG INFO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Phone: ${widget.phoneNumber}',
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                      Text(
                        'Mode: ${widget.isSignUp ? 'Sign Up' : 'Sign In'}',
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                      Text(
                        'Loading: ${authState.isLoading}',
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                      Text(
                        'Error: ${authState.error ?? 'None'}',
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyOtp() {
    if (!_formKey.currentState!.validate()) return;

    final authNotifier = ref.read(authProvider.notifier);
    authNotifier.verifyOtp(widget.phoneNumber, _otpController.text);
  }

  void _resendOtp() {
    final authNotifier = ref.read(authProvider.notifier);
    final texts = ref.read(textsProvider);
    
    // Clear OTP field
    _otpController.clear();
    
    // Show feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${texts.resendOtp} ${widget.phoneNumber}...'),
        backgroundColor: Colors.blue,
        duration: const Duration(seconds: 2),
      ),
    );
    
    // Restart timer
    _startResendTimer();
    
    // Resend OTP
    if (widget.isSignUp && widget.signUpData != null) {
      authNotifier.signUpWithPhone(
        widget.phoneNumber,
        fullName: widget.signUpData!['fullName']!,
        district: widget.signUpData!['district']!,
        block: widget.signUpData!['block']!,
      );
    } else {
      authNotifier.signInWithPhone(widget.phoneNumber);
    }
  }
}
