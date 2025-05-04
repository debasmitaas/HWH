import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// A utility class that forcefully updates text fields
class TextFieldUpdater {
  /// Force update a text field with the given value
  /// This approach uses multiple techniques to ensure the text is set
  static void forceUpdateTextField({
    required TextEditingController controller,
    required String text,
    required Function(void Function()) setState,
    bool debug = true,
  }) {
    if (text.isEmpty) {
      if (debug) debugPrint('⚠️ TextFieldUpdater: Empty text provided, not updating');
      return;
    }
    
    if (debug) debugPrint('🔄 TextFieldUpdater: Setting text to "$text"');
    
    // Method 1: Direct assignment
    controller.text = text;
    controller.selection = TextSelection.fromPosition(TextPosition(offset: text.length));
    
    // Method 2: Force UI refresh with setState
    setState(() {
      controller.text = text;
      controller.selection = TextSelection.fromPosition(TextPosition(offset: text.length));
    });
    
    // Method 3: Use post-frame callback to update after the current frame is built
    SchedulerBinding.instance.addPostFrameCallback((_) {
      controller.text = text;
      controller.selection = TextSelection.fromPosition(TextPosition(offset: text.length));
      if (debug) debugPrint('🔄 TextFieldUpdater: Post-frame update completed');
    });
    
    // Method 4: Delayed update as a fallback
    Future.delayed(const Duration(milliseconds: 200), () {
      controller.text = text;
      controller.selection = TextSelection.fromPosition(TextPosition(offset: text.length));
      if (debug) debugPrint('🔄 TextFieldUpdater: Delayed update completed');
    });
  }
}
