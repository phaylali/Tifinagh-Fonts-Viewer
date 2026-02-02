import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tifinagh_fonts_viewer/core/providers.dart';
import 'package:tifinagh_fonts_viewer/core/theme.dart';
import 'package:tifinagh_fonts_viewer/widgets/fading_gold_divider.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSpaceMode = ref.watch(themeProvider);

    return Drawer(
      backgroundColor: isSpaceMode
          ? AppColors.spaceBackground
          : AppColors.moonBackground,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.gold, width: 0.5),
              ),
            ),
            child: Center(
              child: Text(
                'TIFINAGH\nFONTS',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_4, color: AppColors.gold),
            title: Text(
              isSpaceMode ? 'Switch to Moon Mode' : 'Switch to Space Mode',
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () {
              ref.read(themeProvider.notifier).toggleTheme();
            },
          ),
          const FadingGoldDivider(verticalMargin: 8),
          ListTile(
            leading: const Icon(Icons.info_outline, color: AppColors.gold),
            title: const Text('About', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              _showAboutDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.privacy_tip_outlined,
              color: AppColors.gold,
            ),
            title: const Text(
              'Privacy Policy',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              _showPrivacyDialog(context);
            },
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'v1.0.0',
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('TIFINAGH FONTS VIEWER'),
            SizedBox(height: 8),
            FadingGoldDivider(horizontalMargin: 0, verticalMargin: 0),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'The Tifinagh Fonts Viewer is a specialized utility designed for exploring authentic Tifinagh typography.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 16),
            Text(
              'Made in Morocco by Phaylali',
              style: TextStyle(color: AppColors.gold, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.white38, fontSize: 10),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: AppColors.gold)),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Privacy Policy'),
            SizedBox(height: 8),
            FadingGoldDivider(horizontalMargin: 0, verticalMargin: 0),
          ],
        ),
        content: const Text(
          'This application is offline-first and does not collect, store, or transmit any personal data.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: AppColors.gold)),
          ),
          FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor: AppColors.gold),
            onPressed: () {
              Navigator.pop(context);
              _launchPrivacyUrl();
            },
            icon: const Icon(Icons.open_in_new, size: 18, color: Colors.black),
            label: const Text(
              'View Policy',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchPrivacyUrl() async {
    final url = Uri.parse(
      'https://documents.omniversify.com/privacy_policy.html',
    ); // Placeholder
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
