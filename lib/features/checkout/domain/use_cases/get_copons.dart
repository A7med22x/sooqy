import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/checkout/domain/entities/copon.dart';
import 'package:sooqy/features/checkout/domain/repositories/checkout_repository.dart';

@singleton
class GetCopons {
  final CheckoutRepository _repository;

  const GetCopons(this._repository);

  Future<Either<Failure, List<Copon>>> call() => _repository.getCoupons();
}
