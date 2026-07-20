import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/features/products/presentation/widgets/product_rating.dart';
import 'package:sooqy/features/products/presentation/widgets/product_title_text.dart';

class ProductTitleRatingRow extends StatelessWidget {
  const ProductTitleRatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductTitleText(fontSize: 12.sp),
            SizedBox(width: 4.w),
            ProductRating(fontSizeRating: 13.sp, fontSizeReviews: 14.sp,starRatingSize: 14.sp,),
          ],
        ),
      ],
    );
  }
}
