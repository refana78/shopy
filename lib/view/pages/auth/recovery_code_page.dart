import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopy/view/pages/auth/new_password_page.dart';
import 'package:shopy/view/widgets/button_widget.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_text.dart';
import '../../widgets/auth_header_widget.dart';

class RecoveryCodePage extends StatefulWidget {
  const RecoveryCodePage({super.key});

  @override
  State<RecoveryCodePage> createState() => _RecoveryCodePageState();
}

class _RecoveryCodePageState extends State<RecoveryCodePage> {
  List<FocusNode> _focusNodes = [];
  List<TextEditingController> _controllers = [];
  int pinLength = 4;
  String pin = '';

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(pinLength, (index) => FocusNode());
    _controllers = List.generate(pinLength, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onPinChanged(int index, String value) {
    if (value.length == 1) {
      if (index < pinLength - 1) {
        _focusNodes[index].unfocus();
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
    setState(() {
      pin = _controllers.map((controller) => controller.text).join();
    });
  }

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
                    title: 'Recovery Code',
                    description:
                        'The recovery code was sent to your \nmobile. Code expiration time is 120s.\nPlease enter the code :',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    4,
                    (index) => SizedBox(
                      width: 60,
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _controllers[index],
                        focusNode: _focusNodes[index],
                        style: AppText.montserrat16.copyWith(
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) => _onPinChanged(index, value),
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                        ],
                        decoration: InputDecoration(
                          fillColor: AppColor.white2Color,
                          filled: true,
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
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 55),
              child: ButtonWidget(
                text: 'Send Again',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const NewPasswordPage(),
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
