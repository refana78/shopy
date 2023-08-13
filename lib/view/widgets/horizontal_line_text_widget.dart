import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_text.dart';

class HorizontalLineTextWidget extends StatelessWidget {
  final String text;
  final double height;
  const HorizontalLineTextWidget({
    super.key,
    required this.text,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            child: Divider(
              color: AppColor.greyColor,
              height: height,
            ),
          ),
        ),
        Text(
          text,
          style: AppText.montserrat12.copyWith(
            fontSize: 14,
            color: AppColor.blackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            child: Divider(
              color: AppColor.greyColor,
              height: height,
            ),
          ),
        ),
      ],
    );
  }
}
