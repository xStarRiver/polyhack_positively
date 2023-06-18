import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

final defaultPinTheme = PinTheme(
  width: 4.h,
  height: 4.h,
  textStyle:
      const TextStyle(fontSize: 16, color: black, fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: colorB7, width: 1.5),
    color: secondaryBGColor,
    borderRadius: const BorderRadius.all(
      Radius.circular(5.0),
    ),
  ),
  margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: colorB7, width: 1.5),
  borderRadius: BorderRadius.circular(5),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
      color: secondaryBGColor, border: Border.all(color: colorB7, width: 1.5)),
);

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBGColor,
      body: SafeArea(
        child: Column(
          children: [
            Platform.isAndroid ? heightSpace15 : const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      arrowBack,
                      color: black,
                      height: 4.h,
                      width: 4.h,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      heightSpace25,
                      heightSpace3,
                      Text('Verify Your Mobile Number', style: blackRegular18),
                      heightSpace10,
                      heightSpace4,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 69),
                        child: Text(
                            'Please check your messages and enter the verification code we just sent you \n+852 12365478',
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            style: colorB7Regular14),
                      ),
                      heightSpace15,
                      Text(
                        'Enter Code Here',
                        style: blackSemiBold16,
                      ),
                      heightSpace10,
                      Pinput(
                          controller: _pinController,
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          onCompleted: (pin) {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                            Navigator.pushReplacementNamed(
                                context, '/BottomNavigation');
                          }),
                      heightSpace15,
                      Text('Didn’t you receive any code?',
                          style: colorB7Regular16),
                      heightSpace5,
                      Text('Resend', style: primarySemiBold18),
                      heightSpace20,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: PrimaryButton(
                          text: 'Continue',
                          onTap: () {
                            Navigator.popUntil(
                                context, (route) => route.isFirst);
                            Navigator.pushReplacementNamed(
                                context, '/BottomNavigation');
                          },
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
