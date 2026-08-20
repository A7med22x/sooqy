import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';

class UserAddressCard extends StatelessWidget {
  const UserAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.grey.withValues(alpha: 0.2),
        border: Border.all(color: ColorManager.gradiant2, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 6),

          Text("Full Address : address.fullAddress"),

          const SizedBox(height: 6),

          Text("Notes : address.notes"),

          const SizedBox(height: 6),
          Text("Phone Number : address.phoneNumber"),
        ],
      ),
    );
  }
}
