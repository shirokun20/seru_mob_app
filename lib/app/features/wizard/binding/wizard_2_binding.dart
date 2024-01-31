import 'package:get/get.dart';
import 'package:seru_mob_app/app/features/wizard/view_model/wizard_2_view_model.dart';

class Wizard2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Wizard2ViewModel(Get.find()), fenix: true);
  } 
}