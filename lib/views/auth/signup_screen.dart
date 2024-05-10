import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/controller/auth/signup_controller.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/image_path.dart';
import 'package:flick_fusion_nepal/utils/validators.dart';
import 'package:flick_fusion_nepal/views/auth/login_screen.dart';
import 'package:flick_fusion_nepal/widgets/custom/custom_elevated_button.dart';
import 'package:flick_fusion_nepal/widgets/custom/custome_passwordfiled.dart';
import 'package:flick_fusion_nepal/widgets/custom/custome_textfield.dart';

import '../../utils/custom_text_styles.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = "/signup-screen";
  final c = Get.find<SignUpController>();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: c.formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImagePath.logo,
                      height: Get.height / 4,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Register",
                      style: CustomTextStyles.f18W600(
                          color: AppColors.primaryColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Create your new account",
                      style: CustomTextStyles.f16W400(
                          color: AppColors.primaryColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        labelText: "First Name",
                        controller: c.nameController,
                        hint: "First Name",
                        validator: Validators.checkFieldEmpty,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        labelText: "Last Name",
                        controller: c.lastNameController,
                        hint: "Last Name",
                        validator: Validators.checkFieldEmpty,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        labelText: "Email",
                        controller: c.emailController,
                        hint: "Email",
                        validator: Validators.checkEmailField,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 16,
                    ),
                    Obx(
                      () => CustomPasswordField(
                          labelText: "Password",
                          hint: "Password",
                          eye: c.passwordObscure.value,
                          onEyeClick: c.onEyeCLick,
                          controller: c.passwordController,
                          textInputAction: TextInputAction.done),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomElevatedButton(
                      title: "Register",
                      onTap: c.onSubmit,
                    ),
                    Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already a member?",
                          style: CustomTextStyles.f16W400(
                            color: AppColors.hintTextColor,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.offNamed(LoginScreen.routeName);
                            },
                            child: Text(
                              "Log In",
                              style: CustomTextStyles.f16W400(
                                color: AppColors.primaryColor,
                              ),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
