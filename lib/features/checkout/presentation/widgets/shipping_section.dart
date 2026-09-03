import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:sooqy/features/checkout/presentation/widgets/ship_type.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selected = 0;
  @override
  void initState() {
    context.read<CheckoutCubit>().selectPaymentMethod('Paymob');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            context.read<CheckoutCubit>().selectPaymentMethod('Paymob');
            selected = 0;
            setState(() {});
          },
          child: ShipTypeCard(
            price: "",
            title: 'pay Online',
            title2: '',
            sel: selected == 0,
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            context.read<CheckoutCubit>().selectPaymentMethod('CashOnDelivery');
            selected = 1;
            setState(() {});
          },
          child: ShipTypeCard(
            price: "",
            title: 'pay Cash',
            title2: '',
            sel: selected == 1,
          ),
        ),
      ],
    );
  }
}
