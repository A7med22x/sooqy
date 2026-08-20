import 'package:sooqy/features/home/data/models/notification_models/notification_model.dart';
import 'package:sooqy/features/home/domain/entities/notification.dart';

extension NotificationMapper on NotificationModel {
  Notification get toEntity => Notification(
    id: id,
    notificationText: notificationText,
    createdAt: createdAt,
    isRead: isRead,
  );
}
