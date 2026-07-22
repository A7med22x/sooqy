import 'package:flutter/material.dart';
import 'package:sooqy/features/reviews/presentation/widgets/review_item.dart';

class ReviewsListView extends StatefulWidget {
  const ReviewsListView({super.key, required this.pID});
  final String pID;

  @override
  State<ReviewsListView> createState() =>
      _ReviewsListViewState();
}

class _ReviewsListViewState
    extends State<ReviewsListView> {
  late final ScrollController scrollController;

  // List<ReviewModel> reviewsList = [];
  int pageNum = 2;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool isLoading = false;
      scrollController.addListener(() async {
        var maxPosition = scrollController.position.maxScrollExtent;
        var curPosition = scrollController.position.pixels;
        if (curPosition >= maxPosition * .7 && !isLoading) {
          isLoading = true;

          // await context.read<ReviewsCubit>().getProductReviewsById(
          //   id: widget.pID,
          //   pageNum: pageNum++,
          // );
          isLoading = false;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: ListView.builder(
        controller: scrollController,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: ReviewItem(),
          );
        },
      ),
    );
  }
}

class LoadingReviewsList extends StatelessWidget {
  const LoadingReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: ReviewItem(
              // review: ReviewModel(
              //   comment: "comment",
              //   rating: 5,
              //   createdAt: DateTime(2023),
              //   userName: "userName",
              //   userPicture: '',
              // ),
            ),
          );
        },
    );
  }
}
