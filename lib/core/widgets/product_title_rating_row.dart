import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/widgets/product_rating.dart';
import 'package:sooqy/core/widgets/product_title_text.dart';

class ProductTitleRatingRow extends StatelessWidget {
  const ProductTitleRatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: ProductTitleText(fontSize: 16.sp)),
        ProductRating(fontSizeRating: 13.sp, fontSizeReviews: 14.sp,starRatingSize: 14.sp,),
      ],
    );
  }
}
