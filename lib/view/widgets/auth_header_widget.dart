import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_text.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final String? description;
  const AuthHeaderWidget({
    super.key,
    required this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColor.blackColor,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              title,
              style: AppText.montserrat24.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: AppColor.blackColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: (description != null) ? 16 : 0,
        ),
        (description != null)
            ? Text(
                description!,
                style: AppText.roboto12.copyWith(
                  fontSize: 13,
                  color: AppColor.blackColor.withOpacity(0.7),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
