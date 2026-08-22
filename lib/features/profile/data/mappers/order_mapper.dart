import 'package:sooqy/features/profile/data/models/order_model.dart';
import 'package:sooqy/features/profile/domain/entities/order_data.dart';

extension OrderMapper on OrderModel {
  OrderData get toEntity => OrderData(
    orderId: orderId,
    orderCode: orderCode,
    createdAt: createdAt,
    updatedAt: updatedAt,
    status: status,
    totalPrice: totalPrice,
    paymentMethod: paymentMethod,
  );
}
