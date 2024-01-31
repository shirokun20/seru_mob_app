import 'package:get/get.dart';
import 'package:seru_mob_app/app/features/splash/view_model/splash_view_model.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashViewModel(), fenix: true);
  }
}