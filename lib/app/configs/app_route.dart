import 'package:get/get.dart';
import 'package:seru_mob_app/app/features/splash/binding/splash_binding.dart';
import 'package:seru_mob_app/app/features/splash/presentation/splash_view.dart';
import 'package:seru_mob_app/app/features/unknown/presentation/unknown_view.dart';
import 'package:seru_mob_app/app/features/wizard/binding/wizard_1_binding.dart';
import 'package:seru_mob_app/app/features/wizard/binding/wizard_2_binding.dart';
import 'package:seru_mob_app/app/features/wizard/binding/wizard_3_binding.dart';
import 'package:seru_mob_app/app/features/wizard/presentation/wizard_1_view.dart';
import 'package:seru_mob_app/app/features/wizard/presentation/wizard_2_view.dart';
import 'package:seru_mob_app/app/features/wizard/presentation/wizard_3_view.dart';

class AppRouteName {
  static const String defaultRoute = '/';
  static const String notFound = '/notfound';
  static const String wizard1 = '/wizard1';
  static const String wizard2 = '/wizard2';
  static const String wizard3 = '/wizard3';
}

class AppRoutePage {
  // 
  static List<GetPage> pages = [
    GetPage(
      name: AppRouteName.defaultRoute,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRouteName.wizard1,
      page: () => const Wizard1View(),
      binding: Wizard1Binding(),
    ),
    GetPage(
      name: AppRouteName.wizard2,
      page: () => const Wizard2View(),
      binding: Wizard2Binding(),
    ),
    GetPage(
      name: AppRouteName.wizard3,
      page: () => const Wizard3View(),
      binding: Wizard3Binding(),
    ),
  ];
  // 
  static GetPage unknownRoute = GetPage(
    name: AppRouteName.notFound,
    page: () => const UnknownView(),
  );
}
