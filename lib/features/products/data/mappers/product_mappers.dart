import 'package:sooqy/features/products/domain/entities/product.dart';
import 'package:sooqy/features/products/data/models/product_model.dart';

extension ProductMappers on ProductModel {
  Product get toEntity => Product(
    id: id,
    productCode: productCode,
    name: name,
    arabicName: arabicName,
    description: description,
    arabicDescription: arabicDescription,
    coverPictureUrl: coverPictureUrl,
    productPictures: productPictures,
    price: price,
    stock: stock,
    weight: weight,
    color: color,
    discountPercentage: discountPercentage,
    rating: rating,
    reviewsCount: reviewsCount,
    sellerId: sellerId,
    categories: categories,
  );
}
