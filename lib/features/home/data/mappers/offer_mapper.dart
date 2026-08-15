import 'package:sooqy/features/home/data/models/offer_models/offer_model.dart';
import 'package:sooqy/features/home/domain/entities/offer.dart';
extension OfferMapper on OfferModel {
  Offer get toEntity => Offer(
    id: id,
    name: name,
    description: description,
    coverUrl: coverUrl,
    createdAt: createdAt,
  );
}
