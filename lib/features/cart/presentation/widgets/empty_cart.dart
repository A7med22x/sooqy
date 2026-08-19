import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 36, vertical: 80),
      height: .infinity,
      width: .infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: ColorManager.gradiant2,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.lightPrimaryColor, width: 3),
      ),
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Lottie.asset(AnimationsAssets.emptyCart),
          Text('Empty Cart', style: getBoldStyle(color: ColorManager.green)),
        ],
      ),
    );
  }
}
