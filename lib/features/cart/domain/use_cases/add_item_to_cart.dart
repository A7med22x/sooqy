import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/cart/domain/repositories/cart_repository.dart';

@lazySingleton
class AddItemToCart {
  final CartRepository _repository;

  const AddItemToCart(this._repository);

  Future<Either<Failure, void>> call(String productId) =>
      _repository.addItemToCart(productId);
}
