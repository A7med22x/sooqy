import 'package:sooqy/features/checkout/data/models/address_response/address_model.dart';
import 'package:sooqy/features/checkout/data/models/address_response/address_request.dart';
import 'package:sooqy/features/checkout/data/models/checkout_response/checkout_request.dart';
import 'package:sooqy/features/checkout/data/models/checkout_response/checkout_model.dart';
import 'package:sooqy/features/checkout/data/models/copons_response/copons_response.dart';

abstract class CheckoutDataSourse {
  Future<List<AddressModel>> getAllAddress();

  Future<AddressModel> updateAddress(String addressId, AddressRequest address);

  Future<AddressModel> addNewAddress(AddressRequest address);

  Future<void> removeAddress(String addressId);

  Future<CheckoutModel> checkout(CheckoutRequest request);

  Future<double> applyCoupon(String couponCode);

  Future<CoponsResponse> getCoupons();
}
