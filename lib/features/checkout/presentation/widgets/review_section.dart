import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/widgets/custom_text_field.dart';
import 'package:sooqy/features/checkout/presentation/widgets/address_review.dart';
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
         CouponCard(),
          const SizedBox(height: 12),

          Text("ملخص الطلب :", style: getBoldStyle(color: ColorManager.black, fontSize: 14)),
          const SizedBox(height: 12),

          ReviewCard(body: PriceReview()),
          const SizedBox(height: 12),
          ReviewCard(body: PaymentReview()),
          const SizedBox(height: 12),
          ReviewCard(body: AddressReview()),

          // SpaceV(5),
        ],
      ),
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

  bool isUsedSuccess = false;

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
          hint: 'ادخل كود الخصم',
          enabled: true,
          controller: couponCon,
          suffixIcon: TextButton(
                    onPressed: () {
                      
                    },
                    child: Text("تفعيل", style: getBoldStyle(color: ColorManager.primaryColor, fontSize: 16),),
                  ),
        );
  }
}
