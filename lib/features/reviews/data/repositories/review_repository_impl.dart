import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/exceptions.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/reviews/data/data_sources/remote/review_remote_data_source.dart';
import 'package:sooqy/features/reviews/data/mappers/review_mappers.dart';
import 'package:sooqy/features/reviews/data/models/create_review_request.dart';
import 'package:sooqy/features/reviews/data/models/reviews_request.dart';
import 'package:sooqy/features/reviews/domin/entities/review.dart';
import 'package:sooqy/features/reviews/domin/repositories/review_repository.dart';

@LazySingleton(as: ReviewRepository)
class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewRemoteDataSource _remoteDataSource;
  ReviewRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Review>>> getProductReviewsById(
    ReviewsRequest request,
  ) async {
    try {
      final respose = await _remoteDataSource.getProductReviewsById(request);
      final reviews = respose.items
          .map((reviewModel) => reviewModel.toEntity)
          .toList();
      return Right(reviews);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> addReviewForProduct(
    CreateReviewRequest request,
  ) async {
    try {
      await _remoteDataSource.addReviewForProduct(request);
      return Right(null);
    } on AppException catch (exception) {
      return left(Failure(message: exception.message));
    }
  }
}
