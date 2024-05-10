import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:flick_fusion_nepal/controller/core_controller.dart';
import 'package:flick_fusion_nepal/repo/auth/register_repo.dart';
import 'package:flick_fusion_nepal/utils/custom_snackbar.dart';
import 'package:flick_fusion_nepal/views/dashboard/dashscreen.dart';

import '../../utils/storage_helper.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final loading = SimpleFontelicoProgressDialog(
      context: Get.context!, barrierDimisable: false);

  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool passwordObscure = true.obs;

  void onEyeCLick() {
    passwordObscure.value = !passwordObscure.value;
  }

  onSubmit() async {
    if (formKey.currentState!.validate()) {
      loading.show(message: "PLease wiat ..");
      await RegisterRepo.register(
        name: "${nameController.text} ${lastNameController.text}",
        email: emailController.text,
        password: passwordController.text,
        onSuccess: (user, token) async {
          loading.hide();
          final box = GetStorage();
          await box.write(
              StorageKeys.ACCESS_TOKEN, json.encode(token.toJson()));
          await box.write(StorageKeys.USER, json.encode(user.toJson()));
          Get.find<CoreController>().loadCurrentUser();
          Get.offAllNamed(DashScreen.routeName);
          CustomSnackBar.success(
              title: "Sign up", message: "User registered succesfully");
        },
        onError: (message) {
          loading.hide();
          CustomSnackBar.error(title: "Sign up", message: message);
        },
      );
    }
  }
}
