import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_cubit.dart';

class PriceReview extends StatelessWidget {
  const PriceReview({super.key});

  @override
  Widget build(BuildContext context) {
    final price = context.read<CartCubit>().totalPrice;
    final delivery = 50.00;
    final discount = context.read<CheckoutCubit>().discount ?? 0.00;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: getRegularStyle(
                color: ColorManager.greyColor,
                fontSize: 16,
              ),
            ),
            Text(
              '${price.toStringAsFixed(2)} EGP',
              style: getSemiBoldStyle(
                color: ColorManager.greyColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery",
              style: getRegularStyle(
                color: ColorManager.greyColor,
                fontSize: 16,
              ),
            ),
            Text(
              "${delivery.toStringAsFixed(2)} EGP",
              style: getRegularStyle(
                color: ColorManager.greyColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Discount',
              style: getRegularStyle(
                color: ColorManager.greyColor,
                fontSize: 16,
              ),
            ),
            Text(
              discount == 0.00
                  ? 'No discount'
                  : '${discount.toStringAsFixed(2)} EGP',
              style: getRegularStyle(
                color: ColorManager.greyColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const Divider(indent: 30, endIndent: 30, color: Color(0xffCACECE)),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: getBoldStyle(color: ColorManager.black, fontSize: 16),
            ),
            Text(
              "${(price + delivery - discount).toStringAsFixed(2)} EGP",
              style: getBoldStyle(color: ColorManager.black, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
