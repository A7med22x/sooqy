import 'package:injectable/injectable.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/core/errors/error_helper.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:sooqy/features/profile/data/models/orders_response.dart';
import 'package:dio/dio.dart';

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileApiRemoteDataSource implements ProfileRemoteDataSource {
  final Dio _dio;

  ProfileApiRemoteDataSource(this._dio);

  @override
  Future<OrdersResponse> getOrders() async {
    try {
      final response = await _dio.get(
        '${APIConstants.getOrdersEndpoint}/?limit=10',
      );
      return OrdersResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed To Get Orders');
    }
  }
}
