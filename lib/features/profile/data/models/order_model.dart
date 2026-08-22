class OrderModel {
  String orderId;
  String orderCode;
  DateTime createdAt;
  DateTime updatedAt;
  String status;
  double totalPrice;
  String paymentMethod;

  OrderModel ({
    required this.orderId,
    required this.orderCode,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.totalPrice,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderId: json['orderId'] as String? ?? '',
    orderCode: json['orderCode'] as String? ?? '',
    createdAt: DateTime.parse(json['createdAt'] as String) ,
    updatedAt: DateTime.parse(json['updatedAt'] as String),
    status: json['status'] as String? ?? '',
    totalPrice: json['totalPrice'] as double? ?? 0.0,
    paymentMethod: json['paymentMethod'] as String? ?? '',
  );
}
