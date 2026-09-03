import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/checkout/data/models/checkout_response/checkout_request.dart';
import 'package:sooqy/features/checkout/domain/entities/checkout_data.dart';
import 'package:sooqy/features/checkout/domain/repositories/checkout_repository.dart';

@lazySingleton
class Checkout {
  final CheckoutRepository _repository;

  Checkout(this._repository);

  Future<Either<Failure, CheckoutData>> call(CheckoutRequest request) {
    return _repository.checkout(request);
  }
}
