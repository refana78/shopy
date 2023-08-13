import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class ButtonMSWidget extends StatelessWidget {
  final String logo;
  final Function() onPressed;
  const ButtonMSWidget({
    super.key,
    required this.logo,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.greyColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: SizedBox(
          width: 25,
          height: 25,
          child: Image.asset(logo),
        ),
      ),
    );
  }
}
