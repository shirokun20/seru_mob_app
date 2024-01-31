import 'package:flutter/material.dart';
import 'package:seru_mob_app/app/configs/app_style.dart';

class WizardPhotoWidget extends StatelessWidget {
  const WizardPhotoWidget({
    super.key,
    this.widget,
    required this.label,
    required this.hint,
    this.onTap,
  });

  final String label;
  final Widget? widget;
  final String hint;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppStyle.styleRegular(
                size: 14,
                textColor: const Color(0xFF101828),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
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
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: widget ??
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            "Choose File",
                            style: AppStyle.styleRegular(
                              size: 10,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            hint,
                            style: AppStyle.styleRegular(
                              size: 14,
                              textColor: const Color(0xFF101828),
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
