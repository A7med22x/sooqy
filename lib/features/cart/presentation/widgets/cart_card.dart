import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/font_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/widgets/custom_auto_size_text.dart';
import 'package:sooqy/features/cart/domain/entities/cart_item.dart';
import 'package:sooqy/features/cart/presentation/cubit/cart_cubit.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    final canIncrease = cartItem.productStock > cartItem.quantity;

    return Container(
      height: 120,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.lightPrimaryColor, width: 2),
      ),
      child: Row(
        children: [
          Container(
            height: .infinity,
            width: 84,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorManager.lightPrimaryColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: cartItem.productCoverUrl,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.image_not_supported_outlined, size: 50),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAutoSizeText(
                  data: cartItem.productName,
                  textStyle: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s16,
                  ),
                  maxLines: 2,
                ),
                Text(
                  '${cartItem.weightInGrams} gm',
                  style: getRegularStyle(
                    color: ColorManager.secColor,
                    fontSize: FontSize.s14,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: canIncrease
                          ? () {
                              context.read<CartCubit>().addItem(
                                cartItem.productId,
                              );
                            }
                          : null,
                      radius: 12,
                      borderRadius: BorderRadius.circular(12),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: ColorManager.primaryColor,
                        child: cartCubit.isAdding(cartItem.productId)
                            ? Lottie.asset(AnimationsAssets.loading)
                            : const Icon(
                                Icons.add,
                                size: 18,
                                color: ColorManager.white,
                              ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '${cartItem.quantity}',
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        cartCubit.decreaseItem(cartItem.itemId);
                      },
                      radius: 12,
                      borderRadius: BorderRadius.circular(12),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: ColorManager.gradiant1,
                        child: cartCubit.isDecreasing(cartItem.itemId)
                            ? Lottie.asset(AnimationsAssets.loading)
                            : const Icon(
                                Icons.remove,
                                size: 18,
                                color: ColorManager.white,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  cartCubit.removeItem(cartItem.itemId);
                },
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: cartCubit.isRemoving(cartItem.itemId)
                      ? Lottie.asset(AnimationsAssets.loading)
                      : SvgPicture.asset(IconsAssets.trash),
                ),
              ),
              const Spacer(),
              Text(
                '${cartItem.quantity * cartItem.basePricePerUnit} EGP',
                style:
                    getSemiBoldStyle(
                      color: ColorManager.gradiant2,
                      fontSize: FontSize.s16,
                    ).copyWith(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: ColorManager.gradiant2,
                    ),
              ),
              Text(
                '${cartItem.totalPriceForItem.toStringAsFixed(2)} EGP',
                style: getBoldStyle(
                  color: ColorManager.secColor,
                  fontSize: FontSize.s20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
