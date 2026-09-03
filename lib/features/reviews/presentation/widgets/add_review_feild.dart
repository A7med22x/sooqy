import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/auth/presentation/cubit/auth_cubit.dart';

class AddReviewFeild extends StatelessWidget {
  const AddReviewFeild({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthCubit>().user;
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: ColorManager.black),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.surface,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 5),
          user!.profilePicture == null
              ? Image.asset(ImageAssets.profileImage, width: 35, height: 35)
              : Container(
                  width: 35,
                  height: 35,
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.primaryColor,
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.profileImage),
                    ),
                  ),
                ),
          const SizedBox(width: 10),
          Text(
            "Add Review",
            style: getSemiBoldStyle(color: ColorManager.black, fontSize: 16),
          ),
          const Spacer(),
          const Icon(Icons.add_rounded, color: ColorManager.primaryColor),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
