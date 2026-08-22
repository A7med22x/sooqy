import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';

class ReviewCard extends StatelessWidget {
  final Widget body;
  const ReviewCard({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ColorManager.greyColor.withAlpha(30),
      ),
      child: body,
    );
  }
}
