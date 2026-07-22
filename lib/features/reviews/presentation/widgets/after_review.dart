import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class AfterReview extends StatefulWidget {
  const AfterReview({super.key});

  @override
  State<AfterReview> createState() => _AfterReviewState();
}

class _AfterReviewState extends State<AfterReview> {
  bool _showData = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showData = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showData
        ? Column(
            spacing: 24,
            children: [
              SvgPicture.asset(SvgAssets.done, height: 150),
              Text(
                "Thanks for rating",
                textAlign: TextAlign.center,
                style: getSemiBoldStyle(color: ColorManager.greyColor, fontSize: 14)
              ),
            ],
          )
        : const SizedBox();
  }
}
