import 'package:sooqy/features/checkout/data/models/copons_response/copon_model.dart';
import 'package:sooqy/features/checkout/domain/entities/copon.dart';

extension CoponMapper on CoponModel {
  Copon get toEntity => Copon(
    id: id,
    couponCode: couponCode,
    couponType: couponType,
    expiresAt: expiresAt,
    usagesLeft: usagesLeft,
    timesUsed: timesUsed,
    timesPerUser: timesPerUser,
    discountValue: discountValue,
    maxDiscount: maxDiscount,
  );
}
