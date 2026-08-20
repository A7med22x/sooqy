import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/cart/domain/entities/cart_item.dart';
import 'package:sooqy/features/cart/domain/repositories/cart_repository.dart';

@lazySingleton
class GetCart {
  final CartRepository _repository;

  const GetCart(this._repository);

  Future<Either<Failure, List<CartItem>>> call() => _repository.getCart();
}
