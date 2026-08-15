import 'offer_model.dart';

class Offers {
  List<OfferModel> items;
  int? page;
  int? pageSize;
  int? totalCount;
  bool? hasNextPage;
  bool? hasPreviousPage;

  Offers({
    required this.items,
    this.page,
    this.pageSize,
    this.totalCount,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
        .toList() ??
        [],
    page: json['page'] as int?,
    pageSize: json['pageSize'] as int?,
    totalCount: json['totalCount'] as int?,
    hasNextPage: json['hasNextPage'] as bool?,
    hasPreviousPage: json['hasPreviousPage'] as bool?,
  );
}
