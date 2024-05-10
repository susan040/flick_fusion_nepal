import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flick_fusion_nepal/controller/payment_controller.dart';
import 'package:flick_fusion_nepal/utils/colors.dart';
import 'package:flick_fusion_nepal/utils/custom_text_styles.dart';
import 'package:flick_fusion_nepal/utils/image_path.dart';
import 'package:flick_fusion_nepal/views/dashboard/dashscreen.dart';

class PaymentScreen extends StatelessWidget {
  static const String routeName = "/payment";
  final c = Get.find<PaymentController>();
  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamedUntil(DashScreen.routeName,
            (route) => route.settings.name == DashScreen.routeName);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Payment",
            style: CustomTextStyles.f14W400(),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Payment Method",
                  style: CustomTextStyles.f16W400(),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: c.proceedPayment,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 215, 215, 215),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          ImagePath.khaltiLogo,
                          height: 46,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Khalti",
                          style: CustomTextStyles.f16W400(),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
