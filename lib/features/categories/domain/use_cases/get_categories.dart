import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/categories/domain/entities/category.dart';
import 'package:sooqy/features/categories/domain/repositories/category_repository.dart';

@lazySingleton
class GetCategories {
  final CategoryRepository _repository;
  GetCategories(this._repository);
  Future<Either<Failure, List<Category>>> call() =>
      _repository.getCategories();
}
