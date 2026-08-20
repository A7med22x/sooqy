import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/widgets/title_text_of_app_bar.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';
import 'package:sooqy/features/products/presentation/widgets/products_list_view.dart';

class ViewMoreScreen extends StatelessWidget {
  const ViewMoreScreen({
    super.key,
    required this.title,
    required this.products,
  });

  final String title;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleTextOfAppBar(text: title),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorManager.backgroundDark,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Expanded(child: ProductsListView(products: products)),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
