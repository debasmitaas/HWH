import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/language_provider.dart';

class LanguageToggle extends ConsumerWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(languageProvider);
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLanguageButton(
            context,
            ref,
            language: Language.english,
            text: 'EN',
            isSelected: currentLanguage == Language.english,
          ),
          _buildLanguageButton(
            context,
            ref,
            language: Language.bengali,
            text: 'বাং',
            isSelected: currentLanguage == Language.bengali,
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(
    BuildContext context,
    WidgetRef ref, {
    required Language language,
    required String text,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => ref.read(languageProvider.notifier).setLanguage(language),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.primary : null,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected 
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
