import 'package:flutter/material.dart';
import 'package:tifinagh_fonts_viewer/core/models.dart';
import 'package:tifinagh_fonts_viewer/core/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class FontCard extends StatelessWidget {
  final FontModel font;
  final String previewText;

  const FontCard({super.key, required this.font, required this.previewText});

  Future<void> _launchGitHub(String path) async {
    final relativePath = path.replaceAll('\\', '/');
    final url = Uri.parse(
      'https://github.com/phaylali/Tifinagh-Fonts-Viewer/blob/main/$relativePath',
    );
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                Row(
                  children: font.formats.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: _buildFormatButton(
                        context,
                        entry.key,
                        entry.value,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              height: 0.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: AppColors.goldFadeGradient,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                previewText,
                style: TextStyle(
                  fontFamily: font.family,
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormatButton(BuildContext context, String ext, String path) {
    return InkWell(
      onTap: () => _launchGitHub(path),
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gold, width: 0.5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          ext.toUpperCase(),
          style: const TextStyle(
            color: AppColors.gold,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
