import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/features/reviews/data/models/create_review_request.dart';
import 'package:sooqy/features/reviews/data/models/reviews_request.dart';
import 'package:sooqy/features/reviews/domin/entities/review.dart';
import 'package:sooqy/features/reviews/domin/use_cases/add_review.dart';
import 'package:sooqy/features/reviews/domin/use_cases/get_reviews.dart';
import 'package:sooqy/features/reviews/presentation/cubit/review_states.dart';

@lazySingleton
class ReviewCubit extends Cubit<ReviewState> {
  final GetReviews _getReviews;
  final AddReview _addReview;

  ReviewCubit(this._getReviews, this._addReview) : super(ReviewInitial());

  final List<Review> _reviews = [];

  int _page = 1;
  bool _isLoadingMore = false;
  bool _hasReachedEnd = false;
  String? _productId;

  List<Review> get reviews => List.unmodifiable(_reviews);

  Future<void> loadReviews(String productId) async {
    _productId = productId;
    _page = 1;
    _hasReachedEnd = false;
    _reviews.clear();

    emit(GetReviewsLoading());

    await loadMore();
  }

  Future<void> refresh() async {
    if (_productId == null) return;
    await loadReviews(_productId!);
  }

  Future<void> loadMore() async {
    if (_productId == null) return;

    if (_isLoadingMore || _hasReachedEnd) return;

    _isLoadingMore = true;

    final result = await _getReviews(
      ReviewsRequest(productId: _productId!, page: _page),
    );

    result.fold(
      (failure) {
        emit(GetReviewsError(failure.message));
      },
      (newReviews) {
        if (newReviews.isEmpty) {
          _hasReachedEnd = true;
        } else {
          _page++;

          for (final review in newReviews) {
            if (!_reviews.any((e) => e.userName == review.userName)) {
              _reviews.add(review);
            }
          }
        }

        emit(GetReviewsSuccess(List.unmodifiable(_reviews)));
      },
    );

    _isLoadingMore = false;
  }

  Future<void> addReview(CreateReviewRequest request) async {
    emit(AddReviewLoading());

    final result = await _addReview(request);

    result.fold((failure) => emit(AddReviewError(failure.message)), (_) async {
      emit(AddReviewSuccess());

      await refresh();
    });
  }
}
