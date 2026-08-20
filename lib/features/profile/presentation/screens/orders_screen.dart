import 'package:flutter/material.dart';
import 'package:sooqy/features/profile/presentation/widgets/my_orders_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('My Orders'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
        body: const OrderViewBody(),
      );
  }
}

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: 5,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder:
                (context, index) => MyOrderCard(),
          );
  }
}
