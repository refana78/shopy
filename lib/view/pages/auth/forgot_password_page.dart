import 'package:flutter/material.dart';
import 'package:shopy/utils/app_color.dart';
import 'package:shopy/utils/app_text.dart';
import 'package:shopy/view/pages/auth/recovery_code_page.dart';

import '../../widgets/auth_header_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: const [
            AuthHeaderWidget(
              title: 'Forgot Password',
              description:
                  'Select which contact details should \nwe use to reset your password :',
            ),
            SizedBox(
              height: 70,
            ),
            VerficationWidget(
              icon: 'assets/img/tel.png',
              via: 'via sms : ',
              descVia: '+62 *** **** **78',
            ),
            const SizedBox(
              height: 8,
            ),
            VerficationWidget(
              icon: 'assets/img/mail.png',
              via: 'via email : ',
              descVia: '*****c78@gmail.com',
            ),
          ],
        ),
      ),
    );
  }
}

class VerficationWidget extends StatelessWidget {
  final String icon;
  final String via;
  final String descVia;
  const VerficationWidget({
    super.key,
    required this.icon,
    required this.via,
    required this.descVia,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const RecoveryCodePage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.greyColor,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.greyColor,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Image.asset(
                  icon,
                  width: 28,
                  height: 28,
                ),
              ),
            ),
            const SizedBox(
              width: 23,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    via,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.montserrat12.copyWith(
                      fontSize: 14,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    descVia,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.montserrat12.copyWith(
                      fontSize: 14,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
