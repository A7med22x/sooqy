import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/checkout/data/data_sources/checkout_data_sourse.dart';
import 'package:sooqy/features/checkout/data/mappers/address_mapper.dart';
import 'package:sooqy/features/checkout/data/mappers/checkout_mapper.dart';
import 'package:sooqy/features/checkout/data/mappers/copon_mapper.dart';
import 'package:sooqy/features/checkout/data/models/address_response/address_request.dart';
import 'package:sooqy/features/checkout/data/models/checkout_response/checkout_request.dart';
import 'package:sooqy/features/checkout/domain/entities/address.dart';
import 'package:sooqy/features/checkout/domain/entities/checkout_data.dart';
import 'package:sooqy/features/checkout/domain/entities/copon.dart';
import 'package:sooqy/features/checkout/domain/repositories/checkout_repository.dart';

@LazySingleton(as: CheckoutRepository)
class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutDataSourse _dataSourse;

  CheckoutRepositoryImpl(this._dataSourse);

  @override
  Future<Either<Failure, List<Address>>> getAllAddress() async {
    try {
      final response = await _dataSourse.getAllAddress();
      final addresses = response
          .map((addressModel) => addressModel.toEntity)
          .toList();
      return Right(addresses);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, Address>> addNewAddress(AddressRequest address) async {
    try {
      final response = await _dataSourse.addNewAddress(address);
      return Right(response.toEntity);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, Address>> updateAddress(
    String addressId,
    AddressRequest address,
  ) async {
    try {
      final response = await _dataSourse.updateAddress(addressId, address);
      return Right(response.toEntity);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> removeAddress(String addressId) async {
    try {
      await _dataSourse.removeAddress(addressId);
      return const Right(null);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, CheckoutData>> checkout(
    CheckoutRequest request,
  ) async {
    try {
      final response = await _dataSourse.checkout(request);

      return Right(response.toEntity);
    } on AppException catch (exception) {
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, List<Copon>>> getCoupons() async {
    try {
      final response = await _dataSourse.getCoupons();
      final coupons = response.coupons
          .map((coponModel) => coponModel.toEntity)
          .toList();
      return Right(coupons);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, double>> applyCoupon(
    String couponCode,
  ) async {
    try {
      final response = await _dataSourse.applyCoupon(couponCode);
      return Right(response);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }
}
