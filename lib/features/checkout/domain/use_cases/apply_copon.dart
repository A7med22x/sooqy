import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/checkout/domain/repositories/checkout_repository.dart';

@singleton
class ApplyCopon {
  final CheckoutRepository _repository;

  const ApplyCopon(this._repository);

  Future<Either<Failure, double>> call(String couponCode) => _repository.applyCoupon(couponCode);
}
