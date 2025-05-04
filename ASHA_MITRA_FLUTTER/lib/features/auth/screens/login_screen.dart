import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/providers/auth_provider.dart';
import '../../../shared/providers/language_provider.dart';
import '../../../shared/widgets/language_toggle.dart';
import '../../../shared/widgets/supabase_connection_test.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _districtController = TextEditingController();
  final _blockController = TextEditingController();
  
  bool _isSignUp = false;
  Timer? _loadingTimeout;

  @override
  void initState() {
    super.initState();
    // Set up a safety timeout to prevent infinite loading
    _setupLoadingTimeout();
  }

  void _setupLoadingTimeout() {
    _loadingTimeout?.cancel();
    _loadingTimeout = Timer.periodic(const Duration(seconds: 15), (timer) {
      final authState = ref.read(authProvider);
      if (authState.isLoading) {
        debugPrint('⚠️ Loading timeout (15s) - forcing loading state to false');
        // Force clear loading state by calling a new method
        ref.read(authProvider.notifier).forceStopLoading();
        timer.cancel();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Request timed out. Please try again.'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _loadingTimeout?.cancel();
    _phoneController.dispose();
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
      debugPrint('🔄 Auth state changed - Previous loading: ${previous?.isLoading}, Next loading: ${next.isLoading}');
      debugPrint('🔄 Auth state changed - Previous error: ${previous?.error}, Next error: ${next.error}');
      debugPrint('🔄 Auth state changed - Authenticated: ${next.isAuthenticated}');
      
      if (next.isAuthenticated && !next.isLoading) {
        context.go('/dashboard');
        return;
      }
      
      // Only show error if there's a new non-null error (don't show when clearing)
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              
              // Language Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  LanguageToggle(),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // Logo and Title
              Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.health_and_safety,
                      size: 60,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    texts.appName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    texts.appTagline,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // Auth Form
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Toggle between Sign In and Sign Up
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isSignUp = false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: !_isSignUp ? Theme.of(context).colorScheme.primary : null,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  texts.signIn,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: !_isSignUp 
                                        ? Theme.of(context).colorScheme.onPrimary
                                        : Theme.of(context).colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isSignUp = true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: _isSignUp ? Theme.of(context).colorScheme.primary : null,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  texts.signUp,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: _isSignUp 
                                        ? Theme.of(context).colorScheme.onPrimary
                                        : Theme.of(context).colorScheme.onSurfaceVariant,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Sign Up Fields
                    if (_isSignUp) ...[
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: texts.fullName,
                          prefixIcon: const Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return texts.pleaseEnterName;
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
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return texts.pleaseEnterDistrict;
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
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return texts.pleaseEnterBlock;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                    
                    // Phone Number Field
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        labelText: texts.phoneNumber,
                        hintText: '9876543210',
                        prefixIcon: const Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return texts.pleaseEnterPhone;
                        }
                        final authNotifier = ref.read(authProvider.notifier);
                        if (!authNotifier.isValidPhoneNumber(value)) {
                          return 'Please enter a valid Indian phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    
                    const SizedBox(height: 24),
                    
                    // Submit Button
                    ElevatedButton(
                      onPressed: authState.isLoading ? null : () {
                        debugPrint('🔥🔥🔥 BUTTON PRESSED DIRECTLY!');
                        if (!_formKey.currentState!.validate()) {
                          debugPrint('❌ Form validation failed!');
                          return;
                        }
                        debugPrint('✅ Form validation passed, navigating NOW!');
                        
                        final authNotifier = ref.read(authProvider.notifier);
                        final phone = authNotifier.formatPhoneNumber(_phoneController.text);
                        
                        debugPrint('🚀 IMMEDIATE NAVIGATION TO OTP SCREEN!');
                        
                        // Store data for navigation
                        final formattedPhone = phone;
                        final isSignUpMode = _isSignUp;
                        
                        // Navigate using a delayed approach to avoid conflicts
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            if (isSignUpMode) {
                              debugPrint('🔥 Navigating to OTP screen for SIGNUP');
                              final url = '/otp-verification?phone=${Uri.encodeComponent(formattedPhone)}&isSignUp=true&fullName=${Uri.encodeComponent(_nameController.text.trim())}&district=${Uri.encodeComponent(_districtController.text.trim())}&block=${Uri.encodeComponent(_blockController.text.trim())}';
                              debugPrint('🔥 NAVIGATION URL: $url');
                              context.go(url);
                              debugPrint('🔥 NAVIGATION GO CALLED FOR SIGNUP');
                            } else {
                              debugPrint('🔥 Navigating to OTP screen for SIGNIN');
                              final url = '/otp-verification?phone=${Uri.encodeComponent(formattedPhone)}&isSignUp=false';
                              debugPrint('🔥 NAVIGATION URL: $url');
                              context.go(url);
                              debugPrint('🔥 NAVIGATION GO CALLED FOR SIGNIN');
                            }
                          }
                        });
                        
                        // TEMPORARILY DISABLE OTP SENDING TO ISOLATE NAVIGATION ISSUE
                        debugPrint('🚫 TEMPORARILY SKIPPING OTP SEND TO DEBUG NAVIGATION');
                        /*
                        // THEN send OTP
                        if (_isSignUp) {
                          authNotifier.signUpWithPhone(
                            phone,
                            fullName: _nameController.text.trim(),
                            district: _districtController.text.trim(),
                            block: _blockController.text.trim(),
                          );
                        } else {
                          authNotifier.signInWithPhone(phone);
                        }
                        */
                      },
                      child: authState.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(_getButtonText()),
                    ),
                    
                    const SizedBox(height: 16),
                    // Debug connection test button (only in debug mode)
                    if (kDebugMode) ...[
                      // Debug info panel
                      Container(
                        margin: const EdgeInsets.only(top: 16),
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
                            const SizedBox(height: 4),
                            Text(
                              'Loading: ${authState.isLoading}',
                              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                            ),
                            Text(
                              'Error: ${authState.error ?? 'None'}',
                              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                            ),
                            Text(
                              'Mode: ${_isSignUp ? 'Sign Up' : 'Sign In'}',
                              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                            ),
                            Text(
                              'Authenticated: ${authState.isAuthenticated}',
                              style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SupabaseConnectionTest(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.bug_report),
                          label: const Text('Test Supabase Connection'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Emergency button to clear loading state
                      if (authState.isLoading)
                        OutlinedButton.icon(
                          onPressed: () {
                            ref.read(authProvider.notifier).forceStopLoading();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Loading state cleared (EMERGENCY)'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                          icon: const Icon(Icons.stop),
                          label: const Text('Stop Loading (EMERGENCY)'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red[600],
                          ),
                        ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getButtonText() {
    if (_isSignUp) {
      return 'Send OTP (Sign Up)';
    } else {
      return 'Send OTP (Sign In)';
    }
  }


}
