import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/categories/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:sooqy/features/categories/data/mappers/category_mappers.dart';
import 'package:sooqy/features/categories/domain/entities/category.dart';
import 'package:sooqy/features/categories/domain/repositories/category_repository.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoriesRemoteDataSource _remoteDataSource;
  CategoryRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final respose = await _remoteDataSource.getCategories();
      final categories = respose.categories
          .map((categoryModel) => categoryModel.toEntity)
          .toList();
      return Right(categories);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }
}
