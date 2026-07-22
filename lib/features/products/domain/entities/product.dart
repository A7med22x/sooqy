class Product {
  final String id;
  final String productCode;
  final String name;
  final String arabicName;
  final String description;
  final String arabicDescription;
  final String coverPictureUrl;
  final List<String> productPictures;
  final num price;
  final num stock;
  final num weight;
  final String color;
  final num discountPercentage;
  final num rating;
  final int reviewsCount;
  final String sellerId;
  final List<String> categories;

  const Product({
    required this.id,
    required this.productCode,
    required this.name,
    required this.arabicName,
    required this.description,
    required this.arabicDescription,
    required this.coverPictureUrl,
    required this.productPictures,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.discountPercentage,
    required this.rating,
    required this.reviewsCount,
    required this.sellerId,
    required this.categories,
  });
}
