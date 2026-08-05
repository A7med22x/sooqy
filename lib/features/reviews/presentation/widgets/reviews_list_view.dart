import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/widgets/error_indicator.dart';
import 'package:sooqy/core/widgets/loading_indicator.dart';
import 'package:sooqy/features/reviews/domin/entities/review.dart';
import 'package:sooqy/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:sooqy/features/reviews/presentation/cubit/review_states.dart';
import 'package:sooqy/features/reviews/presentation/widgets/review_item.dart';

class ReviewsListView extends StatefulWidget {
  const ReviewsListView({super.key, required this.pID});
  final String pID;

  @override
  State<ReviewsListView> createState() => _ReviewsListViewState();
}

class _ReviewsListViewState extends State<ReviewsListView> {
  late final ScrollController scrollController;
  
  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * .7) {
        context.read<ReviewCubit>().loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        if (state is GetReviewsError) {
          return ErrorIndicator(state.message);
        } else if (state is GetReviewsLoading) {
          return LoadingIndicator();
        } else if (state is GetReviewsSuccess) {
          return SizedBox(
            height: 800,
            child: ListView.builder(
              controller: scrollController,
              itemCount: state.reviews.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: ReviewItem(review: state.reviews[index]),
                );
              },
            ),
          );
        } else {
          return SizedBox();
        }
      },
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ReviewItem(
            review: Review(
              comment: "comment",
              rating: 5,
              createdAt: DateTime(2023),
              userName: "userName",
              userPicture: '',
            ),
          ),
        );
      },
    );
  }
}
