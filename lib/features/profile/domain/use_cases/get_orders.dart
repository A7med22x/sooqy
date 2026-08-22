import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/profile/domain/entities/order_data.dart';
import 'package:sooqy/features/profile/domain/repositories/profile_repository.dart';

@lazySingleton
class GetOrders {
  final ProfileRepository _repository;
  GetOrders(this._repository);
  Future<Either<Failure, List<OrderData>>> call() =>
      _repository.getOrders();
}
