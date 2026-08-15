import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/home/domain/entities/offer.dart';
import 'package:sooqy/features/home/domain/repositories/home_repository.dart';

@lazySingleton
class GetOffers {
  final HomeRepository _repository;
  GetOffers(this._repository);
  Future<Either<Failure, List<Offer>>> call() =>
      _repository.getAllOffers();
}
