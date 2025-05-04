import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/language_provider.dart';

class BottomNavBar extends ConsumerWidget {
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(textsProvider);
    
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
      onTap: (index) => _onItemTapped(context, index),
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.dashboard),
          label: texts.dashboard,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.people),
          label: texts.patients,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.calendar_today),
          label: texts.appointments,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.analytics),
          label: texts.reports,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: texts.profile,
        ),
      ],
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/patients');
        break;
      case 2:
        context.go('/appointments');
        break;
      case 3:
        context.go('/reports');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }
}
