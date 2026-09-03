import 'package:sooqy/features/profile/data/models/orders_response.dart';

abstract class ProfileRemoteDataSource {
  Future<OrdersResponse> getOrders();
}
