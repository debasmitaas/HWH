import 'dart:io';
import 'package:flutter/foundation.dart';
import '../../../shared/providers/language_provider.dart';

class MockChatbotService {
  final Language language;

  MockChatbotService({required this.language});

  Future<String> sendMessage(String message, {int retryCount = 0}) async {
    // Simulate network delay for realistic behavior
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Return appropriate response based on language
    if (language == Language.bengali) {
      return getBengaliResponse(message);
    } else {
      return getEnglishResponse(message);
    }
  }

  Future<String> analyzePrescription(File image, {int retryCount = 0}) async {
    // Simulate network delay for realistic behavior
    await Future.delayed(const Duration(seconds: 2));
    
    // Return appropriate response based on language
    if (language == Language.bengali) {
      return getBengaliPrescriptionAnalysis();
    } else {
      return getEnglishPrescriptionAnalysis();
    }
  }

  String getEnglishResponse(String message) {
    message = message.toLowerCase();
    
    if (message.contains('hello') || message.contains('hi') || message.contains('hey')) {
      return "Hello! I'm your health assistant. How can I help you today?";
    } else if (message.contains('diabetes') || message.contains('blood sugar')) {
      return "Diabetes is a condition where blood sugar levels are too high. Signs include frequent urination, increased thirst, and unexplained weight loss. For rural communities, regular check-ups are essential. Remember to advise patients to:\n\n• Monitor blood sugar regularly if equipment is available\n• Maintain a healthy diet with less sugar and refined carbohydrates\n• Exercise regularly - even walking for 30 minutes daily helps\n• Take medications as prescribed by the doctor\n\nAlways remind patients to consult with healthcare professionals for proper diagnosis and treatment.";
    } else if (message.contains('pregnancy') || message.contains('pregnant')) {
      return "Regular check-ups are crucial during pregnancy. For ASHA workers, important points to communicate include:\n\n• Encourage at least 4 antenatal check-ups\n• Ensure tetanus toxoid vaccination\n• Recommend folic acid and iron supplements\n• Watch for danger signs: severe headache, blurred vision, swelling in hands/face, reduced fetal movement\n• Plan for institutional delivery when possible\n\nRemember, early registration of pregnancy helps in better monitoring and care.";
    } else if (message.contains('fever') || message.contains('temperature')) {
      return "Fever is often a sign that the body is fighting infection. For common fever management in rural settings:\n\n• Rest and hydration are most important\n• Paracetamol can help reduce fever - ensure proper dosage based on age/weight\n• Cold compresses on forehead, armpits can provide relief\n• Monitor for danger signs: very high temperature (>103°F), stiff neck, severe headache, rash\n• Seek medical attention if fever persists for more than 3 days\n\nAlways rule out malaria, dengue or typhoid in endemic areas.";
    } else if (message.contains('child') || message.contains('baby') || message.contains('infant')) {
      return "Child health is a priority. Key points for ASHA workers:\n\n• Ensure complete immunization according to national schedule\n• Monitor growth using weight-for-age charts\n• Promote exclusive breastfeeding for first 6 months\n• After 6 months, continue breastfeeding with appropriate complementary foods\n• Watch for danger signs: inability to drink/breastfeed, vomiting everything, convulsions, lethargy\n\nEarly identification of malnutrition and proper referral can save lives.";
    } else if (message.contains('diarrhea')) {
      return "Diarrhea can be dangerous, especially in children. Important management steps include:\n\n• ORS (Oral Rehydration Solution) is the first line of treatment\n• Continue feeding during diarrhea - small, frequent meals are better\n• Zinc supplements for 10-14 days can reduce severity and duration\n• Hand washing and clean drinking water prevent spread\n• Seek medical attention if blood in stool, persistent vomiting, or signs of dehydration (dry mouth, sunken eyes, reduced urination)\n\nProper hygiene and sanitation education are key preventive measures.";
    } else if (message.contains('vaccination') || message.contains('vaccine') || message.contains('immunization')) {
      return "Vaccinations are essential for preventing serious diseases. Key points for ASHA workers:\n\n• Follow the national immunization schedule\n• BCG, OPV, DPT, Hepatitis B, Measles are primary vaccines\n• Keep track of due dates for each child\n• Address parental concerns with accurate information\n• Maintain cold chain for vaccine efficacy\n\nReminder: Missed vaccines can be caught up - it's never too late to start.";
    } else {
      return "Thank you for your question. As a health assistant for ASHA workers, I focus on providing information about maternal health, child health, and common health issues in rural India. Your work is crucial for community healthcare. Remember to always refer patients to qualified healthcare professionals for specific medical advice and treatment.";
    }
  }

  String getBengaliResponse(String message) {
    message = message.toLowerCase();
    
    if (message.contains('hello') || message.contains('hi') || message.contains('hey') || 
        message.contains('নমস্কার') || message.contains('হ্যালো')) {
      return "নমস্কার! আমি আপনার স্বাস্থ্য সহায়ক। আমি আপনাকে কীভাবে সাহায্য করতে পারি?";
    } else if (message.contains('diabetes') || message.contains('blood sugar') || 
              message.contains('ডায়াবেটিস') || message.contains('রক্তে শর্করার')) {
      return "ডায়াবেটিস এমন একটি অবস্থা যেখানে রক্তে শর্করার মাত্রা অত্যধিক বেশি থাকে। লক্ষণগুলির মধ্যে রয়েছে ঘন ঘন প্রস্রাব, অত্যধিক পিপাসা, এবং অব্যাখ্যাত ওজন হ্রাস। গ্রামীণ সম্প্রদায়ের জন্য, নিয়মিত চেকআপ অত্যন্ত গুরুত্বপূর্ণ। রোগীদের পরামর্শ দেওয়ার বিষয়গুলি:\n\n• যদি সরঞ্জাম উপলব্ধ থাকে তবে নিয়মিত রক্তের শর্করা পর্যবেক্ষণ করুন\n• চিনি এবং পরিশোধিত কার্বোহাইড্রেট কম সহ স্বাস্থ্যকর খাদ্যাভ্যাস বজায় রাখুন\n• নিয়মিত ব্যায়াম করুন - প্রতিদিন ৩০ মিনিট হাঁটাও সাহায্য করে\n• ডাক্তারের নির্দেশ অনুসারে ওষুধ সেবন করুন\n\nসবসময় রোগীদের সঠিক রোগ নির্ণয় এবং চিকিৎসার জন্য স্বাস্থ্যসেবা পেশাদারদের সাথে পরামর্শ করতে মনে করিয়ে দিন।";
    } else if (message.contains('pregnancy') || message.contains('pregnant') || 
              message.contains('গর্ভাবস্থা') || message.contains('গর্ভবতী')) {
      return "গর্ভাবস্থায় নিয়মিত চেকআপ অত্যন্ত গুরুত্বপূর্ণ। আশা কর্মীদের জন্য, গুরুত্বপূর্ণ বিষয়গুলি যোগাযোগ করার মধ্যে রয়েছে:\n\n• কমপক্ষে ৪টি প্রসবপূর্ব চেকআপের উৎসাহ দিন\n• টিটেনাস টক্সয়েড টিকাকরণ নিশ্চিত করুন\n• ফলিক অ্যাসিড এবং আয়রন সাপ্লিমেন্টের পরামর্শ দিন\n• বিপদের লক্ষণগুলি লক্ষ্য রাখুন: তীব্র মাথাব্যথা, ঘোলাটে দৃষ্টি, হাত/মুখে ফোলাভাব, শিশুর নড়াচড়া কমে যাওয়া\n• যখন সম্ভব প্রাতিষ্ঠানিক প্রসবের পরিকল্পনা করুন\n\nমনে রাখবেন, গর্ভাবস্থার আগাম নিবন্ধীকরণ ভালো পর্যবেক্ষণ এবং যত্নে সাহায্য করে।";
    } else if (message.contains('fever') || message.contains('temperature') || 
              message.contains('জ্বর') || message.contains('তাপমাত্রা')) {
      return "জ্বর প্রায়শই একটি লক্ষণ যে শরীর সংক্রমণের বিরুদ্ধে লড়াই করছে। গ্রামীণ পরিবেশে সাধারণ জ্বর ব্যবস্থাপনার জন্য:\n\n• বিশ্রাম এবং জলযোগ সবচেয়ে গুরুত্বপূর্ণ\n• প্যারাসিটামল জ্বর কমাতে সাহায্য করতে পারে - বয়স/ওজনের উপর ভিত্তি করে সঠিক ডোজ নিশ্চিত করুন\n• কপালে, বগলে ঠাণ্ডা কম্প্রেস স্বস্তি দিতে পারে\n• বিপদের লক্ষণগুলি পর্যবেক্ষণ করুন: খুব উচ্চ তাপমাত্রা (>১০৩°F), শক্ত ঘাড়, তীব্র মাথাব্যথা, র‍্যাশ\n• ৩ দিনের বেশি জ্বর থাকলে চিকিৎসা সাহায্য চান\n\nএন্ডেমিক এলাকায় সর্বদা ম্যালেরিয়া, ডেঙ্গু বা টাইফয়েড বাদ দিন।";
    } else if (message.contains('child') || message.contains('baby') || message.contains('infant') || 
              message.contains('শিশু') || message.contains('বাচ্চা')) {
      return "শিশু স্বাস্থ্য একটি অগ্রাধিকার। আশা কর্মীদের জন্য মূল বিষয়গুলি:\n\n• জাতীয় সূচি অনুসারে সম্পূর্ণ টিকাকরণ নিশ্চিত করুন\n• ওজন-বয়স চার্ট ব্যবহার করে বৃদ্ধি পর্যবেক্ষণ করুন\n• প্রথম ৬ মাসের জন্য শুধুমাত্র বুকের দুধ খাওয়ানোর প্রচার করুন\n• ৬ মাস পরে, উপযুক্ত পরিপূরক খাবারের সাথে বুকের দুধ খাওয়ানো চালিয়ে যান\n• বিপদের লক্ষণগুলি দেখুন: পান/বুকের দুধ খেতে অক্ষমতা, সবকিছু বমি করা, খিঁচুনি, অবসন্নতা\n\nঅপুষ্টির আগাম শনাক্তকরণ এবং সঠিক রেফারেল জীবন বাঁচাতে পারে।";
    } else if (message.contains('diarrhea') || message.contains('ডায়রিয়া')) {
      return "ডায়রিয়া বিপজ্জনক হতে পারে, বিশেষ করে শিশুদের ক্ষেত্রে। গুরুত্বপূর্ণ ব্যবস্থাপনার পদক্ষেপগুলির মধ্যে রয়েছে:\n\n• ORS (ওরাল রিহাইড্রেশন সলিউশন) চিকিৎসার প্রথম লাইন\n• ডায়রিয়ার সময় খাওয়া চালিয়ে যান - ছোট, ঘন ঘন খাবার ভাল\n• ১০-১৪ দিনের জন্য জিঙ্ক সাপ্লিমেন্ট তীব্রতা এবং সময়কাল কমাতে পারে\n• হাত ধোয়া এবং পরিষ্কার পানীয় জল বিস্তার রোধ করে\n• যদি মলে রক্ত, অবিরাম বমি, বা ডিহাইড্রেশনের লক্ষণ (শুষ্ক মুখ, ধসে যাওয়া চোখ, প্রস্রাব কমে যাওয়া) থাকে তবে চিকিৎসা সাহায্য নিন\n\nসঠিক স্বাস্থ্যবিধি এবং স্যানিটেশন শিক্ষা মূল প্রতিরোধমূলক ব্যবস্থা।";
    } else if (message.contains('vaccination') || message.contains('vaccine') || message.contains('immunization') || 
              message.contains('টিকা') || message.contains('টিকাকরণ')) {
      return "গুরুতর রোগ প্রতিরোধের জন্য টিকাকরণ অপরিহার্য। আশা কর্মীদের জন্য মূল বিষয়গুলি:\n\n• জাতীয় টিকাকরণ সূচি অনুসরণ করুন\n• বিসিজি, ওপিভি, ডিপিটি, হেপাটাইটিস বি, হাম প্রাথমিক টিকা\n• প্রতিটি শিশুর জন্য নির্ধারিত তারিখগুলির ট্র্যাক রাখুন\n• সঠিক তথ্য দিয়ে অভিভাবকদের উদ্বেগ সমাধান করুন\n• টিকার কার্যকারিতার জন্য কোল্ড চেইন বজায় রাখুন\n\nমনে রাখবেন: বাদ পড়া টিকা পরে দেওয়া যেতে পারে - শুরু করার জন্য কখনই খুব দেরি নয়।";
    } else {
      return "আপনার প্রশ্নের জন্য ধন্যবাদ। আশা কর্মীদের জন্য একজন স্বাস্থ্য সহায়ক হিসাবে, আমি মাতৃ স্বাস্থ্য, শিশু স্বাস্থ্য এবং গ্রামীণ ভারতে সাধারণ স্বাস্থ্য সমস্যা সম্পর্কে তথ্য প্রদান করতে মনোনিবেশ করি। সম্প্রদায়ের স্বাস্থ্যসেবার জন্য আপনার কাজ অত্যন্ত গুরুত্বপূর্ণ। মনে রাখবেন, নির্দিষ্ট চিকিৎসা পরামর্শ এবং চিকিৎসার জন্য সর্বদা রোগীদের যোগ্যতাসম্পন্ন স্বাস্থ্যসেবা পেশাদারদের কাছে পাঠান।";
    }
  }

  String getEnglishPrescriptionAnalysis() {
    return "Based on the prescription image, I can identify:\n\n"
        "• Medication: Amoxicillin 500mg\n"
        "• Dosage: 1 tablet three times daily after meals\n"
        "• Duration: 7 days\n\n"
        "• Medication: Paracetamol 650mg\n"
        "• Dosage: 1 tablet as needed for fever or pain, not exceeding 3 tablets in 24 hours\n"
        "• Duration: 3 days\n\n"
        "• Medication: Cetirizine 10mg\n"
        "• Dosage: 1 tablet at night\n"
        "• Duration: 5 days\n\n"
        "Additional instructions:\n"
        "• Complete the full course of antibiotics even if feeling better\n"
        "• Drink plenty of fluids\n"
        "• Return for follow-up after 1 week\n\n"
        "Remember to explain to the patient that they should complete the entire antibiotic course, and they should contact a healthcare professional if symptoms worsen or don't improve within 2-3 days.";
  }

  String getBengaliPrescriptionAnalysis() {
    return "প্রেসক্রিপশন ছবি থেকে আমি যা চিহ্নিত করতে পারি:\n\n"
        "• ওষুধ: অ্যামক্সিসিলিন ৫০০মিগ্রা\n"
        "• ডোজ: দিনে তিনবার খাবারের পরে ১টি ট্যাবলেট\n"
        "• সময়কাল: ৭ দিন\n\n"
        "• ওষুধ: প্যারাসিটামল ৬৫০মিগ্রা\n"
        "• ডোজ: জ্বর বা ব্যথার জন্য প্রয়োজনে ১টি ট্যাবলেট, ২৪ ঘন্টায় ৩ ট্যাবলেটের বেশি নয়\n"
        "• সময়কাল: ৩ দিন\n\n"
        "• ওষুধ: সেটিরিজিন ১০মিগ্রা\n"
        "• ডোজ: রাতে ১টি ট্যাবলেট\n"
        "• সময়কাল: ৫ দিন\n\n"
        "অতিরিক্ত নির্দেশনা:\n"
        "• ভাল বোধ করলেও অ্যান্টিবায়োটিকের পুরো কোর্স সম্পূর্ণ করুন\n"
        "• প্রচুর তরল পান করুন\n"
        "• ১ সপ্তাহ পরে ফলোআপের জন্য ফিরে আসুন\n\n"
        "রোগীকে ব্যাখ্যা করতে মনে রাখবেন যে তাদের অবশ্যই সম্পূর্ণ অ্যান্টিবায়োটিক কোর্স শেষ করতে হবে, এবং উপসর্গ খারাপ হলে বা ২-৩ দিনের মধ্যে উন্নতি না হলে তাদের স্বাস্থ্যসেবা পেশাদারের সাথে যোগাযোগ করা উচিত।";
  }
}
