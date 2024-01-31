import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seru_mob_app/app/configs/app_const.dart';
import 'package:seru_mob_app/app/configs/app_route.dart';
import 'package:seru_mob_app/app/service/api_service.dart';
import 'package:seru_mob_app/app/service/app_service.dart';
import 'package:seru_mob_app/app/utils/network_util.dart';
import 'package:seru_mob_app/app/utils/storage_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await _di();
  runApp(const MainApp());
}

Future _di() async {
  final storage = StorageUtil(GetStorage());
  Get.lazyPut(() => storage, fenix: true);
  Get.put(ApiService(NetworkUtil.dioClient()));
  Get.put(AppService(storage));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConst.appName,
      initialRoute: AppRouteName.defaultRoute,
      unknownRoute: AppRoutePage.unknownRoute,
      getPages: AppRoutePage.pages,
    );
  }
}
