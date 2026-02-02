import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tifinagh_fonts_viewer/core/providers.dart';
import 'package:tifinagh_fonts_viewer/core/theme.dart';

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
          const Divider(color: AppColors.gold, thickness: 0.2),
          ListTile(
            leading: const Icon(Icons.info_outline, color: AppColors.gold),
            title: const Text('About', style: TextStyle(color: Colors.white)),
            onTap: () {
              context.push('/about');
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
              context.push('/privacy');
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
}
