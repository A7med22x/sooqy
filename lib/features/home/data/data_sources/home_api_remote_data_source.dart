import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/core/errors/error_helper.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:sooqy/features/home/data/models/notification_models/notification_response.dart';
import 'package:sooqy/features/home/data/models/offer_models/offer_response.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeApiRemoteDataSource implements HomeRemoteDataSource {
  final Dio _dio;

  HomeApiRemoteDataSource(this._dio);

  @override
  Future<OfferResponse> getAllOffers() async {
    try {
      final response = await _dio.get(
        '${APIConstants.offersEndpoint}?pageSize=100',
      );
      return OfferResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to Get Offers');
    }
  }

  @override
  Future<NotificationResponse> getAllNotifications() async {
    try {
      final response = await _dio.get(
        '${APIConstants.notificationsEndpoint}?includeRead=true&page=1&pageSize=20',
      );
      return NotificationResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to Get Notifications');
    }
  }

  @override
  Future<void> markNotificationAsRead({required String notiId}) async {
    try {
      await _dio.post('${APIConstants.notificationsEndpoint}/$notiId/read');
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to mark Notification as Read');
    }
  }

  @override
  Future<void> markAllNotificationsAsRead({required List<String> notiIds}) async {
    try {
      await _dio.post(
        '${APIConstants.notificationsEndpoint}/bulk-read',
        data: {'notificationIds': notiIds},
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to mark all Notifications as Read');
    }
  }
}
