class CartItemModel {
  final String itemId;
  final String productId;
  final String productName;
  final String productCoverUrl;
  final num productStock;
  final num weightInGrams;
  final num basePricePerUnit;
  final num discountPercentage;
  final num finalPricePerUnit;
  final int quantity;
  final num totalPriceForItem;

  const CartItemModel({
    required this.itemId,
    required this.productId,
    required this.productName,
    required this.productCoverUrl,
    required this.productStock,
    required this.weightInGrams,
    required this.basePricePerUnit,
    required this.discountPercentage,
    required this.finalPricePerUnit,
    required this.quantity,
    required this.totalPriceForItem,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    itemId: json['itemId'],
    productId: json['productId'],
    productName: json['productName'],
    productCoverUrl: json['productCoverUrl'],
    productStock: json['productStock'],
    weightInGrams: (json['weightInGrams']),
    basePricePerUnit: (json['basePricePerUnit']),
    discountPercentage: (json['discountPercentage']),
    finalPricePerUnit: (json['finalPricePerUnit']),
    quantity: json['quantity'],
    totalPriceForItem: (json['totalPrice']),
  );
}
