import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:sooqy/features/profile/data/mappers/order_mapper.dart';
import 'package:sooqy/features/profile/domain/entities/order_data.dart';
import 'package:sooqy/features/profile/domain/repositories/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _dataSource;

  ProfileRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, List<OrderData>>> getOrders() async {
    try {
      final respose = await _dataSource.getOrders();
      final orders = respose.orders
          .map((orderModel) => orderModel.toEntity)
          .toList();
      return Right(orders);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }
}
