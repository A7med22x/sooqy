import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/products/data/models/product_request.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';
import 'package:sooqy/features/products/domain/repositories/product_repository.dart';

@lazySingleton
class GetProducts {
  final ProductRepository _repository;
  GetProducts(this._repository);
  Future<Either<Failure, List<Product>>> call(ProductRequest request) =>
      _repository.getProducts(request);
}
