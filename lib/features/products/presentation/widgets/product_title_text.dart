import 'package:flutter/widgets.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.fontSize,
    required this.name,
  });
  final double fontSize;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: getBoldStyle(
        color: ColorManager.productColorDark,
        fontSize: fontSize,
      ),
    );
  }
}
