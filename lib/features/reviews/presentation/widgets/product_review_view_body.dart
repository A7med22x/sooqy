import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/reviews/presentation/widgets/add_review_dialog.dart';
import 'package:sooqy/features/reviews/presentation/widgets/add_review_feild.dart'
    show AddReviewFeild;
import 'package:sooqy/features/reviews/presentation/widgets/reviews_list_view.dart';

class ProductReviewsViewBody extends StatelessWidget {
  const ProductReviewsViewBody({super.key});

  //final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () async {
              bool? res =
                  await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: AddReviewDialog(productId: ''),
                          );
                        },
                      )
                      as bool?;
              if (res == true && context.mounted) {
                // context.read<ReviewsCubit>().getProductReviewsById(
                //   id: product.id,
                //   pageNum: 1,
                // );
              }
            },
            child: const AddReviewFeild(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                "2",
                //"{product.reviewsCount} Reviews",
                style: getBoldStyle(color: ColorManager.black, fontSize: 16),
                maxLines: 1,
              ),
              Row(
                children: [
                  Icon(Icons.star, color: ColorManager.secColor),
                  SizedBox(width: 5.w),
                  AutoSizeText(
                    "4.5",
                    //"product.rating.toStringAsFixed(2)",
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        Expanded(child: ReviewsListView(pID: '')),
      ],
    );
  }
}
