class ProductModel {
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

  const ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      productCode: map['productCode'] as String,
      name: map['name'] as String,
      arabicName: map['arabicName'] as String,
      description: map['description'] as String,
      arabicDescription: map['arabicDescription'] as String,
      coverPictureUrl: map['coverPictureUrl'] as String,
      productPictures: List<String>.from(map['productPictures'] ?? []),
      price: map['price'] as num,
      stock: map['stock'] as num,
      weight: map['weight'] as num,
      color: map['color'] as String,
      discountPercentage: map['discountPercentage'] as num,
      rating: map['rating'] as num,
      reviewsCount: map['reviewsCount'] as int,
      sellerId: map['sellerId'] as String,
      categories: List<String>.from(map['categories']),
    );
  }
}
