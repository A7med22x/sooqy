import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/di/service_locator.dart';
import 'package:sooqy/core/widgets/error_indicator.dart';
import 'package:sooqy/core/widgets/loading_indicator.dart';
import 'package:sooqy/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:sooqy/features/profile/presentation/cubit/profile_states.dart';
import 'package:sooqy/features/profile/presentation/widgets/my_orders_card.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator.get<ProfileCubit>()..getOrders(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Orders'),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: const OrderViewBody(),
      ),
    );
  }
}

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetOrdersLoading) {
          return LoadingIndicator();
        } else if (state is GetOrdersError) {
          return ErrorIndicator(state.message);
        } else if (state is GetOrdersSuccess) {
          final orders = state.orders;
          return ListView.builder(
            itemCount: orders.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) => MyOrderCard(order: orders[index]),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
