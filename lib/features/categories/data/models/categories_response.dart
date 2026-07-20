import 'package:sooqy/features/categories/data/models/category_model.dart';

class CategoriesResponse {
  final List<CategoryModel> categories;

  const CategoriesResponse({required this.categories});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
