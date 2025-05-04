import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../providers/auth_provider.dart';
import '../services/supabase_service.dart';

class AuthWrapper extends ConsumerStatefulWidget {
  final Widget child;
  
  const AuthWrapper({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends ConsumerState<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    _setupAuthListener();
  }

  void _setupAuthListener() {
    // Listen to Supabase auth state changes
    SupabaseService.client.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      
      if (mounted) {
        switch (event) {
          case AuthChangeEvent.signedIn:
            debugPrint('✅ User signed in: ${session?.user.phone}');
            // Navigate to dashboard on successful auth
            if (context.mounted) {
              context.go('/dashboard');
            }
            break;
          case AuthChangeEvent.signedOut:
            debugPrint('👋 User signed out');
            // Navigate to login on sign out
            if (context.mounted) {
              context.go('/login');
            }
            break;
          case AuthChangeEvent.tokenRefreshed:
            debugPrint('🔄 Token refreshed');
            break;
          case AuthChangeEvent.userUpdated:
            debugPrint('👤 User updated');
            break;
          case AuthChangeEvent.passwordRecovery:
            debugPrint('🔐 Password recovery');
            break;
          default:
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    
    // Show loading indicator while checking auth state
    if (authState.isLoading) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Checking authentication...'),
            ],
          ),
        ),
      );
    }
    
    // Show error if there's an auth error
    if (authState.error != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Authentication Error',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                authState.error!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).clearError();
                  context.go('/login');
                },
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      );
    }
    
    return widget.child;
  }
}

// Provider for checking initial auth state
final initialAuthCheckProvider = FutureProvider<bool>((ref) async {
  try {
    final session = SupabaseService.client.auth.currentSession;
    return session != null;
  } catch (e) {
    debugPrint('Error checking initial auth state: $e');
    return false;
  }
});
