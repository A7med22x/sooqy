import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:sooqy/features/cart/data/models/cart_responsel.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartAPIRemoteDataSource implements CartRemoteDataSource {
  final Dio _dio;

  const CartAPIRemoteDataSource(this._dio);

  @override
  Future<void> addItemToCart(String productId) async {
    try {
      await _dio.post(
        APIConstants.increme1ToItemInCartEndpoint,
        data: {'productId': productId, 'quantity': 1},
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to add product to cart');
    }
  }

  @override
  Future<CartResponse> getCart() async {
    try {
      final response = await _dio.get(APIConstants.getCartEndpoint);
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to get cart');
    }
  }

  @override
  Future<void> removeItemFromCart(String itemId) async {
    try {
      await _dio.delete('${APIConstants.removeItemFromCartEndpoint}$itemId');
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to remove product from cart');
    }
  }

  @override
  Future<void> decreaseItemInCart(String itemId) async {
    try {
      await _dio.post(
        APIConstants.decreme1FromItemInCartEndpoint,
        data: {
          'itemId': itemId,
          'quantity': 1,
        },
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'Failed to update product');
    }
  }
}
