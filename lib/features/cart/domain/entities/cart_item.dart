class CartItem {
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

  const CartItem({
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
}
