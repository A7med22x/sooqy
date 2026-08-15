class ReviewsRequest {
  final String productId;
  final int page;
  final int pageSize;

  ReviewsRequest({required this.productId, this.page = 1, this.pageSize = 20});

  Map<String, dynamic> toJson() {
    return {"productId": productId, "page": page, "pageSize": pageSize};
  }
}
