import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final themeProvider = NotifierProvider<ThemeNotifier, bool>(() {
  return ThemeNotifier();
});

class ThemeNotifier extends Notifier<bool> {
  static const _key = 'is_space_mode';

  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getBool(_key) ?? true;
  }

  void toggleTheme() {
    final prefs = ref.read(sharedPreferencesProvider);
    state = !state;
    prefs.setBool(_key, state);
  }
}
