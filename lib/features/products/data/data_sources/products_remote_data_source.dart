import 'package:sooqy/features/products/data/models/product_request.dart';
import 'package:sooqy/features/products/data/models/products_response.dart';

abstract class ProductsRemoteDataSource {
  Future<ProductsResponse> getProducts(ProductRequest request);
}
