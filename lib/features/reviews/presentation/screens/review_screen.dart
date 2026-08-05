import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/di/service_locator.dart';
import 'package:sooqy/features/products/domain/entities/product.dart';
import 'package:sooqy/features/reviews/presentation/cubit/review_cubit.dart';
import 'package:sooqy/features/reviews/presentation/widgets/product_review_view_body.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (BuildContext context) =>
              serviceLocator.get<ReviewCubit>()..loadReviews(product.id),
          child: ProductReviewsViewBody(product: product),
        ),
      ),
    );
  }
}
