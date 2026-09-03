import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class ShipTypeCard extends StatelessWidget {
  final String title, title2, price;
  final bool sel;
  const ShipTypeCard({
    super.key,
    required this.title,
    required this.title2,
    required this.price,
    required this.sel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: sel ? Border.all(color: ColorManager.lightPrimaryColor) : null,
        borderRadius: BorderRadius.circular(4),
        color: ColorManager.greyColor.withValues(alpha: 0.1),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: sel ? ColorManager.primaryColor : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  width: sel ? 4 : 1,
                  color: sel ? Colors.white : const Color(0xff949D9E),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: getBoldStyle(color: ColorManager.black, fontSize: 12),
                ),
                const SizedBox(height: 10),
                Text(
                  title2,
                  style: getRegularStyle(
                    color: ColorManager.greyColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Text(
                price,
                style: getBoldStyle(
                  color: ColorManager.lightPrimaryColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
