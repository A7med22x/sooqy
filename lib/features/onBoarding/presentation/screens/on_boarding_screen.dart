import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/features/onBoarding/data/models/on_boarding_model.dart';
import 'package:sooqy/features/onBoarding/presentation/widgets/page_view_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => PageViewItem(
                onBoardingModel: OnBoardingModel.onBoardingModels[index],
                currentIndex: index,
              ),
              itemCount: OnBoardingModel.onBoardingModels.length,
            ),
          ),
        ],
      ),
    );
  }
}
