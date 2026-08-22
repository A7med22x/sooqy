import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class SettingItem extends StatefulWidget {
  const SettingItem({
    super.key,
    required this.title,
    required this.icon,
    this.secPageName,
  });

  final String title;
  final String? secPageName;
  final String icon;

  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.gradiant1.withValues(alpha: 0.3),
        border: Border.all(color: ColorManager.gradiant2, width: 2),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, widget.secPageName!);
        },
        child: Row(
          children: [
            SvgPicture.asset(widget.icon),
            const SizedBox(width: 8),
            Text(
              widget.title,
              style: getRegularStyle(color: ColorManager.grey, fontSize: 16),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: ColorManager.grey),
          ],
        ),
      ),
    );
  }
}
