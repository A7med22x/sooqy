import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({
    super.key,
    required this.fontSizeRating,
    required this.fontSizeReviews,
    required this.starRatingSize, required this.rating, required this.reviwCount,
  });
  final double fontSizeRating;
  final double fontSizeReviews;
  final double starRatingSize;
  final String rating;
  final String reviwCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(Icons.star, size: starRatingSize, color: ColorManager.secColor),
          SizedBox(width: 3.w),
          Text(
            rating,
            style: getLightStyle(
              color: ColorManager.backgroundDark,
              fontSize: fontSizeRating,
            ), //13.sp
          ),
          SizedBox(width: 3.w),
          Text(
            "($reviwCount)",
            style: getLightStyle(
              color: ColorManager.greyColor,
              fontSize: fontSizeReviews,
            ), //14.sp
          ),
          SizedBox(width: 3.w),
        ],
      ),
    );
  }
}
