import 'package:sooqy/features/profile/data/models/order_model.dart';

class OrdersResponse {
  String message;
  List<OrderModel> orders;

  OrdersResponse({required this.message, required this.orders});

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return OrdersResponse(
      message: json['message'] as String? ?? '',
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => OrderModel.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}
