import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/font_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/widgets/custom_auto_size_text.dart';

class CartCard extends StatefulWidget {
  const CartCard({super.key});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  bool addLoading = false;
  bool removeLoading = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorManager.lightPrimaryColor, width: 2),
      ),
      child: Row(
        children: [
          Container(
            height: .infinity,
            width: 84,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ColorManager.lightPrimaryColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: 
                  'https://s.turbifycdn.com/aah/yhst-92803816272180/jbw-jb-6219-g-krypton-mens-chronograph-quartz-watch-22.jpg',
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.image_not_supported_outlined, size: 50),
              ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAutoSizeText(
                  data: 'Accessories',
                  textStyle: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s16,
                  ),
                  maxLines: 2,
                ),
                Text(
                  '3.0 gm',
                  style: getRegularStyle(
                    color: ColorManager.secColor,
                    fontSize: FontSize.s14,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        addLoading = true;
                        counter++;
                        addLoading = false;
                        setState(() {});
                      },
                      radius: 12,
                      borderRadius: BorderRadius.circular(12),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: ColorManager.primaryColor,
                        child: addLoading
                            ? Lottie.asset(AnimationsAssets.loading)
                            : const Icon(
                                Icons.add,
                                size: 18,
                                color: ColorManager.white,
                              ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$counter',
                      style: getBoldStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        removeLoading = true;
                        if (counter > 0) counter--;
                        removeLoading = false;
                        setState(() {});
                      },
                      radius: 12,
                      borderRadius: BorderRadius.circular(12),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: ColorManager.lightSecColor,
                        child: removeLoading
                            ? Lottie.asset(AnimationsAssets.loading)
                            : const Icon(
                                Icons.remove,
                                size: 18,
                                color: ColorManager.white,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              InkWell(onTap: () {}, child: SvgPicture.asset(IconsAssets.trash)),
              const Spacer(),
              Text(
                '550',
                style:
                    getSemiBoldStyle(
                      color: ColorManager.gradiant2,
                      fontSize: FontSize.s16,
                    ).copyWith(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: ColorManager.gradiant2,
                    ),
              ),
              Text(
                '500 EGP',
                style: getBoldStyle(
                  color: ColorManager.secColor,
                  fontSize: FontSize.s20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
