import 'package:sooqy/features/home/domain/entities/notification.dart';
import 'package:sooqy/features/home/domain/entities/offer.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetOffersLoading extends HomeState {}

class GetOffersSuccess extends HomeState {
  final List<Offer> offers;
  GetOffersSuccess(this.offers);
}

class GetOffersError extends HomeState {
  final String message;
  GetOffersError(this.message);
}

class GetNotificationsLoading extends HomeState {}

class GetNotificationsSuccess extends HomeState {
  final List<Notification> notifications;
  GetNotificationsSuccess(this.notifications);
}

class GetNotificationsError extends HomeState {
  final String message;
  GetNotificationsError(this.message);
}
