import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/widgets/address_card.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_cubit.dart';

class AddressSectionView extends StatefulWidget {
  const AddressSectionView({super.key});

  @override
  State<AddressSectionView> createState() => _AddressSectionViewState();
}

class _AddressSectionViewState extends State<AddressSectionView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final addresses = context.watch<CheckoutCubit>().addressesList;

    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () async {
            Navigator.of(context).pushNamed(Routes.addAddress);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
              border: Border.all(color: ColorManager.primaryColor),
            ),
            child: Text(
              'Add New Address',
              textAlign: TextAlign.center,
              style: getBoldStyle(
                color: ColorManager.primaryColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount: addresses.length,
            itemBuilder: (context, index) {
              final isSelected = ((index == selectedIndex));
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    context.read<CheckoutCubit>().selectAddress(
                      addresses[index],
                    );
                  });
                },
                child: AddressCard(
                  index: index,
                  isSelected: isSelected,
                  address: addresses[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
