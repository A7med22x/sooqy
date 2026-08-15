import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:sooqy/features/products/data/mappers/product_mappers.dart';
import 'package:sooqy/features/products/data/models/product_request.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';
import 'package:sooqy/features/products/domain/repositories/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductsRemoteDataSource _remoteDataSource;
  ProductRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<Product>>> getProducts(
    ProductRequest request,
  ) async {
    try {
      final respose = await _remoteDataSource.getProducts(request);
      final products = respose.products
          .map((productModel) => productModel.toEntity)
          .toList();
      return Right(products);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }
}
