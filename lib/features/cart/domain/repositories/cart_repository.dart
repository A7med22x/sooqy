import 'package:dartz/dartz.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/cart/domain/entities/cart_item.dart';

abstract class CartRepository {
  Future<Either<Failure, void>> addItemToCart(String productId);

  Future<Either<Failure, List<CartItem>>> getCart();

  Future<Either<Failure, void>> decreaseItemInCart(String itemId);

  Future<Either<Failure, void>> removeItemFromCart(String itemId);
}
