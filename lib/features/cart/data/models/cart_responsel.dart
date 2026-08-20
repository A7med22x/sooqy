import 'package:sooqy/features/cart/data/models/cart_item_model.dart';

class CartResponse {
  final String cartId;
  final List<CartItemModel> items;

  const CartResponse({required this.cartId, required this.items});

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
    cartId: json['cartId'] as String,
    items: (json['cartItems'] as List)
        .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
