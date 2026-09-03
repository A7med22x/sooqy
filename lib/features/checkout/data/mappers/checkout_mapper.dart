import 'package:sooqy/features/checkout/data/models/checkout_response/checkout_model.dart';
import 'package:sooqy/features/checkout/domain/entities/checkout_data.dart';

extension CheckoutMapper on CheckoutModel {
  CheckoutData get toEntity => CheckoutData(
    paymentClientSecret: paymentClientSecret,
    unifiedCheckoutUrl: unifiedCheckoutUrl,
    message: message,
  );
}
