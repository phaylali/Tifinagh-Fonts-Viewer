class FontModel {
  final String name;
  final String family;
  final Map<String, String> formats;

  FontModel({required this.name, required this.family, required this.formats});

  factory FontModel.fromJson(Map<String, dynamic> json) {
    return FontModel(
      name: json['name'] as String,
      family: json['family'] as String,
      formats: Map<String, String>.from(json['formats'] as Map),
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'family': family, 'formats': formats};
  }
}
