import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../shared/providers/language_provider.dart';
import '../../../shared/providers/patient_provider.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/language_toggle.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(textsProvider);
    final patients = ref.watch(patientProvider);
    
    // Calculate statistics for the charts
    final now = DateTime.now();
    final endOfMonth = DateTime(now.year, now.month + 1, 0);
    
    // Category stats
    final pregnantCount = patients.where((p) => p.category == 'pregnant').length;
    final postpartumCount = patients.where((p) => p.category == 'postpartum').length;
    final babyCount = patients.where((p) => p.category == 'baby').length;
    final otherCount = patients.where((p) => p.category == 'other').length;
    
    // Monthly appointment stats
    final daysInMonth = endOfMonth.day;
    final appointmentsByDay = List.generate(daysInMonth, (index) => 0);
    
    for (final patient in patients) {
      if (patient.nextAppointment != null) {
        final appointmentDate = patient.nextAppointment!;
        if (appointmentDate.year == now.year && appointmentDate.month == now.month) {
          // This is an appointment in the current month
          appointmentsByDay[appointmentDate.day - 1]++;
        }
      }
    }
    
    // Calculate appointments completed this month
    final completedAppointments = patients.where((p) {
      return p.previousAppointment != null &&
          p.previousAppointment!.year == now.year &&
          p.previousAppointment!.month == now.month;
    }).length;
    
    // Calculate upcoming appointments this month
    final upcomingAppointments = patients.where((p) {
      return p.nextAppointment != null &&
          p.nextAppointment!.year == now.year &&
          p.nextAppointment!.month == now.month &&
          p.nextAppointment!.isAfter(now);
    }).length;

    // Calculate total for category percentages
    final totalPatients = pregnantCount + postpartumCount + babyCount + otherCount;
    final pregnantPercent = totalPatients > 0 ? (pregnantCount / totalPatients * 100).toStringAsFixed(0) : '0';
    final postpartumPercent = totalPatients > 0 ? (postpartumCount / totalPatients * 100).toStringAsFixed(0) : '0';
    final babyPercent = totalPatients > 0 ? (babyCount / totalPatients * 100).toStringAsFixed(0) : '0';
    final otherPercent = totalPatients > 0 ? (otherCount / totalPatients * 100).toStringAsFixed(0) : '0';
    
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.reports),
        actions: const [
          LanguageToggle(),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${texts.monthlyOverview} - ${DateFormat('MMMM yyyy').format(now)}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            
            // Statistics cards with wrapping for smaller screens
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 48) / 2,
                  child: _buildStatCard(
                    context: context, 
                    title: texts.totalPatients, 
                    value: patients.length.toString(),
                    icon: Icons.people,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 48) / 2,
                  child: _buildStatCard(
                    context: context, 
                    title: texts.appointments, 
                    value: (completedAppointments + upcomingAppointments).toString(),
                    icon: Icons.calendar_today,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 48) / 2,
                  child: _buildStatCard(
                    context: context, 
                    title: texts.completed, 
                    value: completedAppointments.toString(),
                    icon: Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 48) / 2,
                  child: _buildStatCard(
                    context: context, 
                    title: texts.upcoming, 
                    value: upcomingAppointments.toString(),
                    icon: Icons.upcoming,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Patient Categories Chart - Simplified Bar Chart
            _buildSectionTitle(context, texts.patientCategories),
            const SizedBox(height: 16),
            
            patients.isEmpty 
                ? _buildEmptyChartPlaceholder(context, texts.noPatientData)
                : _buildSimplifiedCategoryChart(
                    context,
                    [pregnantCount, postpartumCount, babyCount, otherCount],
                    [pregnantPercent, postpartumPercent, babyPercent, otherPercent],
                    texts,
                  ),
            
            const SizedBox(height: 32),
            
            // Appointments by Day Chart - Simplified list view
            _buildSectionTitle(context, texts.appointmentsThisMonth),
            const SizedBox(height: 16),
            
            appointmentsByDay.every((count) => count == 0)
                ? _buildEmptyChartPlaceholder(context, texts.noAppointmentData)
                : _buildSimpleAppointmentsList(context, appointmentsByDay, now, texts),
            
            const SizedBox(height: 32),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: color.withOpacity(0.8),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
  
  Widget _buildSimplifiedCategoryChart(
    BuildContext context,
    List<int> counts,
    List<String> percentages,
    AppTexts texts,
  ) {
    final categories = [texts.pregnant, texts.postPartum, texts.baby, texts.other];
    final colors = [Colors.purple, Colors.teal, Colors.blue, Colors.grey];
    
    return Column(
      children: List.generate(
        categories.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: colors[index],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${categories[index]}: ${counts[index]} (${percentages[index]}%)',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: int.parse(percentages[index]) / 100,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(colors[index]),
                  minHeight: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildSimpleAppointmentsList(BuildContext context, List<int> appointmentsByDay, DateTime now, AppTexts texts) {
    // Find days with appointments
    final daysWithAppointments = <int>[];
    for (int i = 0; i < appointmentsByDay.length; i++) {
      if (appointmentsByDay[i] > 0) {
        daysWithAppointments.add(i + 1); // Convert to 1-based day
      }
    }
    
    if (daysWithAppointments.isEmpty) {
      return _buildEmptyChartPlaceholder(context, texts.noAppointmentData);
    }
    
    return Column(
      children: [
        for (final day in daysWithAppointments)
          Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: day == now.day
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
                child: Text(
                  day.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: day == now.day
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              title: Text(
                DateFormat('EEEE').format(DateTime(now.year, now.month, day)),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('${appointmentsByDay[day - 1]} ${texts.appointments.toLowerCase()}'),
              trailing: Icon(
                Icons.event,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
      ],
    );
  }
  
  Widget _buildEmptyChartPlaceholder(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bar_chart,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
