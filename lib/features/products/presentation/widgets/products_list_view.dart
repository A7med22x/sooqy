import 'package:flutter/material.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/features/products/presentation/widgets/product_card.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 30,
      gridDelegate: customDelegate(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.productDetails,
              //arguments: category.id
              //arguments: categories[index].name,
            );
          },
          child: ProductCard(),
        );
      },
    );
  }
  SliverGridDelegateWithFixedCrossAxisCount customDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 8,
      childAspectRatio: 163 / 260,
      
    );
  }
}
