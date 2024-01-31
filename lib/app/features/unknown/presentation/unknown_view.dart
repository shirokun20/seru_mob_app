import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnknownView extends GetView {
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'No route defined for this page',
        ),
      ),
    );
  }
}
