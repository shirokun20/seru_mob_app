import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seru_mob_app/app/features/splash/view_model/splash_view_model.dart';

class SplashView extends GetView<SplashViewModel> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return const Scaffold(
      body: Center(
        child: Text(
          'Halaman\nSplash Screen',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}