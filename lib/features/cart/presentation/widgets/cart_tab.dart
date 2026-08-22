import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/utils/ui_utils.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/core/widgets/error_indicator.dart';
import 'package:sooqy/core/widgets/loading_indicator.dart';
import 'package:sooqy/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:sooqy/features/cart/presentation/cubit/cart_states.dart';
import 'package:sooqy/features/cart/presentation/widgets/cart_card.dart';
import 'package:sooqy/features/cart/presentation/widgets/empty_cart.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (BuildContext context, CartState state) {
        if (state is AddItemToCartLoading ||
            state is DecreaseItemInCartLoading ||
            state is RemoveItemFromCartLoading) {
        } else if (state is AddItemToCartSuccess ||
            state is DecreaseItemInCartSuccess ||
            state is RemoveItemFromCartSuccess) {
        } else if (state is AddItemToCartError) {
          UIUtils.showMessage(state.message);
        } else if (state is DecreaseItemInCartError) {
          UIUtils.showMessage(state.message);
        } else if (state is RemoveItemFromCartError) {
          UIUtils.showMessage(state.message);
        }
      },
      builder: (_, state) {
        final cartCubit = context.read<CartCubit>();
        final items = cartCubit.cartList;
        final totalPrice = cartCubit.totalPrice.toStringAsFixed(2);
        final count = cartCubit.totalCount;

        return Column(
          crossAxisAlignment: .center,
          children: [
            Text('Cart', style: getBoldStyle(color: ColorManager.black)),
            Container(
              color: ColorManager.border,
              width: .infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  'You have $count products in your cart',
                  style: getRegularStyle(color: ColorManager.green),
                ),
              ),
            ),
            Expanded(child: _buildCartList(state, items)),
            CustomElevatedButton(
              label: 'Checkout $totalPrice EGP',
              onTap: () {
                Navigator.of(context).pushNamed(Routes.checkout);
              },
              isStadiumBorder: false,
              outerPadding: const EdgeInsets.all(16),
              backgroundColor: (items.isEmpty)
                  ? null
                  : ColorManager.primaryColor,
            ),
          ],
        );
      },
    );
  }

  Widget _buildCartList(CartState state, List items) {
    if (state is GetCartLoading) {
      return const LoadingIndicator();
    } else if (state is GetCartError) {
      return ErrorIndicator(state.message);
    } else {
      return items.isEmpty
          ? const EmptyCart()
          : ListView.separated(
              itemBuilder: (_, index) => CartCard(cartItem: items[index]),
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemCount: items.length,
            );
    }
  }
}
