import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/utils/ui_utils.dart';
import 'package:sooqy/core/widgets/custom_text_field.dart';
import 'package:sooqy/core/widgets/error_indicator.dart';
import 'package:sooqy/core/widgets/loading_indicator.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_states.dart';
import 'package:sooqy/features/checkout/presentation/widgets/address_review.dart';
import 'package:sooqy/features/checkout/presentation/widgets/my_copon_card.dart';
import 'package:sooqy/features/checkout/presentation/widgets/payment_review.dart';
import 'package:sooqy/features/checkout/presentation/widgets/price_review.dart';
import 'package:sooqy/features/checkout/presentation/widgets/review_card.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => _showAddReviewDialog(context),
            child: Text(
              'Get Coupons',
              style: getBoldStyle(
                color: ColorManager.primaryColor,
                fontSize: 16,
              ),
            ),
          ),
          CouponCard(),
          const SizedBox(height: 12),

          Text(
            'Order Summary',
            style: getBoldStyle(color: ColorManager.black, fontSize: 16),
          ),
          const SizedBox(height: 12),

          ReviewCard(body: PriceReview()),
          const SizedBox(height: 12),
          ReviewCard(
            body: PaymentReview(
              paymentMethod: context
                  .read<CheckoutCubit>()
                  .selectedPaymentMethod!,
            ),
          ),
          const SizedBox(height: 12),
          ReviewCard(
            body: AddressReview(
              address: context.read<CheckoutCubit>().selectedAddress!,
            ),
          ),

          // SpaceV(5),
        ],
      ),
    );
  }

  Future<void> _showAddReviewDialog(BuildContext context) async {
    context.read<CheckoutCubit>().getCoupons();
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: MediaQuery.sizeOf(context).height * 0.7,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: BlocBuilder<CheckoutCubit, CheckoutState>(
                      builder: (context, state) {
                        if (state is GetCouponsLoading) {
                          return LoadingIndicator();
                        } else if (state is GetCouponsError) {
                          return ErrorIndicator(state.message);
                        } else if (state is GetCouponsSuccess) {
                          final coupons = state.coupons;
                          return coupons.isNotEmpty
                              ? ListView.builder(
                                  itemCount: coupons.length,
                                  itemBuilder: (context, index) =>
                                      MyCoponCard(copon: coupons[index]),
                                )
                              : Center(
                                  child: Text(
                                    'No coupons available',
                                    style: getBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CouponCard extends StatefulWidget {
  const CouponCard({super.key});

  @override
  State<CouponCard> createState() => _CouponCardState();
}

class _CouponCardState extends State<CouponCard> {
  late final TextEditingController couponCon;

  bool isApplyCouponSuccess = false;

  @override
  void initState() {
    super.initState();
    couponCon = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    couponCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      backgroundColor: ColorManager.greyColor.withAlpha(30),
      borderBackgroundColor: ColorManager.greyColor,
      hint: 'Enter discount code',
      enabled: true,
      controller: couponCon,
      suffixIcon: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          final cubit = context.read<CheckoutCubit>();
          if (state is ApplyCouponLoading) {
            return LoadingIndicator();
          }
          if (state is ApplyCouponError) {
             UIUtils.showMessage(state.message);
          }
          if (cubit.isCouponApplied) {
            return Text(
              'Active',
              style: getBoldStyle(
                color: ColorManager.primaryColor,
                fontSize: 16,
              ),
            );
          }
          return TextButton(
            onPressed: () async {
              await cubit.applyCoupon(
                couponCon.text.trim(),
              );
            },
            child: Text(
              'Apply',
              style: getBoldStyle(
                color: ColorManager.primaryColor,
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}
