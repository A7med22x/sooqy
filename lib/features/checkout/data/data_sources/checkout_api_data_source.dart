import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/core/errors/error_helper.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/features/checkout/data/data_sources/checkout_data_sourse.dart';
import 'package:sooqy/features/checkout/data/models/address_response/address_model.dart';
import 'package:sooqy/features/checkout/data/models/address_response/address_request.dart';
import 'package:sooqy/features/checkout/data/models/checkout_response/checkout_request.dart';
import 'package:sooqy/features/checkout/data/models/checkout_response/checkout_model.dart';
import 'package:sooqy/features/checkout/data/models/copons_response/copons_response.dart';

@LazySingleton(as: CheckoutDataSourse)
class CheckoutApiDataSource implements CheckoutDataSourse {
  final Dio _dio;

  CheckoutApiDataSource(this._dio);

  @override
  Future<List<AddressModel>> getAllAddress() async {
    try {
      final response = await _dio.get(APIConstants.addressesEndpoint);
      return (response.data as List)
          .map((json) => AddressModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }

      throw RemoteException(message ?? 'Failed to Get Addresses');
    }
  }

  @override
  Future<AddressModel> addNewAddress(AddressRequest address) async {
    try {
      final response = await _dio.post(
        APIConstants.addressesEndpoint,
        data: address.toJson(),
      );

      return AddressModel.fromJson(response.data as Map<String, dynamic>);
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }

      throw RemoteException(message ?? 'Failed to Add Address');
    }
  }

  @override
  Future<AddressModel> updateAddress(
    String addressId,
    AddressRequest address,
  ) async {
    try {
      final response = await _dio.put(
        '${APIConstants.addressesEndpoint}/$addressId',
        data: address.toJson(),
      );

      return AddressModel.fromJson(response.data as Map<String, dynamic>);
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }

      throw RemoteException(message ?? 'Failed to Update Address');
    }
  }

  @override
  Future<void> removeAddress(String addressId) async {
    try {
      await _dio.delete('${APIConstants.addressesEndpoint}/$addressId');
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }

      throw RemoteException(message ?? 'Failed to Delete Address');
    }
  }

  @override
  Future<CheckoutModel> checkout(CheckoutRequest request) async {
    try {
      final response = await _dio.post(
        APIConstants.checkoutEndpoint,
        data: request.toJson(),
      );
      return CheckoutModel.fromJson(response.data);
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }

      throw RemoteException(message ?? 'Failed to Create Order');
    }
  }

  @override
  Future<double> applyCoupon(String couponCode) async {
    try {
      final response = await _dio.post(
        APIConstants.applyCouponEndpoint,
        data: {'couponCode': couponCode},
      );
      return (response.data['discountAmount']);
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }

      throw RemoteException(message ?? 'Failed to Active Coupon');
    }
  }

  @override
  Future<CoponsResponse> getCoupons() async {
    try {
      final response = await _dio.get(
        APIConstants.getCouponsEndpoint,
      );
      return CoponsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;

      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }

      throw RemoteException(message ?? 'Failed to Get Coupons');
    }
  }
}
