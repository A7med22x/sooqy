import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/checkout/domain/entities/copon.dart';

class MyCoponCard extends StatelessWidget {
  const MyCoponCard({super.key, required this.copon});

  final Copon copon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorManager.grey.withValues(alpha: 0.1),
        border: Border.all(color: ColorManager.gradiant2, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Coupon Code : ${copon.couponCode}',
            style: getBoldStyle(color: ColorManager.black, fontSize: 16),
            maxLines: 1,
          ),
          AutoSizeText(
            "ExpiresAt: ${copon.expiresAt.toString().split(' ').first}",
            style: getRegularStyle(color: ColorManager.grey, fontSize: 16),
            maxLines: 1,
          ),
          AutoSizeText(
            "Discount Value : ${copon.discountValue.toStringAsFixed(2)} EGP",
            style: getRegularStyle(color: ColorManager.grey, fontSize: 16),
            maxLines: 1,
          ),
          AutoSizeText(
            "Max Discount : ${copon.maxDiscount.toStringAsFixed(2)} EGP",
            style: getRegularStyle(color: ColorManager.grey, fontSize: 16),
            maxLines: 1,
          ),
          AutoSizeText(
            "Usages Left : ${copon.usagesLeft}",
            style: getRegularStyle(color: ColorManager.grey, fontSize: 16),
            maxLines: 1,
          ),
          AutoSizeText(
            "Times Used : ${copon.timesUsed}",
            style: getRegularStyle(color: ColorManager.grey, fontSize: 16),
            maxLines: 1,
          ),
          AutoSizeText(
            "Times Per User : ${copon.timesPerUser}",
            style: getRegularStyle(color: ColorManager.grey, fontSize: 16),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
