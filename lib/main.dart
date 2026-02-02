import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tifinagh_fonts_viewer/core/providers.dart';
import 'package:tifinagh_fonts_viewer/core/theme.dart';
import 'package:tifinagh_fonts_viewer/features/about/about_page.dart';
import 'package:tifinagh_fonts_viewer/features/home/home_page.dart';
import 'package:tifinagh_fonts_viewer/features/privacy/privacy_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const TifinaghFontsApp(),
    ),
  );
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/about', builder: (context, state) => const AboutPage()),
    GoRoute(path: '/privacy', builder: (context, state) => const PrivacyPage()),
  ],
);

class TifinaghFontsApp extends ConsumerWidget {
  const TifinaghFontsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSpaceMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'Tifinagh Fonts Viewer',
      theme: isSpaceMode ? AppThemes.spaceTheme : AppThemes.moonTheme,
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
