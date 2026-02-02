import 'package:flutter/material.dart';
import 'package:tifinagh_fonts_viewer/core/models.dart';
import 'package:tifinagh_fonts_viewer/core/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class FontCard extends StatelessWidget {
  final FontModel font;
  final String previewText;

  const FontCard({super.key, required this.font, required this.previewText});

  Future<void> _launchGitHub() async {
    // Assuming the fonts are from a specific repository
    // We can extract the folder structure from the path
    final relativePath = font.path.replaceAll('Fonts/', '');
    final url = Uri.parse(
      'https://github.com/phaylali/Tifinagh-Fonts-Viewer/blob/main/Fonts/$relativePath',
    );
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.gold, width: 0.5),
      ),
      child: InkWell(
        onTap: _launchGitHub,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      font.name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.gold,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.open_in_new,
                    color: AppColors.gold,
                    size: 16,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  previewText,
                  style: TextStyle(
                    fontFamily: font
                        .family, // Uses the family name registered in pubspec.yaml
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 1,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      AppColors.gold,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
