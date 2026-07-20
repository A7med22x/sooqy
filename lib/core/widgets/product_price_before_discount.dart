import 'package:flutter/widgets.dart';
import 'package:sooqy/core/resources/color_manager.dart';

class ProductPriceBeforeDiscount extends StatelessWidget {
  const ProductPriceBeforeDiscount({
    super.key,
    required this.fontSize
  });
final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      '1800.0 EGP', //"${product.price} ${S.of(context).egp}",
      style: TextStyle(
        fontSize: fontSize,//14
        color: ColorManager.greyColor,
        decoration: TextDecoration.lineThrough,
        decorationColor: ColorManager.greyColor,
      ),
    );
  }
}