import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flick_fusion_nepal/model/access_token.dart';
import 'package:flick_fusion_nepal/model/user.dart';
import 'package:flick_fusion_nepal/utils/storage_helper.dart';
import 'package:flick_fusion_nepal/views/auth/login_screen.dart';

class CoreController extends GetxController {
  Rx<User?> currentUser = Rxn<User>();
  Rx<AccessToken?> accessToken = Rxn<AccessToken>();

  @override
  onInit(){
    loadCurrentUser();
    super.onInit();
  }

  Future<void> loadCurrentUser() async {
    currentUser.value = StorageHelper.getUser();
    accessToken.value = StorageHelper.getToken();
  }
  
  bool isUserLoggedIn() {
    return currentUser.value != null;
  }

  void logOut() async {
    final box = GetStorage();
    await box.write(StorageKeys.ACCESS_TOKEN, null);
    await box.write(StorageKeys.USER, null);
    loadCurrentUser();
    Get.offAllNamed(LoginScreen.routeName);
  }

}
