import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/utils/ui_utils.dart';
import 'package:sooqy/features/checkout/domain/entities/address.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:sooqy/features/checkout/presentation/cubit/checkout_states.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
    required this.address,
    required this.isSelected,
    required this.index,
  });

  final Address address;
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String fullAddress =
        '${address.street}, ${address.apartment} - ${address.city}, ${address.state}';
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if (state is RemoveAddressLoading) {
          UIUtils.showLoading(context);
        } else if (state is RemoveAddressSuccess) {
          UIUtils.hideLoading(context);
        } else if (state is RemoveAddressError) {
          UIUtils.hideLoading(context);
          UIUtils.showMessage(state.message);
        }
      },
      child: Dismissible(
        key: Key(address.id),
        background: slideRightBackground(context),
        secondaryBackground: slideLeftBackground(context),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            Navigator.of(
              context,
            ).pushNamed(Routes.addAddress, arguments: address);
            return false;
          }
          if (direction == DismissDirection.endToStart) {
            final checkoutCubit = context.read<CheckoutCubit>();
            final bool? confirmed = await showDialog<bool>(
              context: context,
              builder: (dialogContext) {
                return AlertDialog(
                  title: const Text('Confirm delete'),
                  content: const Text(
                    'Are you sure you want to delete this address?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop(false);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop(true);
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                );
              },
            );

            if (confirmed != true) {
              return false;
            }

            await checkoutCubit.removeAddress(address.id);

            return true;
          }

          return false;
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isSelected)
                ? ColorManager.lightPrimaryColor.withAlpha(30)
                : ColorManager.greyColor.withAlpha(30),
            border: Border.all(
              color: isSelected
                  ? ColorManager.lightPrimaryColor
                  : ColorManager.gradiant2,
              width: isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: ColorManager.black.withAlpha(15),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Address ${index + 1}',
                    style: getSemiBoldStyle(color: ColorManager.black),
                  ),
                ],
              ),

              const Divider(color: ColorManager.grey),
              const SizedBox(height: 6),

              Text(fullAddress),
              Text(address.notes),

              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(address.phoneNumber),
                  Text(
                    'Verified',
                    style: getBoldStyle(
                      color: ColorManager.green,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget slideRightBackground(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: ColorManager.blueAccent,
      child: Row(
        children: [
          Icon(Icons.edit, color: ColorManager.white),
          SizedBox(width: 8),
          Text('update', style: getBoldStyle(color: ColorManager.white)),
        ],
      ),
    );
  }

  Widget slideLeftBackground(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: ColorManager.redAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.delete, color: ColorManager.white),
          SizedBox(width: 8),
          Text('delete', style: getBoldStyle(color: ColorManager.white)),
        ],
      ),
    );
  }
}
