import 'package:sooqy/features/cart/data/models/cart_item_model.dart';
import 'package:sooqy/features/cart/domain/entities/cart_item.dart';

extension CartItemMapper on CartItemModel {
  CartItem get toEntity => CartItem(
    itemId: itemId,
    productId: productId,
    productName: productName,
    productCoverUrl: productCoverUrl,
    productStock: productStock,
    weightInGrams: weightInGrams,
    basePricePerUnit: basePricePerUnit,
    discountPercentage: discountPercentage,
    finalPricePerUnit: finalPricePerUnit,
    quantity: quantity,
    totalPriceForItem: totalPriceForItem,
  );
}
