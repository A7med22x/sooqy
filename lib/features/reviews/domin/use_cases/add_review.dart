import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sooqy/core/errors/failure.dart';
import 'package:sooqy/features/reviews/data/models/create_review_request.dart';
import 'package:sooqy/features/reviews/domin/repositories/review_repository.dart';

@lazySingleton
class AddReview {
  final ReviewRepository _repository;
  AddReview(this._repository);
  Future<Either<Failure, void>> call(CreateReviewRequest request) =>
      _repository.addReviewForProduct(request);
}
