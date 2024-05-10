import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flick_fusion_nepal/controller/splash_controller.dart';
import 'package:flick_fusion_nepal/utils/image_path.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash-screen";
  final c = Get.find<SplashController>();
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImagePath.logo,
              width: Get.width / 1.5,
              height: Get.height / 3,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 10,
            ),
            const CupertinoActivityIndicator(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
