import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class StepsRow extends StatelessWidget {
  const StepsRow({
    super.key,
    required this.currentPage,
    required this.pageController,
  });
  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(3, (index) {
        return currentPage >= index
            ? InkWell(
                onTap: () => pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                ),
                child: ActiveStep(title: getStepsTitle()[index]),
              )
            : InActiveStep(title: getStepsTitle()[index], index: index);
      }),
    );
  }
}

List<String> getStepsTitle() {
  return ['Payment', 'Address', 'Review'];
}

class ActiveStep extends StatelessWidget {
  const ActiveStep({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: ColorManager.primaryColor,
          child: SvgPicture.asset(SvgAssets.check),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: getBoldStyle(color: ColorManager.primaryColor, fontSize: 16),
        ),
      ],
    );
  }
}

class InActiveStep extends StatelessWidget {
  final String title;
  final int index;
  const InActiveStep({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: ColorManager.gradiant1.withAlpha(50),
          child: Text(
            (index + 1).toString(),
            style: getBoldStyle(color: ColorManager.primaryColor, fontSize: 12),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: getBoldStyle(color: ColorManager.greyColor, fontSize: 16),
        ),
      ],
    );
  }
}
