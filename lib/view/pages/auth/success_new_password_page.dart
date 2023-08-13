import 'package:flutter/material.dart';
import 'package:shopy/utils/app_color.dart';
import 'package:shopy/utils/app_text.dart';
import 'package:shopy/view/pages/auth/sign_in_page.dart';

import '../../widgets/button_widget.dart';

class SuccessNewPasswordPage extends StatefulWidget {
  const SuccessNewPasswordPage({super.key});

  @override
  State<SuccessNewPasswordPage> createState() => _SuccessNewPasswordPageState();
}

class _SuccessNewPasswordPageState extends State<SuccessNewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Column(
              children: [
                Container(
                  height: 130,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/success.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Password Reset Successful',
                  textAlign: TextAlign.center,
                  style: AppText.montserrat16.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'You have successfully reset your password.Please use your new password when logging in',
                  textAlign: TextAlign.center,
                  style: AppText.roboto12.copyWith(
                    fontSize: 14,
                    color: AppColor.greyColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 55),
              child: ButtonWidget(
                text: 'Login',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
