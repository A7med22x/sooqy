import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/reviews/data/models/reviews_request.dart';
import 'package:sooqy/features/reviews/domin/entities/review.dart';
import 'package:sooqy/features/reviews/domin/repositories/review_repository.dart';

@lazySingleton
class GetReviews {
  final ReviewRepository _repository;
  GetReviews(this._repository);
  Future<Either<Failure, List<Review>>> call(ReviewsRequest request) =>
      _repository.getProductReviewsById(request);
}
