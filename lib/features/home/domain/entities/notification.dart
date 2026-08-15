class Notification {
  String id;
  String notificationText;
  DateTime createdAt;
  bool isRead;

  Notification({
    required this.id,
    required this.notificationText,
    required this.createdAt,
    required this.isRead,
  });
}
