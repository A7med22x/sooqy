import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        'Good Morning !..',
        style: getRegularStyle(color: ColorManager.greyColor, fontSize: 16),
      ),
      subtitle: Text(
        'John Doe',
        style: getBoldStyle(color: ColorManager.black, fontSize: 16),
      ),
      trailing: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        onTap: () {
          Navigator.pushNamed(context, Routes.notification);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.surface,
          ),
          child: SvgPicture.asset(
            IconsAssets.notification,
            // ignore: deprecated_member_use
            color: ColorManager.primaryColor,
          ),
        ),
      ),
      leading: CircleAvatar(
        child: Image.asset(
          ImageAssets.profileImage,
          width: 44,
          height: 44,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
