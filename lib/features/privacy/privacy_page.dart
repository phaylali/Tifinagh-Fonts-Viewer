import 'package:flutter/material.dart';
import 'package:tifinagh_fonts_viewer/core/theme.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRIVACY POLICY'),
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
            Text(
              'Privacy Commitment',
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'The Tifinagh Fonts Viewer is an offline-first application. We are committed to your privacy and transparency.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              'Data Collection',
              'This application does not collect, store, or transmit any personal data, usage analytics, or device identifiers. All font files are bundled locally or accessed via user-initated GitHub links.',
            ),
            _buildSection(
              context,
              'Permissions',
              'This app requires internet permission solely for launching GitHub URLs in your external web browser. No other permissions are required.',
            ),
            _buildSection(
              context,
              'Third-Party Links',
              'The app contains links to GitHub. When you click these links, you are subject to GitHub\'s privacy policy.',
            ),
            const SizedBox(height: 32),
            const Divider(color: AppColors.gold, thickness: 0.2),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Last Updated: February 2026',
                style: TextStyle(color: Colors.white38, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(content, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
