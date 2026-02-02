import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tifinagh_fonts_viewer/core/models.dart';

final fontsProvider = FutureProvider<List<FontModel>>((ref) async {
  final content = await rootBundle.loadString('assets/fonts.json');
  final List<dynamic> jsonList = json.decode(content);
  return jsonList.map((j) => FontModel.fromJson(j)).toList();
});

final searchTextProvider = NotifierProvider<SearchTextNotifier, String>(() {
  return SearchTextNotifier();
});

class SearchTextNotifier extends Notifier<String> {
  @override
  String build() => '';

  void update(String value) => state = value;
}

final filteredFontsProvider = Provider<List<FontModel>>((ref) {
  final fontsAsync = ref.watch(fontsProvider);
  final searchText = ref.watch(searchTextProvider).toLowerCase();

  return fontsAsync.when(
    data: (fonts) {
      if (searchText.isEmpty) return fonts;
      return fonts
          .where((f) => f.name.toLowerCase().contains(searchText))
          .toList();
    },
    loading: () => [],
    error: (err, stack) => [],
  );
});

final previewTextProvider = NotifierProvider<PreviewTextNotifier, String>(() {
  return PreviewTextNotifier();
});

class PreviewTextNotifier extends Notifier<String> {
  @override
  String build() => 'oⵎⵏⵉⵠⴻⵔⵙⵉⴼⵢ';

  void update(String value) => state = value;
}
