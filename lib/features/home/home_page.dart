import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tifinagh_fonts_viewer/core/font_service.dart';
import 'package:tifinagh_fonts_viewer/core/theme.dart';
import 'package:tifinagh_fonts_viewer/widgets/app_drawer.dart';
import 'package:tifinagh_fonts_viewer/widgets/font_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredFonts = ref.watch(filteredFontsProvider);
    final previewText = ref.watch(previewTextProvider);
    final fontsAsync = ref.watch(fontsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TIFINAGH FONTS',
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(fontSize: 20),
        ),
        flexibleSpace: Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 1,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              gradient: AppColors.goldFadeGradient,
            ),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          _buildSearchAndPreview(context, ref),
          Expanded(
            child: fontsAsync.when(
              data: (_) => ListView.builder(
                padding: const EdgeInsets.only(bottom: 24),
                itemCount: filteredFonts.length,
                itemBuilder: (context, index) {
                  return FontCard(
                    font: filteredFonts[index],
                    previewText: previewText.isEmpty ? 'ⴰⵎⴰⵣⵉⴳⵀ' : previewText,
                  );
                },
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.gold),
              ),
              error: (err, stack) => Center(
                child: Text(
                  'Error loading fonts: $err',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndPreview(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        border: Border(bottom: BorderSide(color: AppColors.gold, width: 0.3)),
      ),
      child: Column(
        children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search fonts...',
              hintStyle: const TextStyle(color: Colors.white38),
              prefixIcon: const Icon(Icons.search, color: AppColors.gold),
              filled: true,
              fillColor: Colors.white.withAlpha(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.gold, width: 0.2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.white10, width: 0.2),
              ),
            ),
            onChanged: (value) {
              ref.read(searchTextProvider.notifier).update(value);
            },
          ),
          const SizedBox(height: 12),
          TextField(
            style: const TextStyle(color: AppColors.gold, fontSize: 18),
            decoration: InputDecoration(
              hintText: 'Preview text (e.g. ⴰⵎⴰⵣⵉⴳⵀ)',
              hintStyle: const TextStyle(color: Colors.white24),
              prefixIcon: const Icon(Icons.text_fields, color: AppColors.gold),
              filled: true,
              fillColor: Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.gold, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.gold, width: 0.2),
              ),
            ),
            onChanged: (value) {
              ref.read(previewTextProvider.notifier).update(value);
            },
          ),
        ],
      ),
    );
  }
}
