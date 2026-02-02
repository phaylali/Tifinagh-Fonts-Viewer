import 'package:flutter/material.dart';
import 'package:tifinagh_fonts_viewer/core/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT'),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'TIFINAGH\nFONTS VIEWER',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Overview',
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(
              'The Tifinagh Fonts Viewer is a specialized utility designed for exploring authentic Tifinagh typography. It serves as a companion to the open-source Tifinagh Fonts repository, providing a premium interface to preview local font files in real-time.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Text(
              'Key Features',
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 12),
            _buildFeatureItem(
              context,
              'Real-time Preview across 400+ authentic fonts.',
            ),
            _buildFeatureItem(context, 'Premium Moroccan Luxury aesthetic.'),
            _buildFeatureItem(
              context,
              'Direct access to font sources on GitHub.',
            ),
            _buildFeatureItem(
              context,
              'Offline-first design with zero network overhead.',
            ),
            const SizedBox(height: 32),
            const Divider(color: AppColors.gold, thickness: 0.2),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'v1.0.0\n© 2026 Phaylali',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white38, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(color: AppColors.gold, fontSize: 18),
          ),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
