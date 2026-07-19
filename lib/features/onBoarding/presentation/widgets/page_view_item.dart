import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sooqy/core/app_preferences.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/font_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/widgets/custom_auto_size_text.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/features/onBoarding/data/models/on_boarding_model.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.onBoardingModel,
    required this.currentIndex,
  });

  final OnBoardingModel onBoardingModel;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: .center,
      children: [
        SizedBox(
          width: .infinity,
          height: size.height * 0.5,
          child: Stack(
            children: [
              SvgPicture.asset(
                onBoardingModel.backgroundImage,
                width: .infinity,
                height: .infinity,
                fit: .fill,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  onBoardingModel.image,
                  width: size.width * 0.6,
                  height: size.height * 0.3,
                ),
              ),
              currentIndex == 0
                  ? Positioned(
                      right: 24,
                      top: 24,
                      child: InkWell(
                        onTap: () => onFinish(context),
                        child: Text(
                          onBoardingModel.buttonName,
                          style: getMediumStyle(
                            color: ColorManager.steelGray,
                            fontSize: FontSize.s16,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.08),
        currentIndex == 0
            ? Row(
                mainAxisAlignment: .center,
                children: [
                  CustomAutoSizeText(
                    data: onBoardingModel.title,
                    textStyle: getBoldStyle(color: ColorManager.black),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Sooqy',
                    style: getBoldStyle(color: ColorManager.green, fontSize: FontSize.s36),
                  ),
                ],
              )
            : CustomAutoSizeText(
                data: onBoardingModel.title,
                textStyle: getBoldStyle(color: ColorManager.black),
                maxLines: 1,
              ),
        const SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: CustomAutoSizeText(
            data: onBoardingModel.description,
            textStyle: getSemiBoldStyle(
              color: ColorManager.grey,
              fontSize: FontSize.s14,
            ),
            maxLines: 3,
          ),
        ),
        SizedBox(height: size.height * 0.08),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: 2,
          effect: WormEffect(
            dotWidth: 12,
            dotHeight: 12,
            activeDotColor: ColorManager.green,
            dotColor: currentIndex == 0
                ? ColorManager.green.withValues(alpha: 0.5)
                : ColorManager.green,
          ),
        ),
        const SizedBox(height: 28),
        currentIndex == 1
            ? CustomElevatedButton(
                label: onBoardingModel.buttonName,
                onTap: () => onFinish(context),
                backgroundColor: ColorManager.green,
                outerPadding: EdgeInsets.symmetric(horizontal: 16),
                innerPadding: EdgeInsets.symmetric(vertical: 16),
                radius: 16,
                isStadiumBorder: false,
              )
            : SizedBox(),
      ],
    );
  }

  void onFinish(BuildContext context) {
    AppPreferences.setOnboardingViewed(true);
    Navigator.of(context).pushReplacementNamed(Routes.home);
  }
}
