import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/di/service_locator.dart';
import 'package:sooqy/features/home/presentation/cubit/home_cubit.dart';
import 'package:sooqy/features/home/presentation/widgets/home_app_bar.dart';
import 'package:sooqy/features/home/presentation/widgets/home_products_list_view.dart';
import 'package:sooqy/features/home/presentation/widgets/offer_list_view.dart';
import 'package:sooqy/features/products/data/models/product_request.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.wait([serviceLocator.get<HomeCubit>().getOffers()]);
      },
      child: BlocProvider(
        create: (_) => serviceLocator.get<HomeCubit>()..getOffers(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeAppBar(),
              OfferListView(),
              HomeProductsListView(
                title: 'Best Price',
                request: ProductRequest(
                  sortBy: 'price',
                  sortOrder: 'asc',
                  minPrice: 0,
                ),
              ),
              HomeProductsListView(
                title: 'Best Products',
                request: ProductRequest(sortBy: 'rating', sortOrder: 'desc'),
              ),
              HomeProductsListView(
                title: 'Highest Rated',
                request: ProductRequest(sortBy: 'price', sortOrder: 'desc'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
