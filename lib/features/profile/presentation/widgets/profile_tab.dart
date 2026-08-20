import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:sooqy/features/profile/presentation/widgets/setting_item.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthCubit>().user;

    return Column(
      children: [
        const SizedBox(height: 24),
        Text('Profile', style: getBoldStyle(color: ColorManager.black)),
        const SizedBox(height: 24),
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: ColorManager.greyColor.withValues(alpha: 0.2),
            border: Border.all(color: ColorManager.gradiant2, width: 2),
          ),
          child: Row(
            children: [
              user!.profilePicture == null
                  ? Image.asset(ImageAssets.profileImage, width: 44)
                  : Container(
                      width: 60,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.lightPrimaryColor,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            user.profilePicture!,
                          ),
                        ),
                      ),
                    ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: .start,
                children: [
                  AutoSizeText(
                    user.fullName,
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    user.email,
                    style: getRegularStyle(
                      color: ColorManager.grey,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    maxFontSize: 16,
                    minFontSize: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SettingItem(
          title: 'My Account',
          icon: IconsAssets.myAccount,
          secPageName: Routes.personal,
        ),
        const SizedBox(height: 16),
        SettingItem(
          title: 'My Orders',
          icon: IconsAssets.myOrders,
          secPageName: Routes.orders,
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorManager.lightPrimaryColor.withValues(alpha: 0.15),
              border: Border.all(color: ColorManager.gradiant2, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sign Out',
                  style: getBoldStyle(color: ColorManager.black, fontSize: 16),
                ),
                const SizedBox(width: 60),
                const Icon(Icons.logout_rounded, color: ColorManager.black),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
