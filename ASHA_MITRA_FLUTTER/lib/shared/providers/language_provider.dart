import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Language {
  english,
  bengali,
}

class LanguageNotifier extends StateNotifier<Language> {
  LanguageNotifier() : super(Language.bengali) {
    _loadLanguage();
  }

  static const String _languageKey = 'selected_language';

  void _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_languageKey);
    if (languageCode != null) {
      state = languageCode == 'bn' ? Language.bengali : Language.english;
    }
  }

  void setLanguage(Language language) async {
    state = language;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language == Language.bengali ? 'bn' : 'en');
  }

  void toggleLanguage() {
    setLanguage(state == Language.bengali ? Language.english : Language.bengali);
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Language>((ref) {
  return LanguageNotifier();
});

class AppTexts {
  final String appName;
  final String appTagline;
  final String signIn;
  final String signUp;
  final String email;
  final String password;
  final String fullName;
  final String phoneNumber;
  final String district;
  final String block;
  final String welcome;
  final String ashaWorker;
  final String pleaseEnterName;
  final String pleaseEnterEmail;
  final String pleaseEnterValidEmail;
  final String pleaseEnterPassword;
  final String passwordTooShort;
  final String pleaseEnterPhone;
  final String pleaseEnterDistrict;
  final String pleaseEnterBlock;
  final String pleaseEnterAge;
  final String pleaseEnterValidAge;
  final String pleaseEnterAddress;
  final String pleaseEnterVillage;
  final String dashboard;
  final String patients;
  final String appointments;
  final String reports;
  final String profile;
  final String more;
  final String help;
  final String voiceHelp;
  final String dashboardWelcomeMessage;
  final String quickStats;
  final String totalPatients;
  final String todayAppointments;
  final String urgentCases;
  final String completedVisits;
  final String quickActions;
  final String recentActivities;
  final String addPatient;
  final String searchPatients;
  final String patientDetails;
  final String addRecord;
  final String healthRecords;
  final String patientAddedSuccessfully;
  final String noRecordsAvailable;
  final String date;
  final String created;
  final String close;
  final String selectPatient;
  final String viewAll;
  final String noPatients;
  final String noPatientsFound;
  final String addFirstPatient;
  final String age;
  final String gender;
  final String female;
  final String male;
  final String other;
  final String address;
  final String village;
  final String emergencyContact;
  final String pregnancyStatus;
  final String isPregnant;
  final String notPregnant;
  final String scheduleAppointment;
  final String schedule;
  final String appointmentScheduled;
  final String patientAdded;
  final String healthRecordAdded;
  final String editProfile;
  final String language;
  final String signOut;
  final String signOutConfirmation;
  final String cancel;
  final String viewReports;
  
  // Chatbot related texts
  final String chatbotAssistant;
  final String chatWithAssistant;
  final String askMeAnything;
  final String uploadPrescription;
  final String takePicture;
  final String selectFromGallery;
  final String typeYourMessage;
  final String sendMessage;
  final String listening;
  final String tapToSpeak;
  final String processingYourRequest;
  final String uploadingImage;
  final String speechRecognitionNotAvailable;
  final String scanningPrescription;
  final String chatbotWelcomeMessage;
  
  // Report screen specific texts
  final String monthlyOverview;
  final String patientCategories;
  final String appointmentsThisMonth;
  final String completed;
  final String upcoming;
  final String noPatientData;
  final String noAppointmentData;
  
  // OTP Verification
  final String verifyOtp;
  final String enterVerificationCode;
  final String otpSentTo;
  final String enterSixDigitOtp;
  final String verifyAndSignIn;
  final String verifyAndSignUp;
  final String didntReceiveCode;
  final String resendOtp;
  final String resendIn;
  final String pleaseEnterOtp;
  final String otpMustBeSixDigits;
  final String previousAppointment;
  final String nextAppointment;
  final String description;
  final String selectDate;
  final String pregnant;
  final String postPartum;
  final String baby;
  final String category;
  final String editPatient;
  final String updatePatient;
  final String patientUpdatedSuccessfully;
  final String saveChanges;

  const AppTexts({
    required this.appName,
    required this.appTagline,
    required this.signIn,
    required this.signUp,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNumber,
    required this.district,
    required this.block,
    required this.welcome,
    required this.ashaWorker,
    required this.pleaseEnterName,
    required this.pleaseEnterEmail,
    required this.pleaseEnterValidEmail,
    required this.pleaseEnterPassword,
    required this.passwordTooShort,
    required this.pleaseEnterPhone,
    required this.pleaseEnterDistrict,
    required this.pleaseEnterBlock,
    required this.pleaseEnterAge,
    required this.pleaseEnterValidAge,
    required this.pleaseEnterAddress,
    required this.pleaseEnterVillage,
    required this.dashboard,
    required this.patients,
    required this.appointments,
    required this.reports,
    required this.profile,
    required this.more,
    required this.help,
    required this.voiceHelp,
    required this.dashboardWelcomeMessage,
    required this.quickStats,
    required this.totalPatients,
    required this.todayAppointments,
    required this.urgentCases,
    required this.completedVisits,
    required this.quickActions,
    required this.recentActivities,
    required this.addPatient,
    required this.searchPatients,
    required this.patientDetails,
    required this.addRecord,
    required this.healthRecords,
    required this.patientAddedSuccessfully,
    required this.noPatients,
    required this.noPatientsFound,
    required this.addFirstPatient,
    required this.age,
    required this.gender,
    required this.female,
    required this.male,
    required this.other,
    required this.noRecordsAvailable,
    required this.date,
    required this.created,
    required this.close,
    required this.selectPatient,
    required this.viewAll,
    required this.address,
    required this.village,
    required this.emergencyContact,
    required this.pregnancyStatus,
    required this.isPregnant,
    required this.notPregnant,
    required this.scheduleAppointment,
    required this.schedule,
    required this.appointmentScheduled,
    required this.patientAdded,
    required this.healthRecordAdded,
    required this.editProfile,
    required this.language,
    required this.signOut,
    required this.signOutConfirmation,
    required this.cancel,
    required this.viewReports,
    
    // OTP Verification
    required this.verifyOtp,
    required this.enterVerificationCode,
    required this.otpSentTo,
    required this.enterSixDigitOtp,
    required this.verifyAndSignIn,
    required this.verifyAndSignUp,
    required this.didntReceiveCode,
    required this.resendOtp,
    required this.resendIn,
    required this.pleaseEnterOtp,
    required this.otpMustBeSixDigits,
    required this.previousAppointment,
    required this.nextAppointment,
    required this.description,
    required this.selectDate,
    required this.pregnant,
    required this.postPartum,
    required this.baby,
    required this.category,
    required this.editPatient,
    required this.updatePatient,
    required this.patientUpdatedSuccessfully,
    required this.saveChanges,
    
    // Report screen specific texts
    required this.monthlyOverview,
    required this.patientCategories,
    required this.appointmentsThisMonth,
    required this.completed,
    required this.upcoming,
    required this.noPatientData,
    required this.noAppointmentData,
    
    // Chatbot related texts
    required this.chatbotAssistant,
    required this.chatWithAssistant,
    required this.askMeAnything,
    required this.uploadPrescription,
    required this.takePicture,
    required this.selectFromGallery,
    required this.typeYourMessage,
    required this.sendMessage,
    required this.listening,
    required this.tapToSpeak,
    required this.processingYourRequest,
    required this.uploadingImage,
    required this.speechRecognitionNotAvailable,
    required this.scanningPrescription,
    required this.chatbotWelcomeMessage,
  });
}

// English texts
const englishTexts = AppTexts(
  // Chatbot related texts
  chatbotAssistant: 'AI Assistant',
  chatWithAssistant: 'Chat with AI Assistant',
  askMeAnything: 'Ask me anything about health...',
  uploadPrescription: 'Upload Prescription',
  takePicture: 'Take Picture',
  selectFromGallery: 'Select from Gallery',
  typeYourMessage: 'Type your message...',
  sendMessage: 'Send',
  listening: 'Listening...',
  tapToSpeak: 'Tap to speak',
  processingYourRequest: 'Processing your request...',
  uploadingImage: 'Uploading image...',
  speechRecognitionNotAvailable: 'Speech recognition not available',
  scanningPrescription: 'Scanning prescription...',
  chatbotWelcomeMessage: 'Hello, I\'m your AI health assistant. How can I help you today?',
  
  appName: 'ASHA Mitra',
  appTagline: 'Community Health Companion',
  signIn: 'Sign In',
  signUp: 'Sign Up',
  email: 'Email',
  password: 'Password',
  fullName: 'Full Name',
  phoneNumber: 'Phone Number',
  district: 'District',
  block: 'Block',
  welcome: 'Welcome',
  ashaWorker: 'ASHA Worker',
  pleaseEnterName: 'Please enter your name',
  pleaseEnterEmail: 'Please enter your email',
  pleaseEnterValidEmail: 'Please enter a valid email',
  pleaseEnterPassword: 'Please enter your password',
  passwordTooShort: 'Password must be at least 6 characters',
  pleaseEnterPhone: 'Please enter your phone number',
  pleaseEnterDistrict: 'Please enter your district',
  pleaseEnterBlock: 'Please enter your block',
  pleaseEnterAge: 'Please enter age',
  pleaseEnterValidAge: 'Please enter a valid age',
  pleaseEnterAddress: 'Please enter address',
  pleaseEnterVillage: 'Please enter village',
  dashboard: 'Dashboard',
  patients: 'Patients',
  appointments: 'Appointments',
  reports: 'Reports',
  profile: 'Profile',
  more: 'More',
  help: 'Help',
  voiceHelp: 'Voice Help',
  dashboardWelcomeMessage: 'Ready to help your community today!',
  quickStats: 'Quick Stats',
  totalPatients: 'Total Patients',
  todayAppointments: 'Today\'s Appointments',
  urgentCases: 'Urgent Cases',
  completedVisits: 'Completed Visits',
  quickActions: 'Quick Actions',
  recentActivities: 'Recent Activities',
  addPatient: 'Add Patient',
  searchPatients: 'Search Patients',
  patientDetails: 'Patient Details',
  addRecord: 'Add Record',
  healthRecords: 'Health Records',
  patientAddedSuccessfully: 'Patient added successfully',
  noPatients: 'No patients found',
  noPatientsFound: 'No patients match your search',
  noRecordsAvailable: 'No health records available',
  date: 'Date',
  created: 'Created',
  close: 'Close',
  selectPatient: 'Select Patient',
  viewAll: 'View All',
  addFirstPatient: 'Add your first patient to get started',
  age: 'Age',
  gender: 'Gender',
  female: 'Female',
  male: 'Male',
  other: 'Other',
  address: 'Address',
  village: 'Village',
  emergencyContact: 'Emergency Contact',
  pregnancyStatus: 'Pregnancy Status',
  isPregnant: 'Is Pregnant',
  notPregnant: 'Not Pregnant',
  scheduleAppointment: 'Schedule Appointment',
  schedule: 'Schedule',
  appointmentScheduled: 'Appointment Scheduled',
  patientAdded: 'Patient Added',
  healthRecordAdded: 'Health Record Added',
  editProfile: 'Edit Profile',
  language: 'Language',
  signOut: 'Sign Out',
  signOutConfirmation: 'Are you sure you want to sign out?',
  cancel: 'Cancel',
  viewReports: 'View Reports',
  
  // OTP Verification
  verifyOtp: 'Verify OTP',
  enterVerificationCode: 'Enter Verification Code',
  otpSentTo: 'OTP sent to',
  enterSixDigitOtp: 'Enter 6-digit OTP',
  verifyAndSignIn: 'Verify & Sign In',
  verifyAndSignUp: 'Verify & Sign Up',
  didntReceiveCode: "Didn't receive code?",
  resendOtp: 'Resend OTP',
  resendIn: 'Resend in',
  pleaseEnterOtp: 'Please enter OTP',
  otpMustBeSixDigits: 'OTP must be 6 digits',
  previousAppointment: 'Previous Appointment',
  nextAppointment: 'Next Appointment',
  description: 'Description',
  selectDate: 'Select Date',
  pregnant: 'Pregnant',
  postPartum: 'Post-Partum',
  baby: 'Baby',
  category: 'Category',
  editPatient: 'Edit Patient',
  updatePatient: 'Update Patient',
  patientUpdatedSuccessfully: 'Patient updated successfully',
  saveChanges: 'Save Changes',
  
  // Report screen specific texts
  monthlyOverview: 'Monthly Overview',
  patientCategories: 'Patient Categories',
  appointmentsThisMonth: 'Appointments This Month',
  completed: 'Completed',
  upcoming: 'Upcoming',
  noPatientData: 'No patient data available',
  noAppointmentData: 'No appointment data for this month',
);

// Bengali texts
const bengaliTexts = AppTexts(
  // Chatbot related texts
  chatbotAssistant: 'এআই সহায়ক',
  chatWithAssistant: 'এআই সহায়কের সাথে চ্যাট করুন',
  askMeAnything: 'স্বাস্থ্য সম্পর্কে যেকোনো প্রশ্ন করুন...',
  uploadPrescription: 'প্রেসক্রিপশন আপলোড করুন',
  takePicture: 'ছবি তুলুন',
  selectFromGallery: 'গ্যালারি থেকে নির্বাচন করুন',
  typeYourMessage: 'আপনার বার্তা টাইপ করুন...',
  sendMessage: 'প্রেরণ করুন',
  listening: 'শুনছি...',
  tapToSpeak: 'কথা বলতে আলতো চাপুন',
  processingYourRequest: 'আপনার অনুরোধ প্রক্রিয়াকরণ করছি...',
  uploadingImage: 'ছবি আপলোড করছি...',
  speechRecognitionNotAvailable: 'ভয়েস শনাক্তকরণ উপলব্ধ নয়',
  scanningPrescription: 'প্রেসক্রিপশন স্ক্যান করছি...',
  chatbotWelcomeMessage: 'হ্যালো, আমি আপনার এআই স্বাস্থ্য সহায়ক। আমি আপনাকে কীভাবে সাহায্য করতে পারি?',
  
  appName: 'আশা মিত্র',
  appTagline: 'কমিউনিটি স্বাস্থ্য সহায়ক',
  signIn: 'লগইন',
  signUp: 'নিবন্ধন',
  email: 'ইমেইল',
  password: 'পাসওয়ার্ড',
  fullName: 'পূর্ণ নাম',
  phoneNumber: 'ফোন নম্বর',
  district: 'জেলা',
  block: 'ব্লক',
  welcome: 'স্বাগতম',
  ashaWorker: 'আশা কর্মী',
  pleaseEnterName: 'অনুগ্রহ করে আপনার নাম লিখুন',
  pleaseEnterEmail: 'অনুগ্রহ করে আপনার ইমেইল লিখুন',
  pleaseEnterValidEmail: 'অনুগ্রহ করে একটি বৈধ ইমেইল লিখুন',
  pleaseEnterPassword: 'অনুগ্রহ করে আপনার পাসওয়ার্ড লিখুন',
  passwordTooShort: 'পাসওয়ার্ড কমপক্ষে ৬ অক্ষরের হতে হবে',
  pleaseEnterPhone: 'অনুগ্রহ করে আপনার ফোন নম্বর লিখুন',
  pleaseEnterDistrict: 'অনুগ্রহ করে আপনার জেলা লিখুন',
  pleaseEnterBlock: 'অনুগ্রহ করে আপনার ব্লক লিখুন',
  pleaseEnterAge: 'অনুগ্রহ করে বয়স লিখুন',
  pleaseEnterValidAge: 'অনুগ্রহ করে বৈধ বয়স লিখুন',
  pleaseEnterAddress: 'অনুগ্রহ করে ঠিকানা লিখুন',
  pleaseEnterVillage: 'অনুগ্রহ করে গ্রাম লিখুন',
  dashboard: 'ড্যাশবোর্ড',
  patients: 'রোগীবৃন্দ',
  appointments: 'অ্যাপয়েন্টমেন্ট',
  reports: 'রিপোর্ট',
  profile: 'প্রোফাইল',
  more: 'আরও',
  help: 'সহায়তা',
  voiceHelp: 'ভয়েস সহায়তা',
  dashboardWelcomeMessage: 'আজ আপনার কমিউনিটিকে সাহায্য করার জন্য প্রস্তুত!',
  quickStats: 'দ্রুত পরিসংখ্যান',
  totalPatients: 'মোট রোগী',
  todayAppointments: 'আজকের অ্যাপয়েন্টমেন্ট',
  urgentCases: 'জরুরি কেস',
  completedVisits: 'সম্পন্ন ভিজিট',
  quickActions: 'দ্রুত কাজ',
  recentActivities: 'সাম্প্রতিক কার্যকলাপ',
  addPatient: 'রোগী যোগ করুন',
  searchPatients: 'রোগী খুঁজুন',
  patientDetails: 'রোগীর বিবরণ',
  addRecord: 'রেকর্ড যোগ করুন',
  healthRecords: 'স্বাস্থ্য রেকর্ড',
  patientAddedSuccessfully: 'রোগী সফলভাবে যোগ করা হয়েছে',
  noPatients: 'কোনো রোগী পাওয়া যায়নি',
  noPatientsFound: 'আপনার অনুসন্ধানের সাথে কোনো রোগী মিলেনি',
  noRecordsAvailable: 'কোনো স্বাস্থ্য রেকর্ড পাওয়া যায়নি',
  date: 'তারিখ',
  created: 'তৈরি করা হয়েছে',
  close: 'বন্ধ করুন',
  selectPatient: 'রোগী নির্বাচন করুন',
  viewAll: 'সব দেখুন',
  addFirstPatient: 'শুরু করার জন্য আপনার প্রথম রোগী যোগ করুন',
  age: 'বয়স',
  gender: 'লিঙ্গ',
  female: 'মহিলা',
  male: 'পুরুষ',
  other: 'অন্যান্য',
  address: 'ঠিকানা',
  village: 'গ্রাম',
  emergencyContact: 'জরুরি যোগাযোগ',
  pregnancyStatus: 'গর্ভাবস্থা',
  isPregnant: 'গর্ভবতী',
  notPregnant: 'গর্ভবতী নয়',
  scheduleAppointment: 'অ্যাপয়েন্টমেন্ট সময়সূচী',
  schedule: 'সময়সূচী',
  appointmentScheduled: 'অ্যাপয়েন্টমেন্ট নির্ধারিত',
  patientAdded: 'রোগী যোগ করা হয়েছে',
  healthRecordAdded: 'স্বাস্থ্য রেকর্ড যোগ করা হয়েছে',
  editProfile: 'প্রোফাইল সম্পাদনা',
  language: 'ভাষা',
  signOut: 'সাইন আউট',
  signOutConfirmation: 'আপনি কি নিশ্চিত যে আপনি সাইন আউট করতে চান?',
  cancel: 'বাতিল',
  viewReports: 'রিপোর্ট দেখুন',
  
  // OTP Verification
  verifyOtp: 'OTP যাচাই করুন',
  enterVerificationCode: 'যাচাইকরণ কোড লিখুন',
  otpSentTo: 'OTP পাঠানো হয়েছে',
  enterSixDigitOtp: '৬ সংখ্যার OTP লিখুন',
  verifyAndSignIn: 'যাচাই করে লগইন করুন',
  verifyAndSignUp: 'যাচাই করে নিবন্ধন করুন',
  didntReceiveCode: 'কোড পাননি?',
  resendOtp: 'OTP পুনরায় পাঠান',
  resendIn: 'পুনরায় পাঠান',
  pleaseEnterOtp: 'অনুগ্রহ করে OTP লিখুন',
  otpMustBeSixDigits: 'OTP অবশ্যই ৬ সংখ্যার হতে হবে',
  previousAppointment: 'পূর্ববর্তী অ্যাপয়েন্টমেন্ট',
  nextAppointment: 'পরবর্তী অ্যাপয়েন্টমেন্ট',
  description: 'বিবরণ',
  selectDate: 'তারিখ নির্বাচন করুন',
  pregnant: 'গর্ভবতী',
  postPartum: 'প্রসবোত্তর',
  baby: 'শিশু',
  category: 'বিভাগ',
  editPatient: 'রোগীর তথ্য সম্পাদনা করুন',
  updatePatient: 'রোগীর তথ্য আপডেট করুন',
  patientUpdatedSuccessfully: 'রোগীর তথ্য সফলভাবে আপডেট করা হয়েছে',
  saveChanges: 'পরিবর্তনগুলি সংরক্ষণ করুন',
  
  // Report screen specific texts
  monthlyOverview: 'মাসিক ওভারভিউ',
  patientCategories: 'রোগী বিভাগ',
  appointmentsThisMonth: 'এই মাসের অ্যাপয়েন্টমেন্ট',
  completed: 'সম্পন্ন',
  upcoming: 'আসন্ন',
  noPatientData: 'কোনো রোগী তথ্য পাওয়া যায়নি',
  noAppointmentData: 'এই মাসে কোনো অ্যাপয়েন্টমেন্টের তথ্য নেই',
);

final textsProvider = Provider<AppTexts>((ref) {
  final language = ref.watch(languageProvider);
  return language == Language.bengali ? bengaliTexts : englishTexts;
});
