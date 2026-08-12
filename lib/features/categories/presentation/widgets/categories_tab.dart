import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';
import 'package:sooqy/core/widgets/search_text_field.dart';
import 'package:sooqy/core/widgets/title_text_of_app_bar.dart';
import 'package:sooqy/features/categories/presentation/widgets/categories_list_view.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TitleTextOfAppBar(text: 'Categories')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.search),
              child: SearchTextField(
                enabled: false,
                hint:
                    'What are you looking for?', 
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Our Categories',
              style: getBoldStyle(
                color: ColorManager.backgroundDark,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(child: const CategoriesListView()),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
