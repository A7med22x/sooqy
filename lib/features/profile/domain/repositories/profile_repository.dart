import 'package:dartz/dartz.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/profile/domain/entities/order_data.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<OrderData>>> getOrders();
}
