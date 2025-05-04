import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:permission_handler/permission_handler.dart';

import '../../../shared/providers/language_provider.dart';
import '../../../shared/providers/patient_provider.dart';
import '../../../shared/widgets/bottom_nav_bar.dart';
import '../../../shared/widgets/language_toggle.dart';

class PatientListScreen extends ConsumerStatefulWidget {
  const PatientListScreen({super.key});

  @override
  ConsumerState<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends ConsumerState<PatientListScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  
  // Speech to text
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  // Initialize speech recognition
  void _initSpeech() async {
    await _speech.initialize(
      onError: (error) => print('Speech recognition error: $error'),
      onStatus: (status) {
        print('Speech recognition status: $status');
        if (status == 'done' && _isListening) {
          setState(() => _isListening = false);
        }
      },
    );
  }

  // Request microphone permission
  Future<bool> _requestMicPermission() async {
    final status = await Permission.microphone.request();
    return status.isGranted;
  }

  // Start/stop speech recognition
  void _toggleListening() async {
    final hasPermission = await _requestMicPermission();
    
    if (!hasPermission) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Microphone permission is required for voice search')),
      );
      return;
    }
    
    if (!_isListening) {
      // Check if language provider is using Bengali
      final languageCode = ref.read(languageProvider) == Language.bengali ? 'bn_IN' : 'en_US';
      print('Using language code: $languageCode');
      
      // Get available languages
      final languages = await _speech.locales();
      
      // Find closest matching language
      final availableLocale = languages.firstWhere(
        (locale) => locale.localeId.startsWith(languageCode.split('_')[0]),
        orElse: () => languages.first,
      );
      
      print('Selected locale: ${availableLocale.localeId}');
      
      final isAvailable = await _speech.initialize();
      if (isAvailable) {
        setState(() => _isListening = true);
        
        try {
          await _speech.listen(
            onResult: (result) {
              print('Recognized words: ${result.recognizedWords}');
              // Update the search field in real-time with partial results
              if (result.recognizedWords.isNotEmpty) {
                setState(() {
                  _searchQuery = result.recognizedWords;
                  _searchController.text = _searchQuery;
                });
              }
              
              // Show feedback only when we have final results
              if (result.finalResult && result.recognizedWords.isNotEmpty) {
                // Show feedback after successful speech recognition
                _showSpeechFeedback(result.recognizedWords);
                // Make sure listening is stopped
                Future.delayed(const Duration(milliseconds: 500), () {
                  if (_isListening) {
                    _speech.stop();
                    setState(() => _isListening = false);
                  }
                });
              }
            },
            localeId: availableLocale.localeId,
            listenFor: const Duration(seconds: 15), // Reduced from 30 to 15
            pauseFor: const Duration(seconds: 2),  // Reduced from 3 to 2
            partialResults: true,
            onSoundLevelChange: (level) => print('Sound level: $level'),
            cancelOnError: true,
            listenMode: stt.ListenMode.confirmation,
          );
        } catch (e) {
          print('Error listening: $e');
          setState(() => _isListening = false);
        }
      } else {
        print('Speech recognition not available');
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  // Show feedback after successful speech recognition
  void _showSpeechFeedback(String text) {
    if (text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Voice search: "$text"'),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _speech.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final texts = ref.watch(textsProvider);
    final patients = ref.watch(patientProvider);
    
    // Filter patients based on search query
    final String query = _searchQuery.trim();
    final filteredPatients = query.isEmpty
        ? patients
        : patients.where((patient) =>
            patient.name.toLowerCase().contains(query.toLowerCase()) ||
            patient.village.toLowerCase().contains(query.toLowerCase()) ||
            patient.phone.contains(query)
          ).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.patients),
        actions: [
          const LanguageToggle(),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: texts.searchPatients,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_searchQuery.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      ),
                    // Voice search button with animation when active
                    _isListening
                      ? Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.mic),
                            color: Theme.of(context).colorScheme.primary,
                            onPressed: _toggleListening,
                            tooltip: 'Stop Voice Search',
                            style: IconButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                            ),
                          ),
                        )
                      : IconButton(
                          icon: const Icon(Icons.mic),
                          onPressed: _toggleListening,
                          tooltip: 'Voice Search',
                        ),
                  ],
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          
          // Patient List
          Expanded(
            child: filteredPatients.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_outline,
                          size: 64,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchQuery.isEmpty 
                              ? texts.noPatients 
                              : texts.noPatientsFound,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        if (_searchQuery.isEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            texts.addFirstPatient,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: filteredPatients.length,
                    itemBuilder: (context, index) {
                      final patient = filteredPatients[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                            child: Icon(
                              patient.gender == 'female' 
                                  ? Icons.female 
                                  : patient.gender == 'male'
                                      ? Icons.male
                                      : Icons.person,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          title: Text(
                            patient.name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            '${texts.age}: ${patient.age} • ${texts.village}: ${patient.village}',
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () => context.push('/patients/${patient.id}'),
                        ),
                      );
                    },
                  ),
          ),
          
          // Add New Patient Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => context.push('/patients/add'),
                icon: const Icon(Icons.person_add),
                label: Text(texts.addPatient),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}
