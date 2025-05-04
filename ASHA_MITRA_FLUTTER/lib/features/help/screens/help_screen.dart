import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/language_provider.dart';
import '../../../shared/widgets/language_toggle.dart';

class HelpScreen extends ConsumerWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final texts = ref.watch(textsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.help),
        actions: const [
          LanguageToggle(),
        ],
      ),
      body: const Center(
        child: Text('Help Screen'),
      ),
    );
  }
}
