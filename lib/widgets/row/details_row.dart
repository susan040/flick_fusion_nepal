import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';

class DetailRow extends StatelessWidget {
  final String title;
  final String value;
  const DetailRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: CustomTextStyles.f16W400(color: AppColors.primaryColor),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: CustomTextStyles.f16W400(color: AppColors.textColor),
            ),
          )
        ],
      ),
    );
  }
}
