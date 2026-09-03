import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/checkout/domain/repositories/checkout_repository.dart';

@singleton
class RemoveAddress {
  final CheckoutRepository _repository;

  const RemoveAddress(this._repository);

  Future<Either<Failure, void>> call(String addressId) =>
      _repository.removeAddress(addressId);
}
