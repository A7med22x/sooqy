class CreateReviewRequest {
  final String? comment;
  final String productId;
  final int rating;

  CreateReviewRequest({
    this.comment,
    required this.productId,
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return {"comment": comment, "productId": productId, "rating": rating};
  }
}
