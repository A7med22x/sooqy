import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';
import 'package:sooqy/features/products/presentation/widgets/add_to_cart_floating_button.dart';
import 'package:sooqy/features/products/presentation/widgets/product_final_price.dart';
import 'package:sooqy/features/products/presentation/widgets/product_price_before_discount.dart';
import 'package:sooqy/features/products/presentation/widgets/product_stock_indicator.dart';
import 'package:sooqy/features/products/presentation/widgets/product_title_rating_row.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final double priceDiscount =
        (product.price * (product.discountPercentage / 100));
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.productDetails, arguments: product);
      },
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: ColorManager.transparent,
          border: Border.all(color: ColorManager.gradiant1, width: 2.w),
        ),
        child: Column(
          mainAxisAlignment: .start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(
                    fit: .cover,
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    imageUrl: product.coverPictureUrl,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.image_not_supported_outlined, size: 50),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  left: 10.w,
                  child: AddToCartFloatingButton(),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            if (product.reviewsCount > 0)
            ProductTitleRatingRow(
              name: product.name,
              rating: product.rating.toStringAsFixed(1),
              reviwCount: product.reviewsCount.toString(),
            ),
            SizedBox(height: 5.h),
            if (product.discountPercentage > 0)
            Row(
              mainAxisAlignment: .start,
              children: [
                Expanded(
                  child: ProductPriceBeforeDiscount(
                    fontSize: 14.sp,
                    priceBeforeDiscount: product.price.toStringAsFixed(1),
                  ),
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
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: .start,
              children: [
                ProductFinalPrice(
                  fontSize: 15.sp,
                  color: ColorManager.black,
                  priceAfterDiscount:
                      (product.price - priceDiscount)
                          .toStringAsFixed(1),
                ),
              ],
            ),
            const Spacer(),
            ProductStockIndicator(stock: product.stock.toString()),
          ],
        ),
      ),
    );
  }
}
