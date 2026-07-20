import 'package:sooqy/features/categories/data/models/categories_response.dart';

abstract class CategoriesRemoteDataSource {
  Future<CategoriesResponse> getCategories();
}
