import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:flick_fusion_nepal/controller/core_controller.dart';
import 'package:flick_fusion_nepal/utils/config.dart';
import 'package:flick_fusion_nepal/utils/pages.dart';
import 'package:flick_fusion_nepal/utils/theme.dart';
import 'package:flick_fusion_nepal/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const FlickFusionNepal());
}

class FlickFusionNepal extends StatelessWidget {
  const FlickFusionNepal({super.key});

  @override
  Widget build(BuildContext context) {
    return  
    KhaltiScope(
      publicKey: Config.khaltiPublicKeyTest,
      builder: (context, navigatorKey) {
        return GetMaterialApp(
          localizationsDelegates: const [KhaltiLocalizations.delegate],
            navigatorKey: navigatorKey,
          initialBinding: BindingsBuilder(() {
            Get.put(CoreController());
          }),
          debugShowCheckedModeBanner: false,
          getPages: pages,
          theme: basicTheme(),
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}
