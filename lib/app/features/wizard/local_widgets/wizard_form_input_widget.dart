import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seru_mob_app/app/configs/app_style.dart';


class WizardFormInputWidget extends GetView {
  const WizardFormInputWidget(
      {super.key,
      this.label,
      this.hint,
      required this.isTextArea,
      this.controller,
      this.keyboardType,
      this.leftWidget});

  final String? label;
  final String? hint;
  final bool isTextArea;
  @override
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? leftWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label",
          style: AppStyle.styleRegular(
            size: 14,
            textColor: const Color(0xFF101828),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: const Color(0xFF98A2B3),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              leftWidget ?? const SizedBox(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    style: AppStyle.styleRegular(
                      size: 14,
                      textColor: Colors.black,
                    ),
                    keyboardType: keyboardType,
                    maxLines: isTextArea ? 4 : 1,
                    controller: controller,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: hint,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintStyle: AppStyle.styleMedium(
                        size: 14,
                        textColor: const Color(0xFF98A2B3),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
