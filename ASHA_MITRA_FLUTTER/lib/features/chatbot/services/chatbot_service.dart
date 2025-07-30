import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../shared/providers/language_provider.dart';

class ChatbotService {
  final String _apiUrl;
  final String _apiKey;
  final Language language;

  ChatbotService({required this.language}) :
    _apiUrl = dotenv.env['GEMINI_API_URL'] ?? 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent',
    _apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';

  Future<String> sendMessage(String message, {int retryCount = 0}) async {
    try {
      // Standard API implementation
      // First prepare the system prompt based on the language
      String systemPrompt;
      
      if (language == Language.bengali) {
        systemPrompt = 'আপনি ভারতের আশা কর্মীদের জন্য একটি AI স্বাস্থ্য সহায়ক। '
            'সহায়ক, সঠিক চিকিৎসা তথ্য প্রদান করুন কিন্তু সর্বদা ব্যবহারকারীদের মনে করিয়ে দিন '
            'নির্দিষ্ট চিকিৎসা পরামর্শের জন্য যোগ্য স্বাস্থ্যসেবা পেশাদারদের সাথে পরামর্শ করুন। '
            'মাতৃ স্বাস্থ্য, শিশু স্বাস্থ্য এবং গ্রামীণ ভারতে সাধারণ স্বাস্থ্য সমস্যাগুলিতে মনোনিবেশ করুন। '
            'সম্মানজনক হোন এবং সহজ ভাষা ব্যবহার করুন। নির্দিষ্ট রোগ নির্ণয় করা এড়িয়ে চলুন। '
            'আপনার উত্তর অবশ্যই পুরোপুরি শুদ্ধ বাংলায় দিন, কোনো ইংরেজি শব্দ বা বাক্য ব্যবহার করবেন না। '
            'প্রশ্ন যদি ইংরেজিতে থাকে তবেও উত্তর সম্পূর্ণভাবে শুধু বাংলায় দিন। '
            'বাংলা বানান শুদ্ধভাবে লিখুন এবং গ্রামীণ মানুষের বোঝার মতো সহজ ও স্পষ্ট ভাষা ব্যবহার করুন। '
            'এটি অত্যন্ত গুরুত্বপূর্ণ যে আপনার সমস্ত উত্তর ১০০% বিশুদ্ধ বাংলায় হবে, একটিও ইংরেজি শব্দ ছাড়া।';
      } else {
        systemPrompt = 'You are an AI health assistant for ASHA workers in India. '
            'Provide helpful, accurate medical information but always remind users '
            'to consult qualified healthcare professionals for specific medical advice. '
            'Focus on maternal health, child health, and common health issues in rural India. '
            'Be respectful and use simple language. Avoid making definitive diagnoses.';
      }
      
      final response = await http.post(
        Uri.parse('$_apiUrl?key=$_apiKey'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'role': 'user',
              'parts': [
                {
                  'text': '$systemPrompt\n\nUser query: $message'
                }
              ]
            }
          ],
          'generationConfig': {
            'temperature': 0.7,
            'topP': 1.0,
            'maxOutputTokens': 500,
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        debugPrint('Error response: ${response.body}');
        
        // Parse the error response to provide better error messages
        try {
          final errorData = json.decode(response.body);
          final errorCode = errorData['error']['code'];
          
          // Handle 503 error (model overloaded) with automatic retry
          if (errorCode == 503 && retryCount < 2) {
            // Wait for a moment before retrying
            debugPrint('API overloaded. Retrying in ${(retryCount + 1) * 2} seconds...');
            await Future.delayed(Duration(seconds: (retryCount + 1) * 2));
            // Retry with incremented retry count
            return sendMessage(message, retryCount: retryCount + 1);
          } else if (errorCode == 503) {
            return language == Language.bengali
                ? 'এই মুহূর্তে এআই সিস্টেম খুব ব্যস্ত। অনুগ্রহ করে কিছুক্ষণ পরে আবার চেষ্টা করুন।'
                : 'The AI system is currently busy. Please try again in a few moments.';
          } else if (errorCode == 404) {
            return language == Language.bengali
                ? 'এআই মডেল সম্পর্কিত সমস্যা। অনুগ্রহ করে কিছুক্ষণ পরে আবার চেষ্টা করুন।'
                : 'There was an issue with the AI model. Please try again later.';
          }
        } catch (e) {
          // JSON parsing error, continue to default message
        }
        
        return language == Language.bengali
            ? 'দুঃখিত, আমি একটি সমস্যার সম্মুখীন হয়েছি। অনুগ্রহ করে কিছুক্ষণ পরে আবার চেষ্টা করুন।'
            : 'Sorry, I encountered an error. Please try again later.';
      }
    } catch (e) {
      debugPrint('Exception in ChatbotService.sendMessage: $e');
      return language == Language.bengali
          ? 'নেটওয়ার্ক সমস্যা। অনুগ্রহ করে আপনার ইন্টারনেট সংযোগ পরীক্ষা করুন এবং আবার চেষ্টা করুন।'
          : 'Network error. Please check your internet connection and try again.';
    }
  }

  Future<String> analyzePrescription(File image, {int retryCount = 0}) async {
    try {
      // Standard API implementation
      // Convert image to base64
      final bytes = await image.readAsBytes();
      final base64Image = base64Encode(bytes);
      
      // Using Gemini Vision model for image analysis
      // Use the same URL as the text API since Gemini 1.5 Flash supports multimodal input
      final visionUrl = '$_apiUrl?key=$_apiKey';
      
      // Prepare instructions based on language
      String analysisInstruction;
      if (language == Language.bengali) {
        analysisInstruction = 'এই চিকিৎসার প্রেসক্রিপশন ছবিটি বিশ্লেষণ করুন। ওষুধ, ডোজ এবং নির্দেশনাগুলি চিহ্নিত করুন। '
            'বুলেট পয়েন্ট দিয়ে উত্তর পরিষ্কারভাবে ফরম্যাট করুন। '
            'আপনার উত্তর অবশ্যই পুরোপুরি বিশুদ্ধ বাংলায় দিন, কোনো ইংরেজি শব্দ ব্যবহার করবেন না। '
            'যদি কোন ওষুধের নাম ইংরেজিতে থাকে, তবে সেটা বাংলায় লিখুন এবং বাংলা উচ্চারণও দিন। '
            'সহজ গ্রাম্য ভাষায় বুঝিয়ে দিন যেন ASHA কর্মীরা রোগীদের সহজে বোঝাতে পারেন। '
            'আপনার সমস্ত ব্যাখ্যা ও নির্দেশনা অবশ্যই শুধুমাত্র বাংলায় হবে, এটি অত্যন্ত গুরুত্বপূর্ণ।';
      } else {
        analysisInstruction = 'Analyze this medical prescription image. Identify medications, dosages, and instructions. Format the response clearly with bullet points.';
      }
      
      final response = await http.post(
        Uri.parse(visionUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'role': 'user',
              'parts': [
                {
                  'text': analysisInstruction
                },
                {
                  'inline_data': {
                    'mime_type': 'image/jpeg',
                    'data': base64Image
                  }
                }
              ]
            }
          ],
          'generationConfig': {
            'temperature': 0.2,
            'topP': 1.0,
            'maxOutputTokens': 800,
          }
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        debugPrint('Error response from Gemini Vision API: ${response.body}');
        
        // Parse the error response to provide better error messages
        try {
          final errorData = json.decode(response.body);
          final errorCode = errorData['error']['code'];
          
          // Handle 503 error (model overloaded) with automatic retry
          if (errorCode == 503 && retryCount < 2) {
            // Wait for a moment before retrying
            debugPrint('API overloaded. Retrying in ${(retryCount + 1) * 2} seconds...');
            await Future.delayed(Duration(seconds: (retryCount + 1) * 2));
            // Retry with incremented retry count
            return analyzePrescription(image, retryCount: retryCount + 1);
          } else if (errorCode == 503) {
            return language == Language.bengali
                ? 'এই মুহূর্তে এআই সিস্টেম খুব ব্যস্ত। অনুগ্রহ করে কিছুক্ষণ পরে আবার চেষ্টা করুন।'
                : 'The AI system is currently busy. Please try again in a few moments.';
          } else if (errorCode == 404) {
            return language == Language.bengali
                ? 'এআই মডেল সম্পর্কিত সমস্যা। অনুগ্রহ করে কিছুক্ষণ পরে আবার চেষ্টা করুন।'
                : 'There was an issue with the AI model. Please try again later.';
          }
        } catch (e) {
          // JSON parsing error, continue to default message
        }
        
        return language == Language.bengali
            ? 'প্রেসক্রিপশন বিশ্লেষণ করতে সমস্যা হয়েছে। অনুগ্রহ করে কিছুক্ষণ পরে আবার চেষ্টা করুন।'
            : 'Sorry, I encountered an error analyzing the prescription. Please try again later.';
      }
    } catch (e) {
      debugPrint('Exception in ChatbotService.analyzePrescription: $e');
      return language == Language.bengali
          ? 'প্রেসক্রিপশন বিশ্লেষণ করতে সমস্যা হয়েছে। অনুগ্রহ করে আরও পরিষ্কার ছবি তুলুন বা কিছুক্ষণ পরে আবার চেষ্টা করুন।'
          : 'Error analyzing prescription. Please try again or take a clearer image.';
    }
  }
}
