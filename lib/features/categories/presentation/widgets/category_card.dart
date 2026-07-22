import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/categories/domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.category, {super.key});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManager.transparent,
        border: Border.all(color: ColorManager.gradiant1, width: 2.w),
      ),
      child: Column(
        mainAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              height: MediaQuery.sizeOf(context).height * 0.15,
              width: .infinity,
              fit: .cover,
              imageUrl:
                  category.coverPictureUrl ??
                  'https://www.shutterstock.com/image-vector/error-500-page-empty-symbol-260nw-1711106146.jpg',
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.image_not_supported_outlined, size: 50),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            category.name,
            style: getBoldStyle(
              color: ColorManager.backgroundDark,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
