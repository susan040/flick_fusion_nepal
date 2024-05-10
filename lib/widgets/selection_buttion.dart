import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';

class SelectionButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isDisabled;
  final VoidCallback onTap;
  const SelectionButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: isDisabled
                ? Colors.transparent
                : isActive
                    ? AppColors.primaryColor
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border: isDisabled
                ? Border.all(color: AppColors.hintTextColor)
                : isActive
                    ? null
                    : Border.all(color: Colors.grey)),
        child: Text(title,
            style: CustomTextStyles.f14W400(
                color: isDisabled
                    ? AppColors.hintTextColor
                    : isActive
                        ? Colors.white
                        : Colors.black)),
      ),
    );
  }
}
