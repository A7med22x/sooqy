import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/core/errors/error_helper.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/features/products/data/models/product_request.dart';
import 'package:sooqy/features/products/data/models/products_response.dart';
import 'package:sooqy/features/products/data/data_sources/products_remote_data_source.dart';

@LazySingleton(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final Dio _dio;
  const ProductsRemoteDataSourceImpl(this._dio);
  @override
  Future<ProductsResponse> getProducts(ProductRequest request) async {
    try {
      final response = await _dio.get(
        APIConstants.productsEndpoint,
        data: request.toJson(),
      );
      return ProductsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed To Get Products');
    }
  }
}
