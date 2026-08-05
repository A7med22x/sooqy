import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';
import 'package:sooqy/features/products/presentation/widgets/product_details_image.dart';
import 'package:sooqy/features/products/presentation/widgets/product_final_price.dart';
import 'package:sooqy/features/products/presentation/widgets/product_price_before_discount.dart';
import 'package:sooqy/features/products/presentation/widgets/product_rating.dart';
import 'package:sooqy/features/products/presentation/widgets/product_stock_indicator.dart';
import 'package:sooqy/features/products/presentation/widgets/product_title_text.dart';

class ProductDatailsScreen extends StatelessWidget {
  const ProductDatailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final double priceDiscount =
        (product.price * (product.discountPercentage / 100));
    return Scaffold(
      body: Column(
        children: [
          ProductDetailsImage(imageUrl: product.coverPictureUrl),
          SizedBox(height: 24.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  ProductTitleText(fontSize: 26.sp, name: product.name),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      ProductFinalPrice(
                        fontSize: 23.sp,
                        color: ColorManager.lightPrimaryColor,
                        priceAfterDiscount: (product.price - priceDiscount)
                            .toStringAsFixed(2),
                      ),
                      SizedBox(width: 8.w),
                      if (product.discountPercentage > 0)
                        Row(
                          children: [
                            ProductPriceBeforeDiscount(
                              fontSize: 19.sp,
                              priceBeforeDiscount: product.price
                                  .toStringAsFixed(2),
                            ),
                            SizedBox(width: 4.w),
                            AutoSizeText(
                              '${product.discountPercentage}% Discount',
                              style: getSemiBoldStyle(
                                color: ColorManager.lightPrimaryColor,
                                fontSize: 12.sp,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  if (product.weight > 0)
                    AutoSizeText(
                      'Weight: ${product.weight.toStringAsFixed(2)} gm',
                      style: getBoldStyle(
                        color: ColorManager.lightPrimaryColor,
                        fontSize: 19.sp,
                      ),
                      maxLines: 1,
                    ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      ProductRating(
                        fontSizeRating: 18.sp,
                        fontSizeReviews: 17.sp,
                        starRatingSize: 18.sp,
                        rating: product.rating.toStringAsFixed(2),
                        reviwCount: product.reviewsCount.toString(),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushNamed(Routes.review, arguments: product);
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
                  AutoSizeText(
                    product.description,
                    style: getRegularStyle(
                      color: ColorManager.greyColor,
                      fontSize: 18.sp,
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 8.h),
                  ProductStockIndicator(stock: product.stock.toString()),
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
