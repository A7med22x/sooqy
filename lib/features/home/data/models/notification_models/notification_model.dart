class NotificationModel {
  String id;
  String notificationText;
  DateTime createdAt;
  bool isRead;

  NotificationModel({required this.id, required this.notificationText, required this.createdAt, required this.isRead});

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json['id'] as String? ?? "",
    notificationText: json['notificationText'] as String? ?? "",
    createdAt: DateTime.parse(json['createdAt'] as String? ?? ""),
    isRead: json['isRead'] as bool? ?? false,
  );
}
