import 'package:sooqy/features/products/domain/entities/product.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class GetProductsLoading extends ProductState {}

class GetProductsSuccess extends ProductState {
  final List<Product> products;
  GetProductsSuccess(this.products);
}

class GetProductsError extends ProductState {
  final String message;
  GetProductsError(this.message);
}
