import 'package:flutter/material.dart' hide Notification;
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/home/domain/entities/notification.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notification,
    required this.onPressedNotification,
  });

  final Notification notification;
  final VoidCallback onPressedNotification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressedNotification,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: notification.isRead
              ? ColorManager.transparent
              : ColorManager.lightPrimaryColor.withValues(alpha: 0.1),
          border: Border.all(
            color: notification.isRead
                ? ColorManager.gradiant1
                : ColorManager.primaryColor,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(
              notification.notificationText,
              style: getSemiBoldStyle(fontSize: 16, color: ColorManager.black),
            ),
            Text(
              notification.createdAt.toString().split(' ').first,
              style: getRegularStyle(
                fontSize: 13,
                color: ColorManager.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
