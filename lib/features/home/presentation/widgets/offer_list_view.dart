import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sooqy/core/widgets/error_indicator.dart';
import 'package:sooqy/core/widgets/loading_indicator.dart';
import 'package:sooqy/features/home/presentation/cubit/home_cubit.dart';
import 'package:sooqy/features/home/presentation/cubit/home_states.dart';
import 'package:sooqy/features/home/presentation/widgets/offer_card.dart';

class OfferListView extends StatelessWidget {
  const OfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetOffersLoading) {
          return LoadingIndicator();
        } else if (state is GetOffersError) {
          return ErrorIndicator(state.message);
        } else if (state is GetOffersSuccess) {
          final offers = state.offers.reversed.toList();
          return CarouselSlider(
            options: CarouselOptions(viewportFraction: 1, autoPlay: true),
            items: offers.map((offer) => OfferCard(offer: offer)).toList(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
