import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/checkout/domain/entities/address.dart';
import 'package:sooqy/features/checkout/domain/repositories/checkout_repository.dart';

@singleton
class GetAddresses {
  final CheckoutRepository _repository;

  const GetAddresses(this._repository);

  Future<Either<Failure, List<Address>>> call() => _repository.getAllAddress();
}
