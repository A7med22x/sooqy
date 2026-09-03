import 'package:dartz/dartz.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/checkout/data/models/address_response/address_request.dart';
import 'package:sooqy/features/checkout/data/models/checkout_response/checkout_request.dart';
import 'package:sooqy/features/checkout/domain/entities/address.dart';
import 'package:sooqy/features/checkout/domain/entities/checkout_data.dart';
import 'package:sooqy/features/checkout/domain/entities/copon.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, List<Address>>> getAllAddress();

  Future<Either<Failure, Address>> updateAddress(
    String addressId,
    AddressRequest address,
  );

  Future<Either<Failure, Address>> addNewAddress(AddressRequest address);

  Future<Either<Failure, void>> removeAddress(String addressId);

  Future<Either<Failure, CheckoutData>> checkout(CheckoutRequest request);

  Future<Either<Failure, double>> applyCoupon(String couponCode);

  Future<Either<Failure,  List<Copon>>> getCoupons();
}
