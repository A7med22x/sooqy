import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/cart/domain/repositories/cart_repository.dart';

@lazySingleton
class DecreaseItemInCart {
  final CartRepository _repository;

  const DecreaseItemInCart(this._repository);

  Future<Either<Failure, void>> call(String productId) =>
      _repository.decreaseItemInCart(productId);
}
