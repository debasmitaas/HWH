import 'package:flutter/material.dart';

/// A utility class to help with reliable text field updates.
/// This is particularly useful when text is coming from voice input
/// and needs to be reliably set in the text field.
class DirectTextUpdater {
  /// Updates a text controller and triggers rebuilds to ensure
  /// the text is properly displayed in a TextField.
  static void updateText({
    required TextEditingController controller, 
    required String text,
    required Function setState,
    bool moveCursorToEnd = true,
    bool printDebugInfo = true,
  }) {
    if (text.isEmpty) {
      if (printDebugInfo) {
        debugPrint('📝 DirectTextUpdater: Empty text received, not updating controller');
      }
      return;
    }

    try {
      // Direct update to the controller
      controller.text = text;
      
      if (printDebugInfo) {
        debugPrint('📝 DirectTextUpdater: Directly set controller text: "${controller.text}"');
      }
      
      // Move cursor to end if requested
      if (moveCursorToEnd) {
        controller.selection = TextSelection.collapsed(offset: text.length);
      }
      
      // Force an update with setState
      setState(() {
        if (printDebugInfo) {
          debugPrint('📝 DirectTextUpdater: Inside setState - ensuring text is set');
        }
        
        // Ensure text is set correctly
        if (controller.text != text) {
          controller.text = text;
          
          // Reset cursor position
          if (moveCursorToEnd) {
            controller.selection = TextSelection.collapsed(offset: text.length);
          }
        }
      });
      
      if (printDebugInfo) {
        debugPrint('📝 DirectTextUpdater: After setState - controller text: "${controller.text}"');
      }
      
      // Add an extra delayed update as a safety measure
      Future.delayed(const Duration(milliseconds: 100), () {
        try {
          // Check if text was properly set
          if (controller.text != text) {
            if (printDebugInfo) {
              debugPrint('📝 DirectTextUpdater: Text inconsistency detected, forcing update');
            }
            
            // Force one more update
            setState(() {
              controller.text = text;
              if (moveCursorToEnd) {
                controller.selection = TextSelection.collapsed(offset: text.length);
              }
            });
          }
        } catch (e) {
          debugPrint('📝 DirectTextUpdater: Error in delayed update: $e');
        }
      });
    } catch (e) {
      debugPrint('📝 DirectTextUpdater: Error updating text: $e');
    }
  }
}
