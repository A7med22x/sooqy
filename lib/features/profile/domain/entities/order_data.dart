class OrderData {
  String orderId;
  String orderCode;
  DateTime createdAt;
  DateTime updatedAt;
  String status;
  double totalPrice;
  String paymentMethod;

  OrderData({
    required this.orderId,
    required this.orderCode,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.totalPrice,
    required this.paymentMethod,
  });
}
