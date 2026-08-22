import 'package:flutter/material.dart';
import 'package:sooqy/features/checkout/presentation/widgets/address_section_view.dart';
import 'package:sooqy/features/checkout/presentation/widgets/review_section.dart';
import 'package:sooqy/features/checkout/presentation/widgets/shipping_section.dart';

class CheckoutPageView extends StatelessWidget {
  const CheckoutPageView({super.key, required this.pageController});

  final PageController pageController;

  List<Widget> checkoutSections() => const [
    ShippingSection(),
    AddressSectionView(),
    ReviewSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return checkoutSections()[index];
        },
      ),
    );
  }
}
