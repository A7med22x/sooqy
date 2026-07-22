import 'package:flutter/material.dart';
import 'package:sooqy/features/reviews/presentation/widgets/product_review_view_body.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: ProductReviewsViewBody()),);
  }
}