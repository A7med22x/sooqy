import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/widgets/custom_text_field.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sooqy/core/widgets/address_card.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_cubit.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Screen'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const PersonalViewBody(),
    );
  }
}

class PersonalViewBody extends StatelessWidget {
  const PersonalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return UserInfoColumn();
  }
}

class UserInfoColumn extends StatelessWidget {
  const UserInfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthCubit>().user;
    final addresses = context.watch<CheckoutCubit>().addressesList;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'Personal Informations',
            style: getSemiBoldStyle(color: ColorManager.black, fontSize: 16),
          ),
          CustomTextField(hint: user!.fullName, enabled: false),
          CustomTextField(hint: user.email, enabled: false),

          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(width: 8),
                  Text(
                    'Address',
                    style: getSemiBoldStyle(
                      color: ColorManager.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                return AddressCard(
                  isSelected: false,
                  index: index,
                  address: addresses[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
