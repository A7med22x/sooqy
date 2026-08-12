import 'package:flutter/material.dart';
import 'package:sooqy/features/home/presentation/widgets/home_app_bar.dart';
import 'package:sooqy/features/home/presentation/widgets/home_products_list_view.dart';
import 'package:sooqy/features/home/presentation/widgets/offer_list_view.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeAppBar(),
          OfferListView(),
          HomeProductsListView(products: [], title: 'Best Price', onClickMore: () {}),
          HomeProductsListView(products: [], title: 'Highest Rated', onClickMore: () {}),
          HomeProductsListView(products: [], title: 'Best Products', onClickMore: () {}),
        ],
      ),
    );
  }
}
