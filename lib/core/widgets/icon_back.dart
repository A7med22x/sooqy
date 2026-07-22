import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';

class IconsBack extends StatelessWidget {
  const IconsBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: ColorManager.white),
        ),
        child: Icon(
          size: 20,
          Icons.arrow_back_ios_new_rounded,
          color: ColorManager.black,
        ),
      ),
    );
  }
}
