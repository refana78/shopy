import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_text.dart';
import 'types/input_type.dart';

class InputWidget extends StatelessWidget {
  final InputType type;
  final String? labelText;
  final String? hintText;
  final bool showPassword;
  final Function()? onTapPassword;
  const InputWidget({
    super.key,
    this.type = InputType.text,
    this.labelText,
    this.hintText,
    this.showPassword = false,
    this.onTapPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (labelText != null)
              ? Text(
                  labelText!,
                  style: AppText.montserrat12.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            keyboardType: (type == InputType.email)
                ? TextInputType.emailAddress
                : TextInputType.text,
            style: AppText.montserrat12.copyWith(
              fontSize: 14,
              color: AppColor.blackColor,
            ),
            obscureText: (type == InputType.password && !showPassword),
            decoration: InputDecoration(
              fillColor: AppColor.white2Color,
              filled: true,
              hintText: hintText ?? '',
              hintStyle: AppText.montserrat12.copyWith(
                fontSize: 14,
                color: AppColor.greyColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.greyColor),
                borderRadius: BorderRadius.circular(14.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.greyColor),
                borderRadius: BorderRadius.circular(14.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.greyColor),
                borderRadius: BorderRadius.circular(14.0),
              ),
              suffixIcon: (type == InputType.password)
                  ? GestureDetector(
                      onTap: onTapPassword,
                      child: Icon(
                        (showPassword)
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColor.greyColor,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
