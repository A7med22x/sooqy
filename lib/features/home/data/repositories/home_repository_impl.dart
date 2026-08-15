import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:sooqy/features/home/data/mappers/notification_mapper.dart';
import 'package:sooqy/features/home/data/mappers/offer_mapper.dart';
import 'package:sooqy/features/home/domain/entities/notification.dart';
import 'package:sooqy/features/home/domain/entities/offer.dart';
import 'package:sooqy/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Offer>>> getAllOffers() async {
    try {
      final response = await _remoteDataSource.getAllOffers();
      final offers = response.offers.items
          .map((offerModel) => offerModel.toEntity)
          .toList();
      return Right(offers);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, List<Notification>>> getAllNotifications() async {
    try {
      final response = await _remoteDataSource.getAllNotifications();
      final notifications = response.notifications.items
          .map((notificationModel) => notificationModel.toEntity)
          .toList();
      return Right(notifications);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> markNotificationAsRead({
    required String notiId,
  }) async {
    try {
      await _remoteDataSource.markNotificationAsRead(notiId: notiId);
      return Right(null);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> markAllNotificationsAsRead({
    required List<String> notiIds,
  }) async {
    try {
      await _remoteDataSource.markAllNotificationsAsRead(notiIds: notiIds);
      return Right(null);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }
}
