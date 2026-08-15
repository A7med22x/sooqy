import 'notification_model.dart';

class Notifications {
  List<NotificationModel> items;
  int? page;
  int? pageSize;
  int? totalCount;
  bool? hasNextPage;
  bool? hasPreviousPage;

  Notifications({
    required this.items,
    this.page,
    this.pageSize,
    this.totalCount,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
        .toList() ??
        [],
    page: json['page'] as int?,
    pageSize: json['pageSize'] as int?,
    totalCount: json['totalCount'] as int?,
    hasNextPage: json['hasNextPage'] as bool?,
    hasPreviousPage: json['hasPreviousPage'] as bool?,
  );
}
