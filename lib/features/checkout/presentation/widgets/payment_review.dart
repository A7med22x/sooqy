import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class PaymentReview extends StatelessWidget {
  const PaymentReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "وسيلة الدفع",
                  style: getBoldStyle(color: ColorManager.black, fontSize: 14),
                ),
                const SizedBox(height: 12),
                Text(
                  "دفع عند الاستلام",
                  style: getRegularStyle(
                    color: ColorManager.greyColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Transform.scale(
              scale: .9,
              child: SvgPicture.asset(SvgAssets.paypal, width: 60),
            ),
          ],
        ),
      ],
    );
  }
}
