import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorManager.lightPrimaryColor.withValues(alpha: 0.1),
                border: Border.all(color: ColorManager.primaryColor, width: 2),
              ),
      child: InkWell(
        onTap: () {
        },
         child: Row(
          mainAxisAlignment: .spaceBetween,
           children: [
             Text(
              'notificationText',
              style: getSemiBoldStyle(fontSize: 16, color: ColorManager.black),
                     ),
             Text(
              '23/8/2026',//widget.notification.createdAt.toString().split(' ').first,
              style: getRegularStyle(fontSize: 13, color: ColorManager.greyColor),
                     ),
           ],
         ),
      ),
    );
  }
}