import 'package:dartz/dartz.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/home/domain/entities/notification.dart';
import 'package:sooqy/features/home/domain/entities/offer.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Offer>>> getAllOffers();

  Future<Either<Failure, List<Notification>>> getAllNotifications();

  Future<Either<Failure, void>> markNotificationAsRead({
    required String notiId,
  });

  Future<Either<Failure, void>> markAllNotificationsAsRead({
    required List<String> notiIds,
  });
}
