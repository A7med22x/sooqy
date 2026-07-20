import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/products/presentation/widgets/add_to_cart_floating_button.dart';
import 'package:sooqy/features/products/presentation/widgets/product_final_price.dart';
import 'package:sooqy/features/products/presentation/widgets/product_price_before_discount.dart';
import 'package:sooqy/features/products/presentation/widgets/product_stock_indicator.dart';
import 'package:sooqy/features/products/presentation/widgets/product_title_rating_row.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  imageUrl:
                      'https://t3.ftcdn.net/jpg/01/70/71/34/360_F_170713428_KgRrmdjyiRauJGAXJwVSqKlDXEO2YU8i.jpg',
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
          ProductTitleRatingRow(),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: .start,
            children: [
              Expanded(child: ProductPriceBeforeDiscount(fontSize: 14.sp,)),
              SizedBox(width: 4.w),
              AutoSizeText(
                '15% Discount',
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
              ProductFinalPrice(fontSize: 15.sp,color: ColorManager.black,),
            ],
          ),
          const Spacer(),
          ProductStockIndicator(),
        ],
      ),
    );
  }
}




