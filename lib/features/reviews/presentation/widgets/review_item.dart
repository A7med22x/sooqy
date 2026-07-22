import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});
  //final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: CachedNetworkImageProvider(
                "review.userPicture",
                errorListener: (p0) {
                  return;
                },
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                AutoSizeText(
                  "review.userName",
                  style: getSemiBoldStyle(color: ColorManager.black),
                  maxLines: 1,
                ),
                AutoSizeText(
                  "review.createdAt.toString().split(' ').first",
                  style: getRegularStyle(
                    fontSize: 12,
                    color: ColorManager.greyColor,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        AutoSizeText(
          "review.comment",
          style: getRegularStyle(fontSize: 12, color: ColorManager.greyColor),
          maxLines: 1,
        ),
      ],
    );
  }
}
