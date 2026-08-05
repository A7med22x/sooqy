import 'package:sooqy/features/reviews/data/models/review_model.dart';

class ReviewsResponse {
  final List<ReviewModel> items;
  final int page;
  final int pageSize;
  final int totalCount;
  final bool hasNextPage;
  final bool hasPreviousPage;
  final double? averageRating;
  final int? reviewsCount;
  final String? message;

  const ReviewsResponse({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.averageRating,
    this.reviewsCount,
    this.message,
  });

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) {
    return ReviewsResponse(
      items: (json['reviews']['items'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['reviews']['page'] as num?)?.toInt() ?? 1,
      pageSize: (json['reviews']['pageSize'] as num?)?.toInt() ?? 10,
      totalCount: (json['reviews']['totalCount'] as num?)?.toInt() ?? 0,
      hasNextPage: json['reviews']['hasNextPage'] ?? false,
      hasPreviousPage: json['reviews']['hasPreviousPage'] ?? false,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      reviewsCount: (json['reviewsCount'] as num?)?.toInt(),
      message: json['message'],
    );
  }
}
