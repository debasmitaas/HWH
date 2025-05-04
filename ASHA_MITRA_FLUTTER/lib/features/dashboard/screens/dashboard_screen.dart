import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/providers/language_provider.dart';
import '../../../shared/providers/patient_provider.dart';
import '../../../shared/providers/activity_provider.dart';
import '../../../features/auth/screens/simple_login_screen.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/status_card.dart';
import '../../../shared/widgets/action_button.dart';
import '../../../shared/widgets/language_toggle.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(textsProvider);
    final patients = ref.watch(patientProvider);
    final activities = ref.watch(activityProvider);
    
    // Calculate stats
    final totalPatients = patients.length;
    final pregnantPatients = patients.where((p) => p.category == 'pregnant').length;
    final babyPatients = patients.where((p) => p.category == 'baby').length;
    
    // Get today's appointments
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    final todayAppointments = patients.where((p) => 
      p.nextAppointment != null &&
      p.nextAppointment!.isAfter(startOfDay) &&
      p.nextAppointment!.isBefore(endOfDay)
    ).length;
    
    // Get most recent activities
    final recentActivities = activities.take(3).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.dashboard),
        actions: [
          const LanguageToggle(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${texts.welcome}, ${ref.watch(userDataProvider)?['name'] ?? texts.ashaWorker}!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    texts.dashboardWelcomeMessage,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Quick Stats
            Text(
              texts.quickStats,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: StatusCard(
                    title: texts.totalPatients,
                    value: totalPatients.toString(),
                    icon: Icons.people,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatusCard(
                    title: texts.todayAppointments,
                    value: todayAppointments.toString(), 
                    icon: Icons.calendar_today,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Row(
              children: [
                Expanded(
                  child: StatusCard(
                    title: texts.pregnant,
                    value: pregnantPatients.toString(),
                    icon: Icons.pregnant_woman,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatusCard(
                    title: texts.baby,
                    value: babyPatients.toString(),
                    icon: Icons.child_care,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Quick Actions
            Text(
              texts.quickActions,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: [
                ActionButton(
                  title: texts.addPatient,
                  icon: Icons.person_add,
                  onTap: () => context.push('/patients/add'),
                ),
                ActionButton(
                  title: texts.searchPatients,
                  icon: Icons.search,
                  onTap: () => context.push('/patients'),
                ),
                ActionButton(
                  title: texts.scheduleAppointment,
                  icon: Icons.calendar_month,
                  onTap: () => context.push('/appointments/schedule'),
                ),
                ActionButton(
                  title: texts.viewReports,
                  icon: Icons.analytics,
                  onTap: () => context.push('/reports'),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Recent Activities
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  texts.recentActivities,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (activities.isNotEmpty)
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to full activity history
                    },
                    child: Text('View All'),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            
            activities.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.history,
                            size: 48,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No activities yet',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Your recent actions will appear here',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      children: recentActivities.map((activity) {
                        return Column(
                          children: [
                            _buildActivityItem(
                              context,
                              icon: getActivityIcon(activity.type),
                              title: activity.title,
                              subtitle: '${activity.patientName} - ${getTimeElapsed(activity.createdAt, context)}',
                              color: getActivityColor(activity.type),
                              onTap: activity.patientId != null
                                  ? () => context.push('/patients/${activity.patientId}')
                                  : null,
                            ),
                            if (activity != recentActivities.last)
                              const Divider(height: 1),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
            
            const SizedBox(height: 100), // Space for bottom navigation
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }

  Widget _buildActivityItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        dense: true,
        trailing: onTap != null ? Icon(Icons.chevron_right, size: 16) : null,
      ),
    );
  }
}
