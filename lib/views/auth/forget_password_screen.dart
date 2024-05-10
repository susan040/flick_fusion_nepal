import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/controller/auth/forget_password_controller.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flick_fusion_nepal/utils/image_path.dart';
import 'package:flick_fusion_nepal/utils/validators.dart';
import 'package:flick_fusion_nepal/widgets/custom/custom_elevated_button.dart';
import 'package:flick_fusion_nepal/widgets/custom/custome_textfield.dart';

class ForgetPassworScreen extends StatelessWidget {
  static const String routeName = "/forget-password";
  final c = Get.find<ForgetPasswordController>();
  ForgetPassworScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget Password"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: c.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Image.asset(ImagePath.forgetPassword, height: Get.height/3.5, fit: BoxFit.cover,),
                Text(
                  "You can create new password for your account. Enter your email address assicoted with your account.",
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.f14W400(color: AppColors.hintTextColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                    hint: "Email",
                    validator: Validators.checkEmailField,
                    controller: c.emailController,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(
                  title: "Continue",
                  onTap: c.onForgetPassword,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
