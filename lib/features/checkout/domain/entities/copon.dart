class Copon {
  String id;
  String couponCode;
  String couponType;
  DateTime expiresAt;
  int usagesLeft;
  int timesUsed;
  int timesPerUser;
  double discountValue;
  double maxDiscount;

  Copon({
    required this.id,
    required this.couponCode,
    required this.couponType,
    required this.expiresAt,
    required this.usagesLeft,
    required this.timesUsed,
    required this.timesPerUser,
    required this.discountValue,
    required this.maxDiscount,
  });
}
