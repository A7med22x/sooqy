import 'package:sooqy/features/profile/domain/entities/order_data.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetOrdersLoading extends ProfileState {}

class GetOrdersSuccess extends ProfileState {
  final List<OrderData> orders;
  GetOrdersSuccess(this.orders);
}

class GetOrdersError extends ProfileState {
  final String message;
  GetOrdersError(this.message);
}
