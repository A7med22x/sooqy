import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/core/errors/error_helper.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/features/categories/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:sooqy/features/categories/data/models/categories_response.dart';

@LazySingleton(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final Dio _dio;
  const CategoriesRemoteDataSourceImpl(this._dio);
  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await _dio.get(APIConstants.categoriesEndpoint);
      return CategoriesResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed To Get Categories');
    }
  }
}
