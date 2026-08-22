import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class AddressReview extends StatelessWidget {
  const AddressReview({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("عنوان التوصيل", style: getBoldStyle(color: ColorManager.black, fontSize: 14)),

        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(IconsAssets.location),
            const SizedBox(width: 8,),
            Expanded(
              child: Text(
                'order.address!.fullAddress',
                style: getRegularStyle(color: ColorManager.greyColor, fontSize: 16))
              ),
          ],
        ),
      ],
    );
  }
}
