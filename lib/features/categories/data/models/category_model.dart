class CategoryModel {
  final String id;
  final String name;
  final String? description; //nullable in api
  final String? coverPictureUrl; //nullable in api

  const CategoryModel({
    required this.id,
    required this.name,
    this.description,
    this.coverPictureUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String?,
    coverPictureUrl: json['coverPictureUrl'] as String?,
  );
}
