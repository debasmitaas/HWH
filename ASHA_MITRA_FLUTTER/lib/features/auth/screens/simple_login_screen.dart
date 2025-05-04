import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/providers/language_provider.dart';
import '../../../shared/widgets/language_toggle.dart';

// State provider to track login status
final isLoggedInProvider = StateProvider<bool>((ref) => false);

// Mock user data provider
final userDataProvider = StateProvider<Map<String, String>?>((ref) => null);

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
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _districtController.dispose();
    _blockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final texts = ref.watch(textsProvider);
    
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
                        if (!_isValidPhoneNumber(value)) {
                          return 'Please enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    
                    // Submit Button
                    ElevatedButton(
                      onPressed: _isLoading ? null : _handleSubmit,
                      child: _isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(_isSignUp ? texts.signUp : texts.signIn),
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

  bool _isValidPhoneNumber(String phone) {
    // Simple validation for a 10-digit Indian phone number
    final cleanPhone = phone.trim().replaceAll(' ', '');
    return RegExp(r'^\d{10}$').hasMatch(cleanPhone);
  }

  String _formatPhoneNumber(String phone) {
    // Format phone number to add +91 prefix if needed
    final cleanPhone = phone.trim().replaceAll(' ', '');
    return '+91$cleanPhone';
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    
    setState(() => _isLoading = true);
    
    try {
      final phone = _formatPhoneNumber(_phoneController.text);
      
      // Simulate a network request
      await Future.delayed(const Duration(milliseconds: 800));
      
      // Create user data map
      final Map<String, String> userData;
      
      if (_isSignUp) {
        // Use the user-entered data for sign up
        userData = {
          'phone': phone,
          'name': _nameController.text.trim(),
          'district': _districtController.text.trim(),
          'block': _blockController.text.trim(),
          'role': 'asha_worker',
        };
      } else {
        // For sign in, we should use the phone to look up the user
        // For demo purposes, we'll use the phone number and a default name
        // In a real app, we would fetch this from a database
        userData = {
          'phone': phone,
          'name': _nameController.text.isEmpty ? 'ASHA Worker' : _nameController.text.trim(),
          'district': 'Sample District',
          'block': 'Sample Block',
          'role': 'asha_worker',
        };
      }
      
      // Store user data in provider for app to use
      ref.read(userDataProvider.notifier).state = userData;
      
      // Save login state and user data in shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_logged_in', true);
      
      // Save user data individually to make it easier to retrieve
      final userDataFromProvider = ref.read(userDataProvider);
      if (userDataFromProvider != null) {
        await prefs.setString('user_name', userDataFromProvider['name'] ?? '');
        await prefs.setString('user_phone', userDataFromProvider['phone'] ?? '');
        await prefs.setString('user_district', userDataFromProvider['district'] ?? '');
        await prefs.setString('user_block', userDataFromProvider['block'] ?? '');
        await prefs.setString('user_role', userDataFromProvider['role'] ?? '');
      }
      
      // Update the logged in state
      ref.read(isLoggedInProvider.notifier).state = true;
      
      // Navigate to dashboard
      if (mounted) {
        context.go('/dashboard');
      }
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
