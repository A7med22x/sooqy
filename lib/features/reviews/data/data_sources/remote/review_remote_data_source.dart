import 'package:sooqy/features/reviews/data/models/create_review_request.dart';
import 'package:sooqy/features/reviews/data/models/reviews_request.dart';
import 'package:sooqy/features/reviews/data/models/reviews_response.dart';

abstract class ReviewRemoteDataSource {
  Future<ReviewsResponse> getProductReviewsById(ReviewsRequest request);
  
  Future<void> addReviewForProduct(CreateReviewRequest request);
}
