import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_text.dart';
import 'types/button_type.dart';

class ButtonWidget extends StatelessWidget {
  final ButtonType type;
  final String text;
  final Color? textColor;
  final Function()? onPressed;
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: (type == ButtonType.transparent) ? 0 : 2,
          shadowColor: (type == ButtonType.transparent)
              ? Colors.transparent
              : AppColor.primaryColor.withOpacity(0.5),
          backgroundColor: (type == ButtonType.primary)
              ? AppColor.primaryColor
              : (type == ButtonType.secondary)
                  ? AppColor.greyColor
                  : (type == ButtonType.third)
                      ? AppColor.whiteColor
                      : Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppText.montserrat16.copyWith(
            color: (textColor != null) ? textColor : AppColor.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
