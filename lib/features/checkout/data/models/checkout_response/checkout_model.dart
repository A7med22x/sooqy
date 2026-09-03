class CheckoutModel {
  final String message;
  final String unifiedCheckoutUrl;
  final String paymentClientSecret;

  const CheckoutModel({
    required this.message,
    required this.unifiedCheckoutUrl,
    required this.paymentClientSecret,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) {
    return CheckoutModel(
      message: json['message'] ?? '',
      unifiedCheckoutUrl: json['unifiedCheckoutUrl'] ?? '',
      paymentClientSecret: json['paymentClientSecret'] ?? '',
    );
  }
}
