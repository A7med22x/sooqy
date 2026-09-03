import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/utils/ui_utils.dart';
import 'package:sooqy/core/widgets/custom_elevated_button.dart';
import 'package:sooqy/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:sooqy/features/checkout/data/models/checkout_response/checkout_request.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_states.dart';
import 'package:sooqy/features/checkout/presentation/widgets/checkout_app_bar.dart';
import 'package:sooqy/features/checkout/presentation/widgets/checkout_page_view.dart';
import 'package:sooqy/features/checkout/presentation/widgets/steps_row.dart';
import 'package:url_launcher/url_launcher.dart';

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
      return 'Confirm Order';
    } else {
      return 'Next';
    }
  }

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = context.watch<CheckoutCubit>();
    final cartCubit = context.read<CartCubit>();
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
          BlocListener<CheckoutCubit, CheckoutState>(
            listener: (context, state) {
              if (state is CheckoutLoading) {
                UIUtils.showLoading(context);
              } else if (state is CheckoutSuccess) {
                UIUtils.hideLoading(context);
                final checkout = state.checkout;
                if (checkoutCubit.selectedPaymentMethod == 'Paymob') {
                  payOnline(checkout.unifiedCheckoutUrl);
                } else {
                  cartCubit.refreshCart();
                  Navigator.of(context).pop();
                }
              } else if (state is CheckoutError) {
                UIUtils.hideLoading(context);
                UIUtils.showMessage(state.message);
              }
            },
            child: CustomElevatedButton(
              isStadiumBorder: false,
              innerPadding: const EdgeInsets.all(16),
              backgroundColor: ColorManager.primaryColor,
              label: getTextForButton(),
              onTap: () async {
                if (currentPage == 1 && checkoutCubit.selectedAddress == null) {
                  UIUtils.showMessage('Please select address');
                  return;
                }
                if (currentPage == 2) {
                  checkoutCubit.checkout(
                    CheckoutRequest(
                      shippingAddressId: checkoutCubit.selectedAddress!.id,
                      paymentMethod: checkoutCubit.selectedPaymentMethod!,
                    ),
                  );
                  return;
                }
                await pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },
            ),
          ),
          MediaQuery.of(context).padding.bottom > 0
              ? const SizedBox(height: 0)
              : const SizedBox(height: 16),
        ],
      ),
    );
  }

  Future<void> payOnline(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }
}
