import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/features/cart/presentation/cubit/cart_cubit.dart';

class AddToCartFloatingButton extends StatelessWidget {
  const AddToCartFloatingButton({
    super.key,
    required this.productId,
    required this.stock,
  });

  final String productId;
  final int stock;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();

    final cartItem = cartCubit.cartList
        .where((item) => item.productId == productId)
        .firstOrNull;

    final quantity = cartItem?.quantity ?? 0;

    final canAdd = stock > 0 && quantity < stock;

    return InkWell(
      onTap: canAdd
          ? () {
              context.read<CartCubit>().addItem(productId);
            }
          : null,
      child: Container(
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
          child: cartCubit.isAdding(productId)
              ? Lottie.asset(AnimationsAssets.loading)
              : Icon(
                  Icons.add_shopping_cart,
                  color: ColorManager.grey,
                  size: 22.0.sp,
                ),
        ),
      ),
    );
  }
}
