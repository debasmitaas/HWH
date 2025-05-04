import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/providers/language_provider.dart';
import '../../../features/auth/screens/simple_login_screen.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/language_toggle.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(textsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.profile),
        actions: const [
          LanguageToggle(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Header
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ref.watch(userDataProvider)?['name'] ?? 'ASHA Worker',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            ref.watch(userDataProvider)?['phone'] ?? '',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Menu Items
            _buildMenuItem(
              context,
              icon: Icons.edit,
              title: texts.editProfile,
              onTap: () {
                // TODO: Navigate to edit profile
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.help,
              title: texts.help,
              onTap: () {
                // TODO: Navigate to help
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.language,
              title: texts.language,
              onTap: () {
                // TODO: Show language dialog
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.logout,
              title: texts.signOut,
              color: Colors.red,
              onTap: () => _showSignOutDialog(context, ref),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: TextStyle(color: color),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  void _showSignOutDialog(BuildContext context, WidgetRef ref) {
    final texts = ref.read(textsProvider);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(texts.signOut),
        content: Text(texts.signOutConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(texts.cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              
              // Clear user data from provider
              ref.read(userDataProvider.notifier).state = null;
              
              // Update login state
              ref.read(isLoggedInProvider.notifier).state = false;
              
              // Clear shared preferences
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('is_logged_in', false);
              await prefs.remove('user_name');
              await prefs.remove('user_phone');
              await prefs.remove('user_district');
              await prefs.remove('user_block');
              await prefs.remove('user_role');
              
              // Navigate to login screen
              if (context.mounted) {
                context.go('/login');
              }
            },
            child: Text(texts.signOut),
          ),
        ],
      ),
    );
  }
}
