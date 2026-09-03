import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/checkout/data/models/address_response/address_request.dart';
import 'package:sooqy/features/checkout/domain/entities/address.dart';
import 'package:sooqy/features/checkout/domain/repositories/checkout_repository.dart';

@lazySingleton
class UpdateAddress {
  final CheckoutRepository _repository;
  UpdateAddress(this._repository);
  Future<Either<Failure, Address>> call(
    String addressId,
    AddressRequest address,
  ) => _repository.updateAddress(addressId, address);
}
