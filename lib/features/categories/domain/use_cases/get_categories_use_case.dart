import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/categories/domain/entities/category_entity.dart';
import 'package:sooqy/features/categories/domain/repositories/category_repository.dart';

@lazySingleton
class GetCategoriesUseCase {
  final CategoryRepository _repository;
  GetCategoriesUseCase(this._repository);
  Future<Either<Failure, List<CategoryEntity>>> call() =>
      _repository.getCategories();
}
