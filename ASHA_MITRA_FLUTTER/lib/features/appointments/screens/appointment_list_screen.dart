import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../shared/providers/language_provider.dart';
import '../../../shared/providers/patient_provider.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/language_toggle.dart';

class AppointmentListScreen extends ConsumerStatefulWidget {
  const AppointmentListScreen({super.key});

  @override
  ConsumerState<AppointmentListScreen> createState() => _AppointmentListScreenState();
}

class _AppointmentListScreenState extends ConsumerState<AppointmentListScreen> {
  String _selectedPeriod = 'thisMonth'; // 'thisMonth', 'nextMonth', 'previousMonth'
  String _searchQuery = '';
  
  @override
  Widget build(BuildContext context) {
    final texts = ref.watch(textsProvider);
    final patients = ref.watch(patientProvider);
    
    // Calculate month periods
    final now = DateTime.now();
    final thisMonth = DateTime(now.year, now.month);
    final nextMonth = DateTime(now.year, now.month + 1);
    final previousMonth = DateTime(now.year, now.month - 1);
    
    // Filter patients based on appointment dates
    final filteredPatients = patients.where((patient) {
      // Filter by search query if entered
      if (_searchQuery.isNotEmpty) {
        final query = _searchQuery.toLowerCase();
        if (!patient.name.toLowerCase().contains(query)) {
          return false;
        }
      }
      
      // Filter by month period
      if (patient.nextAppointment == null) {
        return false;
      }
      
      final appointmentDate = patient.nextAppointment!;
      final appointmentMonth = DateTime(appointmentDate.year, appointmentDate.month);
      
      switch (_selectedPeriod) {
        case 'thisMonth':
          return appointmentMonth.isAtSameMomentAs(thisMonth);
        case 'nextMonth':
          return appointmentMonth.isAtSameMomentAs(nextMonth);
        case 'previousMonth':
          return appointmentMonth.isAtSameMomentAs(previousMonth);
        default:
          return true;
      }
    }).toList();
    
    // Sort by appointment date
    filteredPatients.sort((a, b) {
      return a.nextAppointment!.compareTo(b.nextAppointment!);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(texts.appointments),
        actions: const [
          LanguageToggle(),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search bar
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: texts.searchPatients,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Time period selector
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Theme.of(context).colorScheme.outline.withOpacity(0.3)),
                  ),
                  child: DropdownButton<String>(
                    value: _selectedPeriod,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedPeriod = value;
                        });
                      }
                    },
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: [
                      DropdownMenuItem(
                        value: 'thisMonth',
                        child: Text('${texts.appointments} - ${_getMonthName(thisMonth)}'),
                      ),
                      DropdownMenuItem(
                        value: 'nextMonth',
                        child: Text('${texts.appointments} - ${_getMonthName(nextMonth)}'),
                      ),
                      DropdownMenuItem(
                        value: 'previousMonth',
                        child: Text('${texts.appointments} - ${_getMonthName(previousMonth)}'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Appointment list
          Expanded(
            child: filteredPatients.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 64,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No appointments found',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Add a new appointment or check another month',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredPatients.length,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      final patient = filteredPatients[index];
                      return _buildAppointmentCard(context, patient);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/appointments/schedule'),
        icon: const Icon(Icons.add),
        label: Text(texts.scheduleAppointment),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }

  Widget _buildAppointmentCard(BuildContext context, Patient patient) {
    // Format the appointment date
    final appointmentDate = patient.nextAppointment!;
    final formattedDate = DateFormat('yyyy-MM-dd').format(appointmentDate);
    final dayOfWeek = DateFormat('EEEE').format(appointmentDate);
    
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () => context.push('/patients/${patient.id}'),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date indicator
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      appointmentDate.day.toString(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      DateFormat('MMM').format(appointmentDate),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Patient info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patient.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$dayOfWeek, $formattedDate',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 14,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          patient.phone,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    if (patient.category.isNotEmpty && patient.category != 'other')
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Chip(
                          label: Text(
                            _getCategoryLabel(patient.category),
                            style: TextStyle(
                              fontSize: 12,
                              color: _getCategoryColor(patient.category),
                            ),
                          ),
                          backgroundColor: _getCategoryColor(patient.category).withOpacity(0.1),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                  ],
                ),
              ),
              
              // Arrow indicator
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  String _getMonthName(DateTime date) {
    return DateFormat('MMMM yyyy').format(date);
  }
  
  String _getCategoryLabel(String category) {
    switch (category) {
      case 'pregnant':
        return 'Pregnant';
      case 'postpartum':
        return 'Postpartum';
      case 'baby':
        return 'Baby';
      default:
        return 'Regular';
    }
  }
  
  Color _getCategoryColor(String category) {
    switch (category) {
      case 'pregnant':
        return Colors.purple;
      case 'postpartum':
        return Colors.teal;
      case 'baby':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
