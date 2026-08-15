import 'notifications.dart';

class NotificationResponse {
  Notifications notifications;

  NotificationResponse({required this.notifications});

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      notifications: Notifications.fromJson(
        json['notifications'] as Map<String, dynamic>,
      ),
    );
  }
}
