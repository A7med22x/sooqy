import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sooqy/features/home/presentation/widgets/offer_card.dart';

class OfferListView extends StatelessWidget {
  const OfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
            options: CarouselOptions(
              height: 165,
              viewportFraction: 1,
              autoPlay: true,
            ),
            items:[
              OfferCard(),
              OfferCard(),
              OfferCard(),
            ]
          );
  }
}
