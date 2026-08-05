import 'package:sooqy/features/reviews/domin/entities/review.dart';

abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class GetReviewsLoading extends ReviewState {}

class GetReviewsSuccess extends ReviewState {
  final List<Review> reviews;
  GetReviewsSuccess(this.reviews);
}

class GetReviewsError extends ReviewState {
  final String message;
  GetReviewsError(this.message);
}

class AddReviewLoading extends ReviewState {}

class AddReviewSuccess extends ReviewState {}

class AddReviewError extends ReviewState {
  final String message;
  AddReviewError(this.message);
}
