import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/reviews/presentation/widgets/after_review.dart';
import 'package:sooqy/features/reviews/presentation/widgets/custom_button.dart';

class AddReviewDialog extends StatefulWidget {
  const AddReviewDialog({super.key, required this.productId});
  final String productId;

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  bool submit = false;

  final TextEditingController _commentController = TextEditingController();
  //double _rate = 0;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedCrossFade(
          firstChild: AddReviewForm(
            commentController: _commentController,
            onRateChanged: (value) {
             // _rate = value;
            },
          ),
          secondChild: const AfterReview(),
          crossFadeState: !submit
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 200),
        ),
        CustomButton(
          //isLoading: state is AddReviewsLoading,
          title: submit ? "Cancel" : "Add Review",
          onPressed: () {},
          //  () async {
          // if (submit) {
          //   Navigator.pop(context, true);
          // } else {
          //   final comment = _commentController.text.trim();
          //   final rate = _rate;

          //   if (rate == 0.0) {
          //     showNotification(context, 'يجب اضافة تقييم', NotiType.warning);
          //     return;
          //   }
          //   if (comment.isEmpty) {
          //     showNotification(context, 'يجب اضافة تعليق', NotiType.warning);
          //     return;
          //   }
          //   await context.read<AddReviewsCubit>().addReview(
          //     id: widget.productId,
          //     comment: comment,
          //     rate: rate.toInt(),
          //   );
          // }
          //},
        ),
      ],
    );
  }
}

class AddReviewForm extends StatelessWidget {
  final TextEditingController commentController;
  final ValueChanged<double> onRateChanged;
  const AddReviewForm({
    super.key,
    required this.commentController,
    required this.onRateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50,
          child:
              // SecureStorage.getUserData().image == null
              //     ? Image.asset(ImageAssets.profileImage, width: 50)
              //     :
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.primaryColor,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      ImageAssets.profileImage,
                      //SecureStorage.getUserData().image!,
                    ),
                  ),
                ),
              ),
        ),
        const SizedBox(height: 10,),
        Text(
          "SecureStorage.getUserData().name!",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          "How do you rate this product",
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        // RatingBar.builder(
        //   initialRating: 0,
        //   minRating: 1,
        //   direction: Axis.horizontal,
        //   allowHalfRating: false,
        //   itemCount: 5,
        //   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        //   itemBuilder: (context, _) =>
        //       const Icon(Icons.star, color: Colors.amber),
        //   onRatingUpdate: onRateChanged,
        // ),
        const SizedBox(height: 16,),
        TextField(
          controller: commentController,
          decoration: InputDecoration(
            hintText:"Your comments",
            hintStyle: getSemiBoldStyle(color: ColorManager.grey, fontSize: 16),
            fillColor: ColorManager.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          maxLines: 1,
        ),
        const SizedBox(height: 16,),
      ],
    );
  }
}
