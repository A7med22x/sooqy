import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';
import 'package:sooqy/features/products/presentation/widgets/product_card.dart';

class HomeProductsListView extends StatelessWidget {
  const HomeProductsListView({
    super.key,
    required this.products,
    required this.title,
    required this.onClickMore,
  });

  final List<Product> products;
  final String title;
  final void Function() onClickMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                title,
                style: getBoldStyle(fontSize: 16, color: ColorManager.black),
              ),
              InkWell(
                onTap: onClickMore,
                child: Text(
                  "More...",
                  style: getRegularStyle(
                    fontSize: 16,
                    color: ColorManager.greyColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16,),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length > 10 ? 10 : products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: 10),
                  child: SizedBox(
                    height: 224,
                    width: 180,
                    child: ProductCard(product: products[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
