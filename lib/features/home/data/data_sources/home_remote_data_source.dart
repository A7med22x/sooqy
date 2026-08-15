import 'package:sooqy/features/home/data/models/notification_models/notification_response.dart';
import 'package:sooqy/features/home/data/models/offer_models/offer_response.dart';

abstract class HomeRemoteDataSource {
  Future<OfferResponse> getAllOffers();

  Future<NotificationResponse> getAllNotifications();

  Future<void> markNotificationAsRead({required String notiId});

  Future<void> markAllNotificationsAsRead({required List<String> notiIds});
}
