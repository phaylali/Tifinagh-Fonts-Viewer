class FontModel {
  final String name;
  final String path;
  final String family;

  FontModel({required this.name, required this.path, required this.family});

  factory FontModel.fromJson(Map<String, dynamic> json) {
    return FontModel(
      name: json['name'] as String,
      path: json['path'] as String,
      family: json['family'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'path': path, 'family': family};
  }
}
