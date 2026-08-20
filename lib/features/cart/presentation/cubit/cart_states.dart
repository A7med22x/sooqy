import 'package:sooqy/features/cart/domain/entities/cart_item.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class AddItemToCartLoading extends CartState {}

class AddItemToCartSuccess extends CartState {}

class AddItemToCartError extends CartState {
  final String message;

  AddItemToCartError(this.message);
}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {
  final List<CartItem> items;

  GetCartSuccess(this.items);
}

class GetCartError extends CartState {
  final String message;

  GetCartError(this.message);
}

class DecreaseItemInCartLoading extends CartState {}

class DecreaseItemInCartSuccess extends CartState {}

class DecreaseItemInCartError extends CartState {
  final String message;

  DecreaseItemInCartError(this.message);
}

class RemoveItemFromCartLoading extends CartState {}

class RemoveItemFromCartSuccess extends CartState {}

class RemoveItemFromCartError extends CartState {
  final String message;

  RemoveItemFromCartError(this.message);
}
