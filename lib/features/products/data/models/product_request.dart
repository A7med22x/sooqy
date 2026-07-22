class ProductRequest {
  final String? searchTerm;
  final String? category;
  final num? minPrice;
  final num? maxPrice;
  final bool? isInStock;
  final String? sortBy;
  final String? sortOrder;
  final int page;
  final int pageSize;

  ProductRequest({
    this.searchTerm,
    this.category,
    this.minPrice,
    this.maxPrice,
    this.isInStock,
    this.sortBy,
    this.sortOrder,
    this.page = 1,
    this.pageSize = 20,
  });

  Map<String, dynamic> toJson() {
    return {
      "searchTerm": searchTerm,
      "category": category,
      "minPrice": minPrice,
      "maxPrice": maxPrice,
      "isInStock": isInStock,
      "sortBy": sortBy,
      "sortOrder": sortOrder,
      "page": page,
      "pageSize": pageSize,
    };
  }
}
