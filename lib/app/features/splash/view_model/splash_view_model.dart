import 'package:get/get.dart';
import 'package:seru_mob_app/app/base/base_view_model.dart';
import 'package:seru_mob_app/app/configs/app_route.dart';

class SplashViewModel extends BaseViewModel {

  @override
  void onInit() {
    Future.delayed(1.seconds, () => routeToWizard1());
    super.onInit();
  }  

  void routeToWizard1() {
    Get.offNamed(AppRouteName.wizard1);
  }
}