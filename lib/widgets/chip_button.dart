import 'package:flutter/material.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';

class ChipButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  const ChipButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            color: isActive ? AppColors.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.grey)),
        child: Text(
          title,
          style: textTheme.titleMedium!.copyWith(
              color: isActive ? Colors.white : AppColors.hintTextColor),
        ),
      ),
    );
  }
}
