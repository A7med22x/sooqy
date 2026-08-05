import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class AfterReview extends StatelessWidget {
  const AfterReview({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 400),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(scale: 0.9 + (0.1 * value), child: child),
        );
      },
      child: Column(
        spacing: 24,
        children: [
          SvgPicture.asset(SvgAssets.done, height: 150),
          Text(
            "Thanks for rating",
            textAlign: TextAlign.center,
            style: getSemiBoldStyle(
              color: ColorManager.greyColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
