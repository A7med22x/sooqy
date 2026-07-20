import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
    required this.fontSizeRating,
    required this.fontSizeReviews,
    required this.starRatingSize
  });
final double fontSizeRating;
final double fontSizeReviews;
final double starRatingSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.backgroundColor,
        // color: Theme.of(context).brightness == Brightness.dark
        //     ? const Color.fromARGB(255, 67, 67, 67)
        //     : const Color.fromARGB(255, 239, 240, 239),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
           Icon(Icons.star, size: starRatingSize, color: ColorManager.secColor),
           SizedBox(width: 3.w),
          Text(
            '3.0',//product.rating.toStringAsFixed(1),
            style: getLightStyle(color: ColorManager.backgroundDark,fontSize: fontSizeRating),//13.sp
          ),
           SizedBox(width: 3.w),
          Text(
            '(1)',//"(${product.reviewsCount})",
            style: getLightStyle(color: ColorManager.greyColor,fontSize: fontSizeReviews),//14.sp
          ),
           SizedBox(width: 3.w),
        ],
      ),
    );
  }
}