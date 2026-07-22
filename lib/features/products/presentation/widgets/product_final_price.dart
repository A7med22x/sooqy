import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class ProductFinalPrice extends StatelessWidget {
  const ProductFinalPrice({
    super.key,
    required this.fontSize,
    required this.color,
    required this.priceAfterDiscount,
  });
  final double fontSize;
  final Color color;
  final String priceAfterDiscount;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      priceAfterDiscount,
      style: getBoldStyle(color: color, fontSize: fontSize),
      maxLines: 1,
    );
  }
}
