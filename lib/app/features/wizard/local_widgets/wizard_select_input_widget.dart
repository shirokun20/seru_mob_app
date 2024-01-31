import 'package:flutter/material.dart';
import 'package:seru_mob_app/app/configs/app_style.dart';

class WizardSelectInputWidget extends StatelessWidget {
  const WizardSelectInputWidget({
    super.key,
    required this.label,
    required this.value,
    this.onTap,
  });

  final String label;
  final String value;
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
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        value,
                        style: AppStyle.styleRegular(
                          size: 14,
                          textColor: const Color(0xFF101828),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.arrow_drop_down, size: 20,),
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
