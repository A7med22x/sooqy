import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class ProductStockIndicator extends StatelessWidget {
  const ProductStockIndicator({super.key, required this.stock});
  final String stock; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      padding:  EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorManager.secColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: AutoSizeText(
        '$stock Pieces Available',
        textAlign: .center,
        style: getSemiBoldStyle(color: ColorManager.white),
        maxLines: 1,
      ),
    );
  }
}
