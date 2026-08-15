import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/home/domain/entities/offer.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key, required this.offer});

  final Offer offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: ColorManager.transparent,
        border: Border.all(color: ColorManager.gradiant1, width: 2.w),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CachedNetworkImage(
              imageUrl: offer.coverUrl,
              width: .infinity,
              height: 120,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) =>
                  Icon(Icons.image_not_supported_outlined, size: 50),
            ),
          ),
          AutoSizeText(
            offer.name,
            style: getBoldStyle(color: ColorManager.black, fontSize: 16),
            maxLines: 1,
          ),
          AutoSizeText(
            offer.description,
            style: getRegularStyle(color: ColorManager.greyColor, fontSize: 14),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
