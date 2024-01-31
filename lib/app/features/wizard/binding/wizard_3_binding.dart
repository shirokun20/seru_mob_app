import 'package:get/get.dart';
import 'package:seru_mob_app/app/features/wizard/view_model/wizard_3_view_model.dart';

class Wizard3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Wizard3ViewModel(), fenix: true);
  } 
}