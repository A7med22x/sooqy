import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/features/home/domain/use_cases/get_notifications.dart';
import 'package:sooqy/features/home/domain/use_cases/get_offers.dart';
import 'package:sooqy/features/home/domain/use_cases/read_all_notification.dart';
import 'package:sooqy/features/home/domain/use_cases/read_notification.dart';
import 'package:sooqy/features/home/presentation/cubit/home_states.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetOffers _getOffers;
  final GetNotifications _getNotifications;
  final ReadNotification _readNotification;
  final ReadAllNotification _readAllNotifications;

  HomeCubit(
    this._getOffers,
    this._getNotifications,
    this._readNotification,
    this._readAllNotifications,
  ) : super(HomeInitial());

  Future<void> getOffers() async {
    emit(GetOffersLoading());
    final result = await _getOffers();
    result.fold(
      (failure) => emit(GetOffersError(failure.message)),
      (offers) => emit(GetOffersSuccess(offers)),
    );
  }

  Future<void> getNotifications() async {
    emit(GetNotificationsLoading());
    final result = await _getNotifications();
    result.fold(
      (failure) => emit(GetNotificationsError(failure.message)),
      (notifications) => emit(GetNotificationsSuccess(notifications)),
    );
  }

  Future<void> readNotification(String notificationId) async {
    await _readNotification(notificationId);
  }

  Future<void> readAllNotifications(List<String> notificationIds) async {
    await _readAllNotifications(notificationIds);
  }
}
