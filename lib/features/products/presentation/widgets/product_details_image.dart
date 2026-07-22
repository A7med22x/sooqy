import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/widgets/icon_back.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(180.r, 40.r),
              bottomRight: Radius.elliptical(180.r, 40.r),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              height: .infinity,
              width: .infinity,
              errorListener: (value) {
                return;
              },
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) {
                return Image.network(
                  'https://t3.ftcdn.net/jpg/01/70/71/34/360_F_170713428_KgRrmdjyiRauJGAXJwVSqKlDXEO2YU8i.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Icon(
                      Icons.image_not_supported_outlined,
                      size: 50.sp,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            start: 10,
            top: 20,
            child: const IconsBack(),
          ),
        ],
      ),
    );
  }
}
