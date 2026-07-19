import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/routes/routes.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    this.enabled = true,
    this.onSubmitted,
    this.onChanged,
    this.hint,
  });
  final bool enabled;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final String? hint;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        boxShadow: [
          BoxShadow(
            color: ColorManager.white, //Color.fromARGB(11, 0, 0, 0)
            blurRadius: 9,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        onTap: () {
          if (!widget.enabled) {
            Navigator.pushNamed(context, Routes.search);
          }
        },
        readOnly: !widget.enabled,
        decoration: customDecoration(context),
        cursorColor: ColorManager.primaryColor,
        textInputAction: TextInputAction.search,
      ),
    );
  }

  InputDecoration customDecoration(BuildContext context) {
    return InputDecoration(
      hintText:
          'What are you looking for?', //hintText: widget.hint ?? S.of(context).searchHint,
      hintStyle: getRegularStyle(
        color: ColorManager.greyColor,
        fontSize: 13.sp,
      ),
      filled: true,
      fillColor: ColorManager
          .productColor, //fillColor: Theme.of(context).colorScheme.surface,
      contentPadding: const EdgeInsets.all(0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide.none,
      ),
      prefixIcon: SvgPicture.asset(
        IconsAssets.search,
        // ignore: deprecated_member_use
        color: ColorManager.primaryColor,
        fit: BoxFit.scaleDown,
      ),

      suffixIcon: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.search);
        },
        child: SvgPicture.asset(IconsAssets.filter, fit: BoxFit.scaleDown),
      ),
    );
  }

  // void showFilterBottomSheet(BuildContext context) {
  //   double minPrice = 0;
  //   double maxPrice = 10000;
  //   RangeValues rangeValues = const RangeValues(0, 1500);
  //   final SearchCubit searchCubit = context.read<SearchCubit>();
  //   showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     isScrollControlled: true,
  //     builder: (context) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           return Padding(
  //             padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: [
  //                 Center(
  //                   child: Container(
  //                     width: 40,
  //                     height: 4,
  //                     decoration: BoxDecoration(
  //                       color: Colors.grey.shade400,
  //                       borderRadius: BorderRadius.circular(2),
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(height: 20),
  //                 const Text(
  //                   "تصنيف حسب :",
  //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  //                   textAlign: TextAlign.right,
  //                 ),
  //                 const SizedBox(height: 16),
  //                 const Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text("السعر :", style: TextStyle(fontSize: 16)),
  //                     Icon(Icons.monetization_on_outlined),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 12),
  //                 Row(
  //                   children: [
  //                     Expanded(
  //                       child: TextFormField(
  //                         enabled: false,
  //                         decoration: InputDecoration(
  //                           hintText: 'What are you looking for?',//hintText: rangeValues.start.toInt().toString(),
  //                           hintStyle: getRegularStyle(color: ColorManager.greyColor,fontSize: 13.sp),
  //                           disabledBorder: const OutlineInputBorder(
  //                             borderSide: BorderSide(color: Colors.black12),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                     const SizedBox(width: 16),
  //                     const Text("إلي"),
  //                     const SizedBox(width: 16),
  //                     Expanded(
  //                       child: TextFormField(
  //                         enabled: false,
  //                         decoration: InputDecoration(
  //                           hintText: rangeValues.end.toInt().toString(),
  //                           hintStyle: TextStyles.semiBold16.copyWith(
  //                             color:
  //                                 Theme.of(context).textTheme.bodyLarge!.color,
  //                           ),
  //                           disabledBorder: const OutlineInputBorder(
  //                             borderSide: BorderSide(color: Colors.black12),
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 24),
  //                 RangeSlider(
  //                   values: rangeValues,
  //                   min: minPrice,
  //                   max: maxPrice,
  //                   divisions: 50,
  //                   activeColor: ColorManager.primaryColor,
  //                   labels: RangeLabels(
  //                     "${rangeValues.start.round()} ${S.of(context).egp}",
  //                     "${rangeValues.end.round()} ${S.of(context).egp}",
  //                   ),
  //                   onChanged: (RangeValues values) {
  //                     setState(() {
  //                       rangeValues = values;
  //                     });
  //                   },
  //                 ),
  //                 const SizedBox(height: 8),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text("${minPrice.toInt()} ${S.of(context).egp}"),
  //                     Text("${maxPrice.toInt()} ${S.of(context).egp}"),
  //                   ],
  //                 ),
  //                 const SizedBox(height: 32),
  //                 CustomButton(
  //                   title: "تصفية",
  //                   onPressed: () {
  //                     log(searchCubit.catName);
  //                     searchCubit.searchProducts(
  //                       minPrice: rangeValues.start.toInt(),
  //                       maxPrice: rangeValues.end.toInt(),
  //                       sortOrder: 'desc',
  //                     );
  //                     Navigator.pop(context);
  //                   },
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
}
