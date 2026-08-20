import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/features/cart/domain/entities/cart_item.dart';
import 'package:sooqy/features/cart/domain/use_cases/add_item_to_cart.dart';
import 'package:sooqy/features/cart/domain/use_cases/decrease_item_in_cart.dart';
import 'package:sooqy/features/cart/domain/use_cases/get_cart.dart';
import 'package:sooqy/features/cart/domain/use_cases/remove_item_from_cart.dart';
import 'package:sooqy/features/cart/presentation/cubit/cart_states.dart';

@lazySingleton
class CartCubit extends Cubit<CartState> {
  final AddItemToCart _addItemToCart;
  final RemoveItemFromCart _removeItemFromCart;
  final DecreaseItemInCart _decreaseItemInCart;
  final GetCart _getCart;

  List<CartItem> cartList = [];
  double totalPrice = 0;
  int totalCount = 0;
  final Set<String> addingItems = {};
  final Set<String> removingItems = {};
  final Set<String> decreasingItems = {};

  CartCubit(
    this._addItemToCart,
    this._getCart,
    this._removeItemFromCart,
    this._decreaseItemInCart,
  ) : super(CartInitial());

  bool isAdding(String productId) {
    return addingItems.contains(productId);
  }

  bool isRemoving(String itemId) {
    return removingItems.contains(itemId);
  }

  bool isDecreasing(String itemId) {
    return decreasingItems.contains(itemId);
  }

  Future<void> addItem(String productId) async {
    if (addingItems.contains(productId)) return;
    addingItems.add(productId);
    emit(AddItemToCartLoading());
    final result = await _addItemToCart(productId);
    result.fold(
      (failure) async {
        addingItems.remove(productId);
        emit(AddItemToCartError(failure.message));
      },
      (_) async {
        addingItems.remove(productId);
        await refreshCart();
        emit(AddItemToCartSuccess());
      },
    );
  }

  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCart();
    result.fold(
      (failure) {
        emit(GetCartError(failure.message));
      },
      (cart) {
        cartList = cart;
        calcTotalPrice();
        emit(GetCartSuccess(cart));
      },
    );
  }

  Future<void> decreaseItem(String itemId) async {
    if (decreasingItems.contains(itemId)) return;
    decreasingItems.add(itemId);
    emit(DecreaseItemInCartLoading());
    final result = await _decreaseItemInCart(itemId);
    result.fold(
      (failure) async {
        decreasingItems.remove(itemId);
        emit(DecreaseItemInCartError(failure.message));
      },
      (_) async {
        decreasingItems.remove(itemId);
        await refreshCart();
        emit(DecreaseItemInCartSuccess());
      },
    );
  }

  Future<void> removeItem(String itemId) async {
    if (removingItems.contains(itemId)) return;
    removingItems.add(itemId);
    emit(RemoveItemFromCartLoading());
    final result = await _removeItemFromCart(itemId);
    result.fold(
      (failure) async {
        removingItems.remove(itemId);
        emit(RemoveItemFromCartError(failure.message));
      },
      (_) async {
        removingItems.remove(itemId);
        await refreshCart();
        emit(RemoveItemFromCartSuccess());
      },
    );
  }

  Future<void> refreshCart() async {
    final result = await _getCart();
    result.fold(
      (failure) {
        emit(GetCartError(failure.message));
      },
      (cart) {
        cartList = cart;
        calcTotalPrice();
        emit(GetCartSuccess(cart));
      },
    );
  }

  void calcTotalPrice() {
    totalPrice = 0;
    totalCount = 0;

    for (final item in cartList) {
      totalPrice += item.totalPriceForItem;
      totalCount += item.quantity;
    }
  }
}
