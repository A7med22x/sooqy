import 'package:flutter/material.dart';
import 'package:sooqy/features/checkout/presentation/widgets/checkout_view_body.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: CheckoutViewBody()));
  }
}
