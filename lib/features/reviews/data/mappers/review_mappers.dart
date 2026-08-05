import 'package:sooqy/features/reviews/data/models/review_model.dart';
import 'package:sooqy/features/reviews/domin/entities/review.dart';

extension ReviewMappers on ReviewModel {
  Review get toEntity => Review(
    comment: comment,
    rating: rating,
    createdAt: createdAt,
    userName: userName,
    userPicture: userPicture,
  );
}
