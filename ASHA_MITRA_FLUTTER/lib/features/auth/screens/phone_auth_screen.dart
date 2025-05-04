import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/providers/auth_provider.dart';
import '../../../shared/providers/language_provider.dart';
import '../../../shared/widgets/language_toggle.dart';
import '../../../shared/widgets/voice_input_button.dart';

class PhoneAuthScreen extends ConsumerStatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  ConsumerState<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends ConsumerState<PhoneAuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final _nameController = TextEditingController();
  final _districtController = TextEditingController();
  final _blockController = TextEditingController();
  
  bool _isSignUp = false;
  bool _isOtpSent = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    _nameController.dispose();
    _districtController.dispose();
    _blockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final texts = ref.watch(textsProvider);
    
    // Listen for successful authentication
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (next.isAuthenticated && !next.isLoading) {
        context.go('/dashboard');
      }
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Colors.red,
          ),
        );
        ref.read(authProvider.notifier).clearError();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(texts.appName),
        actions: const [
          LanguageToggle(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // App Logo/Header
                const SizedBox(height: 32),
                Icon(
                  Icons.health_and_safety,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  texts.appTagline,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 48),

                // Phone number input
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: texts.phoneNumber,
                    hintText: '9876543210',
                    prefixIcon: const Icon(Icons.phone),
                    border: const OutlineInputBorder(),
                    suffixIcon: VoiceInputButton(
                      onVoiceInput: (text) {
                        _phoneController.text = text;
                      },
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }
                    final authNotifier = ref.read(authProvider.notifier);
                    if (!authNotifier.isValidPhoneNumber(value)) {
                      return 'Please enter a valid Indian phone number';
                    }
                    return null;
                  },
                  enabled: !_isOtpSent,
                ),
                const SizedBox(height: 16),

                // OTP input (only show after OTP is sent)
                if (_isOtpSent) ...[
                  TextFormField(
                    controller: _otpController,
                    decoration: const InputDecoration(
                      labelText: 'Enter OTP',
                      hintText: '123456',
                      prefixIcon: Icon(Icons.security),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'OTP is required';
                      }
                      if (value.length != 6) {
                        return 'OTP must be 6 digits';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                ],

                // Additional fields for signup
                if (_isSignUp && !_isOtpSent) ...[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: texts.fullName,
                      prefixIcon: const Icon(Icons.person),
                      border: const OutlineInputBorder(),
                      suffixIcon: VoiceInputButton(
                        onVoiceInput: (text) {
                          _nameController.text = text;
                        },
                      ),
                    ),
                    validator: (value) {
                      if (_isSignUp && (value == null || value.isEmpty)) {
                        return 'Full name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _districtController,
                    decoration: InputDecoration(
                      labelText: texts.district,
                      prefixIcon: const Icon(Icons.location_city),
                      border: const OutlineInputBorder(),
                      suffixIcon: VoiceInputButton(
                        onVoiceInput: (text) {
                          _districtController.text = text;
                        },
                      ),
                    ),
                    validator: (value) {
                      if (_isSignUp && (value == null || value.isEmpty)) {
                        return 'District is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _blockController,
                    decoration: InputDecoration(
                      labelText: texts.block,
                      prefixIcon: const Icon(Icons.location_on),
                      border: const OutlineInputBorder(),
                      suffixIcon: VoiceInputButton(
                        onVoiceInput: (text) {
                          _blockController.text = text;
                        },
                      ),
                    ),
                    validator: (value) {
                      if (_isSignUp && (value == null || value.isEmpty)) {
                        return 'Block is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                ],

                const SizedBox(height: 24),

                // Action button
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: authState.isLoading ? null : _handleAction,
                    child: authState.isLoading
                        ? const CircularProgressIndicator()
                        : Text(_getActionButtonText()),
                  ),
                ),

                const SizedBox(height: 16),

                // Switch between sign in and sign up
                if (!_isOtpSent)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isSignUp = !_isSignUp;
                      });
                    },
                    child: Text(
                      _isSignUp
                          ? 'Already have an account? Sign In'
                          : 'Don\'t have an account? Sign Up',
                    ),
                  ),

                // Resend OTP button
                if (_isOtpSent)
                  TextButton(
                    onPressed: _resendOtp,
                    child: const Text('Resend OTP'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getActionButtonText() {
    if (_isOtpSent) {
      return 'Verify OTP';
    } else if (_isSignUp) {
      return 'Sign Up';
    } else {
      return 'Sign In';
    }
  }

  void _handleAction() {
    if (!_formKey.currentState!.validate()) return;

    if (_isOtpSent) {
      _verifyOtp();
    } else {
      _sendOtp();
    }
  }

  void _sendOtp() {
    final authNotifier = ref.read(authProvider.notifier);
    final phone = authNotifier.formatPhoneNumber(_phoneController.text);

    if (_isSignUp) {
      authNotifier.signUpWithPhone(
        phone,
        fullName: _nameController.text,
        district: _districtController.text,
        block: _blockController.text,
      );
    } else {
      authNotifier.signInWithPhone(phone);
    }

    setState(() {
      _isOtpSent = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('OTP sent to $phone'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _verifyOtp() {
    final authNotifier = ref.read(authProvider.notifier);
    final phone = authNotifier.formatPhoneNumber(_phoneController.text);
    final otp = _otpController.text;

    authNotifier.verifyOtp(phone, otp);
  }

  void _resendOtp() {
    final authNotifier = ref.read(authProvider.notifier);
    final phone = authNotifier.formatPhoneNumber(_phoneController.text);

    if (_isSignUp) {
      authNotifier.signUpWithPhone(
        phone,
        fullName: _nameController.text,
        district: _districtController.text,
        block: _blockController.text,
      );
    } else {
      authNotifier.signInWithPhone(phone);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('OTP resent to $phone'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
