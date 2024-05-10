import 'package:flutter/material.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';

ThemeData basicTheme() {
  return ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColors.primaryColor,
          secondary: AppColors.primaryColor,
          background: AppColors.backGroundColor,
          onBackground: AppColors.onBackGroundColor,
          error: AppColors.errorColor));
}
