import 'package:flutter/material.dart';
import 'package:shopy/view/pages/auth/success_new_password_page.dart';
import 'package:shopy/view/widgets/input_widget.dart';
import 'package:shopy/view/widgets/types/input_type.dart';

import '../../widgets/auth_header_widget.dart';
import '../../widgets/button_widget.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 60),
                  child: AuthHeaderWidget(
                    title: 'New password',
                    description:
                        'Your new password must be different\nfrom previously used passwords.',
                  ),
                ),
                InputWidget(
                  labelText: 'New Password',
                  hintText: '**********',
                  type: InputType.password,
                  showPassword: showPassword,
                  onTapPassword: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
                InputWidget(
                  labelText: 'Confirm Password',
                  hintText: '**********',
                  type: InputType.password,
                  showPassword: showConfirmPassword,
                  onTapPassword: () {
                    setState(() {
                      showConfirmPassword = !showConfirmPassword;
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 55),
              child: ButtonWidget(
                text: 'Update',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SuccessNewPasswordPage(),
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
