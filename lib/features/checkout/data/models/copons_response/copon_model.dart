class CoponModel {
  String id;
  String couponCode;
  String couponType;
  DateTime expiresAt;
  int usagesLeft;
  int timesUsed;
  int timesPerUser;
  double discountValue;
  double maxDiscount;

  CoponModel({
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

  factory CoponModel.fromJson(Map<String, dynamic> json) => CoponModel(
    id: json['id'] as String? ?? '',
    couponCode: json['couponCode'] as String? ?? '',
    couponType: json['couponType'] as String? ?? '',
    expiresAt: DateTime.parse(json['expiresAt'] as String),
    usagesLeft: json['usagesLeft'] as int? ?? 0,
    timesUsed: json['timesUsed'] as int? ?? 0,
    timesPerUser: json['timesPerUser'] as int? ?? 0,
    discountValue: json['discountValue'] as double? ?? 0.0,
    maxDiscount: json['maxDiscount'] as double? ?? 0.0,
  );
}
