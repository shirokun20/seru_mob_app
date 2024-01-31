import 'package:flutter/material.dart';
import 'package:seru_mob_app/app/configs/app_style.dart';

class WizardFooterBtnWidget extends StatelessWidget {
  final bool isDisabled;
  final void Function()? onTap;
  const WizardFooterBtnWidget({
    super.key,
    required this.isDisabled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onTap,
          borderRadius: BorderRadius.circular(5),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Opacity(
              opacity: isDisabled ? 0.5 : 1,
              child: Row(
                children: [
                  Text(
                    "Selanjutnya",
                    style: AppStyle.styleMedium(
                      size: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.chevron_right,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
