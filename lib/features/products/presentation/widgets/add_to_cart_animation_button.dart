import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';

class AddToCartButtonWithAnimation extends StatefulWidget {
  const AddToCartButtonWithAnimation({super.key, required this.product});

  final Product product;

  @override
  State<AddToCartButtonWithAnimation> createState() =>
      _AddToCartButtonWithAnimationState();
}

class _AddToCartButtonWithAnimationState
    extends State<AddToCartButtonWithAnimation>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  bool isDone = false;

  Future<void> _addToCart() async {
    if (widget.product.stock <= 0) return;
    if (isLoading || isDone) return;

    final cartCubit = context.read<CartCubit>();

    final cartItem = cartCubit.cartList
        .where((item) => item.productId == widget.product.id)
        .firstOrNull;

    final quantity = cartItem?.quantity ?? 0;

    if (widget.product.stock <= 0) return;

    if (quantity >= widget.product.stock) return;

    setState(() {
      isLoading = true;
    });

    await cartCubit.addItem(widget.product.id);

    if (!mounted) return;

    setState(() {
      isLoading = false;
      isDone = true;
    });

    await Future.delayed(const Duration(milliseconds: 1000));

    if (!mounted) return;

    setState(() {
      isDone = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();

    final cartItem = cartCubit.cartList
        .where((item) => item.productId == widget.product.id)
        .firstOrNull;

    final quantity = cartItem?.quantity ?? 0;

    final canAdd = widget.product.stock > 0 && quantity < widget.product.stock;

    return SizedBox(
      height: 52.h,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: double.infinity,
            decoration: BoxDecoration(
              color: canAdd ? ColorManager.grey : ColorManager.primaryColor,
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(26.r),
                onTap: canAdd ? _addToCart : null,
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _buildButtonContent(canAdd),
                  ),
                ),
              ),
            ),
          ),

          if (quantity > 0 && !isLoading && !isDone)
            Positioned(
              right: 16.w,
              top: 0,
              bottom: 0,
              child: Center(
                child: CircleAvatar(
                  radius: 13.r,
                  backgroundColor: ColorManager.white,
                  child: Text(
                    quantity.toString(),
                    style: getSemiBoldStyle(
                      color: ColorManager.primaryColor,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildButtonContent(bool canAdd) {
    if (isLoading) {
      return SizedBox(
        key: const ValueKey('loading'),
        width: 24.w,
        height: 24.w,
        child: const CircularProgressIndicator(
          strokeWidth: 2.5,
          color: ColorManager.white,
        ),
      );
    }

    if (isDone) {
      return Icon(
        Icons.check,
        key: const ValueKey('done'),
        color: ColorManager.white,
        size: 26.sp,
      );
    }

    return Row(
      key: const ValueKey('idle'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add_shopping_cart, color: ColorManager.white, size: 22.sp),
        SizedBox(width: 8.w),
        Text(
          canAdd ? 'Add To Cart' : 'Out of Stock',
          style: getBoldStyle(color: ColorManager.white, fontSize: 16.sp),
        ),
      ],
    );
  }
}
