import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/widgets/search_text_field.dart';
import 'package:sooqy/core/widgets/title_text_of_app_bar.dart';
import 'package:sooqy/features/products/presentation/widgets/products_list_view.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key});

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
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            SearchTextField(enabled: false, hint: 'Search........'),
            SizedBox(height: 16.h),
            Expanded(child: ProductsListView()),
          ],
        ),
      ),
    );
  }
}
