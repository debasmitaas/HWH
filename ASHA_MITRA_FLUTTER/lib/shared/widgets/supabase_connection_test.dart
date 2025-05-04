import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/supabase_service.dart';

class SupabaseConnectionTest extends ConsumerStatefulWidget {
  const SupabaseConnectionTest({super.key});

  @override
  ConsumerState<SupabaseConnectionTest> createState() => _SupabaseConnectionTestState();
}

class _SupabaseConnectionTestState extends ConsumerState<SupabaseConnectionTest> {
  String _connectionStatus = 'Testing connection...';
  Color _statusColor = Colors.orange;
  bool _isLoading = true;
  final TextEditingController _phoneController = TextEditingController();
  String _phoneTestResult = '';

  @override
  void initState() {
    super.initState();
    _testConnection();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _testConnection() async {
    try {
      setState(() {
        _connectionStatus = 'Checking environment variables...';
        _isLoading = true;
      });

      // Check if environment variables are loaded
      final url = SupabaseService.supabaseUrl;
      final key = SupabaseService.supabaseKey;

      if (url == 'YOUR_SUPABASE_URL' || key == 'YOUR_SUPABASE_ANON_KEY') {
        setState(() {
          _connectionStatus = '❌ Environment variables not configured.\nPlease update your .env file.';
          _statusColor = Colors.red;
          _isLoading = false;
        });
        return;
      }

      setState(() {
        _connectionStatus = 'Testing Supabase connection...';
      });

      // Test basic connection
      final client = SupabaseService.client;
      
      // Try to get current session (this will test if Supabase is properly initialized)
      final session = client.auth.currentSession;
      
      setState(() {
        _connectionStatus = '✅ Supabase connected successfully!\n\n'
            'URL: $url\n'
            'Auth Status: ${session != null ? 'Authenticated' : 'Not authenticated'}\n'
            'Ready for phone authentication!';
        _statusColor = Colors.green;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _connectionStatus = '❌ Connection failed:\n$e\n\n'
            'Please check your .env configuration.';
        _statusColor = Colors.red;
        _isLoading = false;
      });
    }
  }

  Future<void> _testPhoneAuth() async {
    if (_phoneController.text.isEmpty) {
      setState(() {
        _phoneTestResult = 'Please enter a phone number';
      });
      return;
    }

    setState(() {
      _phoneTestResult = 'Testing phone auth...';
    });

    try {
      final phone = _phoneController.text;
      final formattedPhone = SupabaseService.formatPhoneNumber(phone);
      
      setState(() {
        _phoneTestResult = 'Formatted phone: $formattedPhone\nSending OTP...';
      });

      // Try to send OTP
      await SupabaseService.client.auth.signInWithOtp(phone: formattedPhone);
      
      setState(() {
        _phoneTestResult = '✅ OTP sent successfully to $formattedPhone';
      });
    } catch (e) {
      setState(() {
        _phoneTestResult = '❌ Phone auth failed:\n$e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase Connection Test'),
        backgroundColor: _statusColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_isLoading)
              const Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Testing connection...'),
                  ],
                ),
              )
            else
              Expanded(
                child: Column(
                  children: [
                    Icon(
                      _statusColor == Colors.green ? Icons.check_circle : Icons.error,
                      size: 64,
                      color: _statusColor,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _connectionStatus,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    if (_statusColor == Colors.green) ...[
                      const Text(
                        'Next Steps:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '1. Configure phone authentication in Supabase dashboard\n'
                        '2. Set up SMS provider (Twilio recommended)\n'
                        '3. Test phone signup/signin flow\n'
                        '4. Create database tables if needed',
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ],
                ),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _testConnection,
              child: const Text('Test Again'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Back to App'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _testPhoneAuth,
              child: const Text('Test Phone Auth'),
            ),
            const SizedBox(height: 8),
            Text(
              _phoneTestResult,
              style: TextStyle(
                color: _phoneTestResult.startsWith('✅') ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
