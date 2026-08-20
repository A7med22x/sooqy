import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/widgets/custom_text_field.dart';
import 'package:sooqy/features/profile/presentation/widgets/user_address_card.dart';

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
          CustomTextField(hint: "userInfoModel?.fullName", enabled: false),
          CustomTextField(hint: "userInfoModel?.email", enabled: false),

          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Address',
                style: getSemiBoldStyle(
                  color: ColorManager.black,
                  fontSize: 16,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.addAddress);
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.edit_location_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8,),
                    Text(
                      'Edit',
                      style: getMediumStyle(color: ColorManager.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return UserAddressCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
