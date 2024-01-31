import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seru_mob_app/app/configs/app_style.dart';
import 'package:seru_mob_app/app/features/wizard/local_widgets/wizard_footer_btn_widget.dart';
import 'package:seru_mob_app/app/features/wizard/local_widgets/wizard_photo_widget.dart';
import 'package:seru_mob_app/app/features/wizard/view_model/wizard_2_view_model.dart';

class Wizard2View extends GetView<Wizard2ViewModel> {
  const Wizard2View({super.key});

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
        "Form 2",
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
    return GetBuilder<Wizard2ViewModel>(builder: (ctrl) {
      return Column(
        children: [
          Expanded(
            child: _content(),
          ),
          _footer(onTap: () => ctrl.onNextWizard()),
        ],
      );
    });
  }

  Widget _content() {
    return GetBuilder<Wizard2ViewModel>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: WizardPhotoWidget(
                label: "Photo Selfie",
                hint: "No File Chosen",
                widget: controller.photoSelfiePath != null
                    ? Column(
                        children: [
                          Image.file(
                            File(controller.photoSelfiePath!),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          deleteBtn(
                            onTap: () => controller.setSelfie(value: null),
                          ),
                        ],
                      )
                    : null,
                onTap: () {
                  Get.bottomSheet(
                    selectCustom(
                      label: "Choose From",
                      widget: customChooseImage(
                        onTapCamera: () async {
                          final res = await controller.onCamera();
                          if (res == null &&
                              controller.photoSelfiePath != null) {
                            controller.setSelfie(
                                value: controller.photoSelfiePath);
                          } else {
                            controller.setSelfie(value: res);
                          }
                        },
                        onTapGallery: () async {
                          final res = await controller.onGallery();
                          if (res == null &&
                              controller.photoSelfiePath != null) {
                            controller.setSelfie(
                                value: controller.photoSelfiePath);
                          } else {
                            controller.setSelfie(value: res);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: WizardPhotoWidget(
                label: "Photo KTP",
                hint: "No File Chosen",
                widget: controller.photoKtpPath != null
                    ? Column(
                        children: [
                          Image.file(
                            File(controller.photoKtpPath!),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          deleteBtn(
                            onTap: () => controller.setKtp(value: null),
                          ),
                        ],
                      )
                    : null,
                onTap: () {
                  Get.bottomSheet(
                    selectCustom(
                      label: "Choose From",
                      widget: customChooseImage(
                        onTapCamera: () async {
                          final res = await controller.onCamera();
                          if (res == null && controller.photoKtpPath != null) {
                            controller.setKtp(value: controller.photoKtpPath);
                          } else {
                            controller.setKtp(value: res);
                          }
                        },
                        onTapGallery: () async {
                          final res = await controller.onGallery();
                          if (res == null && controller.photoKtpPath != null) {
                            controller.setKtp(value: controller.photoKtpPath);
                          } else {
                            controller.setKtp(value: res);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: WizardPhotoWidget(
                label: "Photo Biasa",
                hint: "No File Chosen",
                widget: controller.photoBiasaPath != null
                    ? Column(
                        children: [
                          Image.file(
                            File(controller.photoBiasaPath!),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          deleteBtn(
                            onTap: () => controller.setBiasa(value: null),
                          ),
                        ],
                      )
                    : null,
                onTap: () {
                  Get.bottomSheet(
                    selectCustom(
                      label: "Choose From",
                      widget: customChooseImage(
                        onTapCamera: () async {
                          final res = await controller.onCamera();
                          if (res == null &&
                              controller.photoBiasaPath != null) {
                            controller.setBiasa(
                                value: controller.photoBiasaPath);
                          } else {
                            controller.setBiasa(value: res);
                          }
                        },
                        onTapGallery: () async {
                          final res = await controller.onGallery();
                          if (res == null &&
                              controller.photoBiasaPath != null) {
                            controller.setBiasa(
                                value: controller.photoBiasaPath);
                          } else {
                            controller.setBiasa(value: res);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget deleteBtn({
    void Function()? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Delete Selected Picture",
                  style: AppStyle.styleMedium(
                    size: 15,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customChooseImage({
    void Function()? onTapGallery,
    void Function()? onTapCamera,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          btnCustom(
            label: "Gallery",
            onTap: onTapGallery,
          ),
          const SizedBox(
            width: 10,
          ),
          btnCustom(
            label: "Camera",
            icon: Icons.camera_alt,
            bgColor: Colors.redAccent,
            onTap: onTapCamera,
          ),
        ],
      ),
    );
  }

  Widget btnCustom({
    Color bgColor = Colors.blueAccent,
    IconData icon = Icons.image,
    String label = "",
    void Function()? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  label,
                  style: AppStyle.styleMedium(
                    size: 15,
                    textColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectCustom({String label = "", Widget? widget}) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Text(
              label,
              style: AppStyle.styleSemiBold(
                size: 14,
                textColor: const Color(0xFF101828),
              ),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xFFD0D5DD),
          ),
          widget ?? const SizedBox(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _footer({
    void Function()? onTap,
  }) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(
        bottom: 25,
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          const Spacer(),
          WizardFooterBtnWidget(
            onTap: onTap,
            isDisabled: false,
          ),
        ],
      ),
    );
  }
}
