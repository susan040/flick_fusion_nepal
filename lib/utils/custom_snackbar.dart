import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';

class CustomSnackBar {
  static success({String? title, String? message}) {
    Get.snackbar(title ?? "Successful", message ?? "The action was successful!",
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.backGroundColor);
  }

  static info({String? title, required String message}) {
    Get.snackbar(title ?? "Info", message,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        backgroundColor: AppColors.onBackGroundColor,
        colorText: AppColors.primaryColor);
  }

  static error({String? title, String? message}) {
    Get.snackbar(
        title ?? "Error!", message ?? "Unknown error! Please try again later!",
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        backgroundColor: AppColors.errorColor,
        colorText: Colors.white);
  }
}
