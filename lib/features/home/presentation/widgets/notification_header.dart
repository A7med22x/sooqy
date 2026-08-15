import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({
    super.key,
    required this.notificationCount,
    required this.onSelectAllAsRead,
  });

  final int notificationCount;
  final VoidCallback onSelectAllAsRead;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          AutoSizeText(
            'Notifications',
            style: getSemiBoldStyle(fontSize: 16, color: ColorManager.black),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 16,
            backgroundColor: ColorManager.lightPrimaryColor.withValues(
              alpha: 0.1,
            ),
            child: Text(
              '$notificationCount',
              style: getBoldStyle(
                fontSize: 13,
                color: ColorManager.primaryColor,
              ),
            ),
          ),

          const Spacer(),
          TextButton(
            onPressed: onSelectAllAsRead,
            child: Text(
              'Select All as Read',
              style: getRegularStyle(
                fontSize: 13,
                color: ColorManager.greyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
