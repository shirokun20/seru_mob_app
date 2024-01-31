import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:seru_mob_app/app/base/base_view_model.dart';
import 'package:seru_mob_app/app/features/wizard/model/wizard_data_model.dart';

class Wizard3ViewModel extends BaseViewModel {
  // ignore: unused_field
  final Logger _logger = Logger();
  WizardArgumentModel argument = Get.arguments;

  @override
  void onInit() {
    _logger.i(argument.toJson().toString());
    super.onInit();
  }

  String getPrettyJSONString(jsonObject){
   var encoder = const JsonEncoder.withIndent("     ");
   return encoder.convert(jsonObject);
}
}
