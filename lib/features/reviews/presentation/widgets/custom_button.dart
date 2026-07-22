import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/core/widgets/loading_indicator.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final bool isLoading;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          isEnabled ? ColorManager.primaryColor : ColorManager.grey,
        ),
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(60)),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      child: isLoading
          ? const LoadingIndicator()
          : AutoSizeText(
              title,
              textAlign: TextAlign.end,
              style: getBoldStyle(color: ColorManager.white, fontSize: 16),
              maxLines: 1,
            ),
    );
  }
}
