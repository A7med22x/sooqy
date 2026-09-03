import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/checkout/data/models/address_response/address_request.dart';
import 'package:sooqy/features/checkout/domain/entities/address.dart';
import 'package:sooqy/features/checkout/domain/repositories/checkout_repository.dart';

@singleton
class AddNewAddress {
  final CheckoutRepository _repository;

  const AddNewAddress(this._repository);

  Future<Either<Failure, Address>> call(AddressRequest request) =>
      _repository.addNewAddress(request);
}
