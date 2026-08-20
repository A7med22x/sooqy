import 'package:sooqy/features/cart/data/models/cart_responsel.dart';

abstract class CartRemoteDataSource {
  Future<void> addItemToCart(String productId);

  Future<CartResponse> getCart();

  Future<void> decreaseItemInCart(String itemId);

  Future<void> removeItemFromCart(String itemId);
}
