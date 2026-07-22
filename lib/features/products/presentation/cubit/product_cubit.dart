import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/features/products/data/models/product_request.dart';
import 'package:sooqy/features/products/domain/use_cases/get_products.dart';
import 'package:sooqy/features/products/presentation/cubit/product_states.dart';

@lazySingleton
class ProductCubit extends Cubit<ProductState> {
  final GetProducts _getProducts;
  ProductCubit(this._getProducts) : super(ProductInitial());

  Future<void> getProducts(ProductRequest request) async {
    emit(GetProductsLoading());
    final result = await _getProducts(request);
    result.fold(
      (failure) => emit(GetProductsError(failure.message)),
      (products) => emit(GetProductsSuccess(products)),
    );
  }
}
