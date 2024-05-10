import 'package:get/get.dart';
import 'package:flick_fusion_nepal/controller/core_controller.dart';
import 'package:flick_fusion_nepal/views/auth/login_screen.dart';
import 'package:flick_fusion_nepal/views/dashboard/dashscreen.dart';

class SplashController extends GetxController{
  final coreController = Get.find<CoreController>();

  @override
  void onInit() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (coreController.isUserLoggedIn()) {
          Get.offAndToNamed(DashScreen.routeName);
        } else {
          Get.offAllNamed(LoginScreen.routeName);
        }
      },
    );
    super.onInit();
  }

}