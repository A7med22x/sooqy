import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/di/service_locator.dart';
import 'package:sooqy/core/widgets/error_indicator.dart';
import 'package:sooqy/core/widgets/loading_indicator.dart';
import 'package:sooqy/features/home/presentation/cubit/home_cubit.dart';
import 'package:sooqy/features/home/presentation/cubit/home_states.dart';
import 'package:sooqy/features/home/presentation/widgets/notification_header.dart';
import 'package:sooqy/features/home/presentation/widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator.get<HomeCubit>()..getNotifications(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetNotificationsLoading) {
            return LoadingIndicator();
          } else if (state is GetNotificationsError) {
            return ErrorIndicator(state.message);
          } else if (state is GetNotificationsSuccess) {
            final notifications = state.notifications;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Notifications'),
                leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              body: Column(
                children: [
                  NotificationHeader(
                    notificationCount: notifications.length,
                    onSelectAllAsRead: () {
                      context.read<HomeCubit>().readAllNotifications(
                        notifications.map((item) => item.id).toList(),
                      );
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, index) => NotificationItem(
                        notification: notifications[index],
                        onPressedNotification: () {
                          if (notifications[index].isRead) return;
                          context.read<HomeCubit>().readNotification(
                            notifications[index].id,
                          );
                        },
                      ),
                      itemCount: notifications.length,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
