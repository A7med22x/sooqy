import 'package:dartz/dartz.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/categories/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  
}