import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';

class TitleTextOfAppBar extends StatelessWidget {
  const TitleTextOfAppBar({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getBoldStyle(color: ColorManager.backgroundDark, fontSize: 19.sp),
    );
  }
}