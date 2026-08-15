import 'offers.dart';

class OfferResponse {
  Offers offers;

  OfferResponse({ required this.offers});

  factory OfferResponse.fromJson(Map<String, dynamic> json) => OfferResponse(
    offers: Offers.fromJson(json['offers'] as Map<String, dynamic>),
  );
}
