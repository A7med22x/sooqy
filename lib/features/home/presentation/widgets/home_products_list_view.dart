import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/di/service_locator.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/widgets/error_indicator.dart';
import 'package:sooqy/core/widgets/loading_indicator.dart';
import 'package:sooqy/features/products/data/models/product_request.dart';
import 'package:sooqy/features/products/presentation/cubit/product_cubit.dart';
import 'package:sooqy/features/products/presentation/cubit/product_states.dart';
import 'package:sooqy/features/products/presentation/widgets/product_card.dart';

class HomeProductsListView extends StatelessWidget {
  const HomeProductsListView({
    super.key,
    required this.title,
    required this.request,
  });

  final String title;
  final ProductRequest request;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator.get<ProductCubit>()..getProducts(request),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is GetProductsLoading) {
            return LoadingIndicator();
          } else if (state is GetProductsError) {
            return ErrorIndicator(state.message);
          } else if (state is GetProductsSuccess) {
            final products = state.products;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        title,
                        style: getBoldStyle(
                          fontSize: 16,
                          color: ColorManager.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            Routes.viewMore,
                            arguments: {'title': title, 'products': products},
                          );
                        },
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
                  const SizedBox(height: 16),
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
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
