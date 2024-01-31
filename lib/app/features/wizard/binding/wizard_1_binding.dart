import 'package:get/get.dart';
import 'package:seru_mob_app/app/features/wizard/view_model/wizard_1_view_model.dart';

class Wizard1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Wizard1ViewModel(Get.find()), fenix: true);
  } 
}