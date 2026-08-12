import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 165,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: ImageAssets.android12splash,
            width: .infinity,
            fit: BoxFit.fill,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            ),
            errorWidget: (context, url, error) => Container(
              padding: EdgeInsets.all(8),
              width: .infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: ColorManager.transparent,
                border: Border.all(color: ColorManager.primaryColor, width: 2.w),
              ),
              child: Icon(Icons.image_not_supported_outlined, size: 50),
            ),
          ),
        ),
      ),
    );
  }
}
