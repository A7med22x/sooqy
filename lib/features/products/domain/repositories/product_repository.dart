import 'package:dartz/dartz.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/products/data/models/product_request.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts(ProductRequest request);
}
