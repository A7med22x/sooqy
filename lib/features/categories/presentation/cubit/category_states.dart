import 'package:sooqy/features/categories/domain/entities/category.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class GetCategoriesLoading extends CategoryState {}

class GetCategoriesSuccess extends CategoryState {
  final List<Category> categories;
  GetCategoriesSuccess(this.categories);
}

class GetCategoriesError extends CategoryState {
  final String message;
  GetCategoriesError(this.message);
}
