
import 'package:flutter/widgets.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
class ProductFinalPrice extends StatelessWidget {
  const ProductFinalPrice({
    super.key,
    required this.fontSize,
    required this.color
  });
final double fontSize;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      '5000.0 EGP',
      style: getBoldStyle(color: color,  fontSize: fontSize),
    );
  }
}