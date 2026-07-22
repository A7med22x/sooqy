import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/widgets/error_indicator.dart';
import 'package:sooqy/core/widgets/loading_indicator.dart';
import 'package:sooqy/core/widgets/search_text_field.dart';
import 'package:sooqy/core/widgets/title_text_of_app_bar.dart';
import 'package:sooqy/features/products/data/models/product_request.dart';
import 'package:sooqy/features/products/presentation/cubit/product_cubit.dart';
import 'package:sooqy/features/products/presentation/cubit/product_states.dart';
import 'package:sooqy/features/products/presentation/widgets/products_list_view.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  late final _productCubit = context.read<ProductCubit>();

  @override
  void initState() {
    super.initState();
    _productCubit.getProducts(ProductRequest(category: widget.categoryName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleTextOfAppBar(text: 'Search'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorManager.backgroundDark,
          ),
        ),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is GetProductsLoading) {
            return LoadingIndicator();
          } else if (state is GetProductsError) {
            return ErrorIndicator(state.message);
          } else if (state is GetProductsSuccess) {
            final products = state.products;

            return Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  SearchTextField(enabled: false, hint: 'Search........'),
                  SizedBox(height: 16.h),
                  Expanded(child: ProductsListView(products: products)),
                  SizedBox(height: 16.h),
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
