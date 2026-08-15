import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:sooqy/core/resources/color_manager.dart';

class ProductPriceBeforeDiscount extends StatelessWidget {
  const ProductPriceBeforeDiscount({
    super.key,
    required this.fontSize,
    required this.priceBeforeDiscount,
  });
  final double fontSize;
  final String priceBeforeDiscount;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      '$priceBeforeDiscount EGP',
      style: TextStyle(
        fontSize: fontSize, //14
        color: ColorManager.greyColor,
        decoration: TextDecoration.lineThrough,
        decorationColor: ColorManager.greyColor,
      ),
      maxLines: 1,
    );
  }
}
