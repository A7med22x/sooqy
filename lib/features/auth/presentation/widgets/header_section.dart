import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/font_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/widgets/custom_auto_size_text.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        CustomAutoSizeText(
          data: 'welcome to',
          textStyle: getBoldStyle(color: ColorManager.gradiant1),
        ),
        const SizedBox(width: 8),
        Text(
          'Sooqy',
          style: getBoldStyle(
            color: ColorManager.green,
            fontSize: FontSize.s36,
          ),
        ),
      ],
    );
  }
}
