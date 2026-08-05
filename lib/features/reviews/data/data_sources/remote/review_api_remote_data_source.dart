import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/constants.dart';
import 'package:sooqy/core/errors/error_helper.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/features/reviews/data/data_sources/remote/review_remote_data_source.dart';
import 'package:sooqy/features/reviews/data/models/create_review_request.dart';
import 'package:sooqy/features/reviews/data/models/reviews_request.dart';
import 'package:sooqy/features/reviews/data/models/reviews_response.dart';

@LazySingleton(as: ReviewRemoteDataSource)
class ReviewApiRemoteDataSource implements ReviewRemoteDataSource {
  final Dio _dio;

  ReviewApiRemoteDataSource(this._dio);

  @override
  Future<ReviewsResponse> getProductReviewsById(ReviewsRequest request) async {
    try {
      final response = await _dio.get(
        '${APIConstants.reviewsEndpoint}/${request.productId}',
        data: request.toJson(),
      );
      return ReviewsResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to Get Reviews');
    }
  }

  @override
  Future<void> addReviewForProduct(CreateReviewRequest request) async {
    try {
      await _dio.post(
        '${APIConstants.reviewsEndpoint}/${request.productId}',
        data: request.toJson(),
      );
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = ErrorHelper.getMessage(exception.response?.data);
      }
      throw RemoteException(message ?? 'Failed to add Review');
    }
  }
}
