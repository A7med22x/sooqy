import 'package:flutter/widgets.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.fontSize
  });
final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Fitness Tracker Z1', //product.getProductNameByLang(context),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: getBoldStyle(
        color: ColorManager.productColorDark,
        fontSize: fontSize,//16.sp
      ),
    );
  }
}