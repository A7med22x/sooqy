import 'package:flutter/material.dart';
import 'package:sooqy/features/home/presentation/widgets/notification_header.dart';
import 'package:sooqy/features/home/presentation/widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(children: [
        NotificationHeader(),
        Expanded(
          child: ListView.builder(itemBuilder: (_, index) =>
                NotificationItem(), itemCount: 15,),
        )
      ]),
    );
  }
}
