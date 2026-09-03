import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/widgets/icon_back.dart';

class CheckoutAppBar extends StatelessWidget {
  const CheckoutAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Positioned(left: 0, child: const IconsBack()),
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: getBoldStyle(color: ColorManager.black, fontSize: 20),
          ),
        ),
        // const Spacer(),
      ],
    );
  }
}
