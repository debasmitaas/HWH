// Test script to debug phone number formats for Supabase
// This helps identify the exact format that works

import 'package:flutter/foundation.dart';

void testPhoneFormats() {
  debugPrint('=== PHONE NUMBER FORMAT TESTING ===');
  
  List<String> testNumbers = [
    '9876543210',      // 10-digit Indian number
    '+919876543210',   // E.164 format
    '919876543210',    // 12-digit with country code
    '09876543210',     // 11-digit with leading 0
    '091987654321',    // Wrong format example
  ];
  
  for (String number in testNumbers) {
    String formatted = formatPhoneNumber(number);
    bool isValid = isValidPhoneNumber(number);
    debugPrint('Input: "$number" -> Output: "$formatted" (Valid: $isValid)');
  }
}

String formatPhoneNumber(String phone) {
  // Remove any non-digit characters
  String cleaned = phone.replaceAll(RegExp(r'[^\d]'), '');
  debugPrint('📞 Phone formatting - Input: "$phone", Cleaned: "$cleaned"');
  
  // Handle different input formats for Indian phone numbers
  if (cleaned.length == 10 && RegExp(r'^[6-9]').hasMatch(cleaned)) {
    // 10-digit number starting with 6-9 (valid Indian mobile)
    cleaned = '91$cleaned';
  } else if (cleaned.length == 11 && cleaned.startsWith('0')) {
    // 11-digit number starting with 0 (remove leading 0 and add 91)
    cleaned = '91${cleaned.substring(1)}';
  } else if (cleaned.length == 12 && cleaned.startsWith('91')) {
    // Already has 91 prefix, keep as is
  } else if (cleaned.length == 13 && cleaned.startsWith('091')) {
    // Handle 091 prefix (remove 0)
    cleaned = cleaned.substring(1);
  } else {
    debugPrint('⚠️ Unexpected phone number format: $cleaned');
  }
  
  final formatted = '+$cleaned';
  debugPrint('📞 Phone formatting - Output: "$formatted"');
  return formatted;
}

bool isValidPhoneNumber(String phone) {
  // Remove any non-digit characters for validation
  String cleaned = phone.replaceAll(RegExp(r'[^\d]'), '');
  
  // Check if it's a valid Indian phone number
  // Should be 10 digits starting with 6-9, or 12 digits starting with 91
  if (cleaned.length == 10 && RegExp(r'^[6-9]').hasMatch(cleaned)) {
    return true;
  } else if (cleaned.length == 12 && cleaned.startsWith('91') && RegExp(r'^91[6-9]').hasMatch(cleaned)) {
    return true;
  } else if (cleaned.length == 11 && cleaned.startsWith('0') && RegExp(r'^0[6-9]').hasMatch(cleaned)) {
    return true; // Handle numbers like 09876543210
  }
  
  return false;
}
