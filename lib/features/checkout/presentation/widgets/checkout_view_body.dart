import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/features/checkout/presentation/widgets/checkout_app_bar.dart';
import 'package:sooqy/features/checkout/presentation/widgets/checkout_page_view.dart';
import 'package:sooqy/features/checkout/presentation/widgets/steps_row.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.toInt();
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  String getTextForButton() {
    if (currentPage == 2) {
      return 'تأكيد الطلب';
    } else {
      return 'Next';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CheckoutAppBar(title: getStepsTitle()[currentPage]),
          const SizedBox(height: 24),
          StepsRow(currentPage: currentPage, pageController: pageController),
          const SizedBox(height: 32),
          CheckoutPageView(pageController: pageController),
          CustomElevatedButton(
            isStadiumBorder: false,
            innerPadding: const EdgeInsets.all(16),
            backgroundColor: ColorManager.primaryColor,
            label: getTextForButton(),
            onTap: () async {
              await pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
          ),
          MediaQuery.of(context).padding.bottom > 0
              ? const SizedBox(height: 0)
              : const SizedBox(height: 16),
        ],
      ),
    );
  }
}
