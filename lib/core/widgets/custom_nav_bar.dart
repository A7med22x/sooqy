import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class CustomButtomNavBar extends StatefulWidget {
  final ValueChanged<int> onTap;
  const CustomButtomNavBar({super.key, required this.onTap});

  @override
  State<CustomButtomNavBar> createState() => _CustomButtomNavBarState();
}

class _CustomButtomNavBarState extends State<CustomButtomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: ColorManager
            .white, //Theme.of(context).navigationBarTheme.backgroundColor
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(29, 0, 0, 0),
            blurRadius: 7,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SalomonBottomBar(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        unselectedItemColor: ColorManager.grey,
        selectedItemColor: ColorManager.primaryColor,
        itemPadding: Localizations.localeOf(context).languageCode == 'ar'
            ? const EdgeInsets.only(top: 0, left: 15)
            : const EdgeInsets.only(top: 0, right: 15),

        currentIndex: _currentIndex,
        onTap: (i) {
          _currentIndex = i;
          widget.onTap(i);
          setState(() {});
        },
        items: [
          navBarItem(
            title: 'Home', //S.of(context).home
            inActiveIcon: IconsAssets.home,
            activeIcon: IconsAssets.homeBold,
          ),
          navBarItem(
            title: 'Categories', //S.of(context).categories
            inActiveIcon: IconsAssets.products,
            activeIcon: IconsAssets.productsBold,
          ),
          navBarItem(
            title: 'Cart', //S.of(context).cart
            inActiveIcon: IconsAssets.shoppingCart,
            activeIcon: IconsAssets.shoppingCartBold,
          ),
          navBarItem(
            title: 'Profile', //S.of(context).profile,
            inActiveIcon: IconsAssets.user,
            activeIcon: IconsAssets.userBold,
          ),
        ],
      ),
    );
  }

  SalomonBottomBarItem navBarItem({
    required String title,
    required String inActiveIcon,
    required String activeIcon,
  }) {
    return SalomonBottomBarItem(
      icon: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width * .1,
        child: Stack(
          clipBehavior: Clip.none,
          children: [Center(child: SvgPicture.asset(inActiveIcon, height: 22))],
        ),
      ),
      activeIcon: CircleAvatar(
        backgroundColor: ColorManager.primaryColor,
        radius: 20,
        child: SvgPicture.asset(activeIcon, height: 22),
      ),
      title: Text(
        "   $title",
        style: getSemiBoldStyle(color: ColorManager.primaryColor),
      ),
    );
  }
}
