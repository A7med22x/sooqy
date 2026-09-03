import 'copon_model.dart';

class CoponsResponse {
  List<CoponModel> coupons;

  CoponsResponse({required this.coupons});

  factory CoponsResponse.fromJson(Map<String, dynamic> json) {
    return CoponsResponse(
      coupons: (json['coupons'] as List<dynamic>?)
          ?.map((e) => CoponModel.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}
