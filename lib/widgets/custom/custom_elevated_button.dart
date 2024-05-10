import 'package:flutter/material.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double height;
  final bool isDisabled;
  final Color? backGroundColor;
  final Color? textColor;
  const CustomElevatedButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.height = 55,
      this.isDisabled = false,
      this.backGroundColor = AppColors.primaryColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor,
            minimumSize: Size.fromHeight(height),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: isDisabled ? null : onTap,
        child: Text(
          title,
          style: CustomTextStyles.f16W600(color: textColor ?? Colors.white),
        ));
  }
}
