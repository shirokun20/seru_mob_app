import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seru_mob_app/app/configs/app_style.dart';
import 'package:seru_mob_app/app/features/wizard/view_model/wizard_3_view_model.dart';

class Wizard3View extends GetView<Wizard3ViewModel> {
  const Wizard3View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _main(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text(
        "Final",
        style: AppStyle.styleBold(
          size: 15,
          textColor: Colors.white,
        ),
      ),
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
    );
  }

  Widget _main() {
    return Column(
      children: [
        Expanded(
          child: _content(),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _content() {
    return GetBuilder<Wizard3ViewModel>(
      builder: (ctrl) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Data Before To Api",
                style: AppStyle.styleMedium(
                  size: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Text(
                      ctrl.getPrettyJSONString(
                        ctrl.argument,
                      ),
                      style: AppStyle.styleSemiBold(
                        size: 15,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
