import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/utils/ui_utils.dart';
import 'package:sooqy/features/reviews/data/models/create_review_request.dart';
import 'package:sooqy/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:sooqy/features/reviews/presentation/cubit/review_states.dart';
import 'package:sooqy/features/reviews/presentation/widgets/after_review.dart';
import 'package:sooqy/features/reviews/presentation/widgets/custom_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddReviewDialog extends StatefulWidget {
  const AddReviewDialog({super.key, required this.productId});
  final String productId;

  @override
  State<AddReviewDialog> createState() => _AddReviewDialogState();
}

class _AddReviewDialogState extends State<AddReviewDialog> {
  bool _isSubmitted = false;

  final TextEditingController _commentController = TextEditingController();
  double _rate = 0;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: _isSubmitted
                ? const AfterReview(key: ValueKey('after'))
                : AddReviewForm(
                    key: const ValueKey('form'),
                    commentController: _commentController,
                    onRateChanged: (value) => _rate = value,
                  ),
          ),
          BlocConsumer<ReviewCubit, ReviewState>(
            listener: (_, state) {
              if (state is AddReviewSuccess) {
                setState(() {
                  _isSubmitted = true;
                });
              }

              if (state is AddReviewError) {
                UIUtils.showMessage(state.message);
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddReviewLoading,
                title: _isSubmitted ? 'Close' : 'Add Review',
                onPressed: _onPressed,
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _onPressed() async {
    if (_isSubmitted) {
      Navigator.pop(context, true);
      return;
    }

    final comment = _commentController.text.trim();

    if (_rate == 0) {
      UIUtils.showMessage('Please select a rating.');
      return;
    }

    if (comment.isEmpty) {
      UIUtils.showMessage('Please write a comment.');
      return;
    }

    await context.read<ReviewCubit>().addReview(
      CreateReviewRequest(
        productId: widget.productId,
        comment: comment,
        rating: _rate.toInt(),
      ),
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
                    image: AssetImage(
                      ImageAssets.profileImage,
                      //SecureStorage.getUserData().image!,
                    ),
                  ),
                ),
              ),
        ),
        const SizedBox(height: 10),
        Text(
          "SecureStorage.getUserData().name!",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "How do you rate this product",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        RatingBar.builder(
          initialRating: 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: onRateChanged,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: commentController,
          decoration: InputDecoration(
            hintText: "Your comments",
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
        const SizedBox(height: 16),
      ],
    );
  }
}
