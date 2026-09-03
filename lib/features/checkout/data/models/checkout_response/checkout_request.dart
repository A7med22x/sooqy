class CheckoutRequest {
  final String? shippingAddressId;
  final String? paymentMethod;
  final String? couponCode;

  const CheckoutRequest({
    this.shippingAddressId,
    this.paymentMethod,
    this.couponCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'shippingAddressId': shippingAddressId,
      'paymentMethod': paymentMethod,
      'couponCode': couponCode,
    };
  }
}
