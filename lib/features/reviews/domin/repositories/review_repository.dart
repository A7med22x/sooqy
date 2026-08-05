import 'package:dartz/dartz.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/reviews/data/models/create_review_request.dart';
import 'package:sooqy/features/reviews/data/models/reviews_request.dart';
import 'package:sooqy/features/reviews/domin/entities/review.dart';

abstract class ReviewRepository {
  Future<Either<Failure, List<Review>>> getProductReviewsById(ReviewsRequest request);

  Future<Either<Failure, void>> addReviewForProduct(CreateReviewRequest request);
}
