import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/features/products/presentation/widgets/product_details_image.dart';
import 'package:sooqy/features/products/presentation/widgets/product_final_price.dart';
import 'package:sooqy/features/products/presentation/widgets/product_price_before_discount.dart';
import 'package:sooqy/features/products/presentation/widgets/product_rating.dart';
import 'package:sooqy/features/products/presentation/widgets/product_title_text.dart';

class ProductDatailsScreen extends StatelessWidget {
  const ProductDatailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProductDetailsImage(),
          SizedBox(height: 24.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  ProductTitleText(fontSize: 26.sp),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      ProductFinalPrice(
                        fontSize: 23.sp,
                        color: ColorManager.lightPrimaryColor,
                      ),
                      SizedBox(width: 8.w),
                      ProductPriceBeforeDiscount(fontSize: 19.sp),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Weight: 0.1 gm',
                    style: getBoldStyle(
                      color: ColorManager.lightPrimaryColor,
                      fontSize: 19.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      ProductRating(
                        fontSizeRating: 18.sp,
                        fontSizeReviews: 17.sp,
                        starRatingSize: 18.sp,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.review);
                        },
                        child: Text(
                          'Review',
                          style: getBoldStyle(
                            color: ColorManager.lightPrimaryColor,
                            fontSize: 16.sp,
                          ).copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Waterproof fitness tracker with heart rate monitor',
                    style: getRegularStyle(
                      color: ColorManager.greyColor,
                      fontSize: 18.sp,
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    prefixIcon: Icon(
                      Icons.add_shopping_cart,
                      color: ColorManager.white,
                      size: 22.0.sp,
                    ),
                    label: 'Add To Cart',
                    onTap: () {},
                    backgroundColor: ColorManager.primaryColor,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
