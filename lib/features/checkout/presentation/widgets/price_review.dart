import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class PriceReview extends StatelessWidget {
  const PriceReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "المجموع الفرعي :",
              style: getRegularStyle(
                color: ColorManager.greyColor,
                fontSize: 16,
              ),
            ),
            Text(
              "5000 EGP",
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
              "التوصيل :",
              style: getRegularStyle(
                color: ColorManager.greyColor,
                fontSize: 16,
              ),
            ),
            Text(
              "2000 EGP",
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
              "الخصم",
              style: getRegularStyle(
                color: ColorManager.greyColor,
                fontSize: 16,
              ),
            ),
            Text(
              "لا يوجد خصم",
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
              "الكلي",
              style: getBoldStyle(color: ColorManager.black, fontSize: 16),
            ),
            Text(
              "20.00 EGP",
              style: getBoldStyle(color: ColorManager.black, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
