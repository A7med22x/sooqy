import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';

class AddToCartFloatingButton extends StatelessWidget {
  const AddToCartFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 33.0.w,
      height: 33.0.h,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey.withValues(alpha: 0.3),
            spreadRadius: 1.r,
            blurRadius: 7.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.add_shopping_cart,
          color: ColorManager.grey,
          size: 22.0.sp,
        ),
      ),
    );
  }
}
