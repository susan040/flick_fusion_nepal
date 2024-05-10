import 'package:flutter/material.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';

class DataRowValue extends StatelessWidget {
  final String title1;
  final String? title2;
  final String data1;
  final String? data2;
  const DataRowValue({
    super.key,
    required this.title1,
    this.title2,
    required this.data1,
    this.data2,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1,
                  style:
                      CustomTextStyles.f12W400(color: AppColors.hintTextColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  data1,
                  style:
                      CustomTextStyles.f12W600(color: AppColors.primaryColor),
                )
              ],
            ),
          ),
          if (title2 != null)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title2!,
                    style: CustomTextStyles.f12W400(
                        color: AppColors.hintTextColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    data2!,
                    style:
                        CustomTextStyles.f12W600(color: AppColors.primaryColor),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
