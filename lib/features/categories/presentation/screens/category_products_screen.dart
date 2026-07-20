import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/widgets/search_text_field.dart';
import 'package:sooqy/core/widgets/title_text_of_app_bar.dart';
import 'package:sooqy/features/categories/presentation/widgets/products_list_view.dart';

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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  SearchTextField(
                    enabled: false,
                    hint:
                        'Search........',                   ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            SliverToBoxAdapter(
              child: Text(
                'Search Results',
                style: getRegularStyle(
                  color: ColorManager.gradiant3,
                  fontSize: 13.sp,
                ),
              ),
            ),
            ProductsListView(),            
          ],
        ),
      ),
    );
  }
}