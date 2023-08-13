import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopy/view/pages/auth/forgot_password_page.dart';
import 'package:shopy/view/pages/auth/sign_up_page.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_text.dart';
import '../../widgets/auth_header_widget.dart';
import '../../widgets/button_ms_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/horizontal_line_text_widget.dart';
import '../../widgets/input_widget.dart';
import '../../widgets/types/input_type.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool rememberMe = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const AuthHeaderWidget(
              title: 'Welcome back',
              description:
                  'Please fill E-mail & password to login your \nShopy application account.',
            ),
            const SizedBox(
              height: 38,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 22,
                  height: 22,
                  child: Checkbox(
                    activeColor: AppColor.greenColor,
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = !rememberMe;
                      });
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password ?',
                    style: AppText.montserrat12.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ButtonWidget(
              text: 'Sign In',
              onPressed: () {},
            ),
            const SizedBox(
              height: 50,
            ),
            const HorizontalLineTextWidget(
              text: 'Or sign in with',
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
                    text: 'Don’t have an account? ',
                    style: AppText.montserrat12.copyWith(
                      color: AppColor.blackColor,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
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
