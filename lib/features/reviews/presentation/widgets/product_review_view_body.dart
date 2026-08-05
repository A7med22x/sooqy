import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';
import 'package:sooqy/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:sooqy/features/reviews/presentation/widgets/add_review_dialog.dart';
import 'package:sooqy/features/reviews/presentation/widgets/add_review_feild.dart'
    show AddReviewFeild;
import 'package:sooqy/features/reviews/presentation/widgets/reviews_list_view.dart';

class ProductReviewsViewBody extends StatelessWidget {
  const ProductReviewsViewBody({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),

        Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () => _showAddReviewDialog(context),
            child: const AddReviewFeild(),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                '${product.reviewsCount} Reviews',
                style: getBoldStyle(color: ColorManager.black, fontSize: 16),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: ColorManager.secColor),
                  SizedBox(width: 5.w),
                  AutoSizeText(
                    product.rating.toStringAsFixed(2),
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        Expanded(child: ReviewsListView(pID: product.id)),
      ],
    );
  }

  Future<void> _showAddReviewDialog(BuildContext context) async {
    final reviewCubit = BlocProvider.of<ReviewCubit>(context);

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: reviewCubit,
          child: Dialog(
            child: SizedBox(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: AddReviewDialog(productId: product.id),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
