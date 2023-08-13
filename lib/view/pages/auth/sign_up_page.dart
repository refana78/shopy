import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopy/view/pages/auth/sign_in_page.dart';
import 'package:shopy/view/widgets/auth_header_widget.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_text.dart';
import '../../widgets/button_ms_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/horizontal_line_text_widget.dart';
import '../../widgets/input_widget.dart';
import '../../widgets/types/input_type.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const AuthHeaderWidget(
              title: 'Sign Up',
            ),
            const SizedBox(
              height: 38,
            ),
            const InputWidget(
              labelText: 'Name',
              hintText: 'John Doe',
            ),
            const InputWidget(
              labelText: 'Email',
              hintText: 'example@gmail.com',
              type: InputType.email,
            ),
            InputWidget(
              labelText: 'Password',
              hintText: '**********',
              type: InputType.password,
              showPassword: showPassword,
              onTapPassword: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
            ),
            const SizedBox(
              height: 22,
            ),
            ButtonWidget(
              text: 'Sign Up',
              onPressed: () {},
            ),
            const SizedBox(
              height: 50,
            ),
            const HorizontalLineTextWidget(
              text: 'Or sign up with',
              height: 1,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ButtonMSWidget(
                    logo: 'assets/img/fb.png',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ButtonMSWidget(
                    logo: 'assets/img/google.png',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                    text: 'Already have an account? ',
                    style: AppText.montserrat12.copyWith(
                      color: AppColor.blackColor,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const SignInPage(),
                              ),
                            );
                          },
                        style: AppText.montserrat12.copyWith(
                          color: AppColor.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ]),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
