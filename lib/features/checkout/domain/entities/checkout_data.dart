class CheckoutData {
  final String message;
  final String unifiedCheckoutUrl;
  final String paymentClientSecret;

  const CheckoutData({
    required this.message,
    required this.unifiedCheckoutUrl,
    required this.paymentClientSecret,
  });
}
