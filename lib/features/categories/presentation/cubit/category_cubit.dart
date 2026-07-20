import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/features/categories/domain/use_cases/get_categories_use_case.dart';
import 'package:sooqy/features/categories/presentation/cubit/category_states.dart';

@lazySingleton
class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase _getCategories;
  CategoryCubit(this._getCategories) : super(CategoryInitial()) {
    getCategories();
  }

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final result = await _getCategories();
    result.fold(
      (failure) => emit(GetCategoriesError(failure.message)),
      (categories) => emit(GetCategoriesSuccess(categories)),
    );
  }
}
