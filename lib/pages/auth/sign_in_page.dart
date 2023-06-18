import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  DateTime? currentBackPressTime;
  bool _isPassSecured = true;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      child: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: Scaffold(
          backgroundColor: secondaryBGColor,
          body: SafeArea(
              child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Platform.isAndroid ? heightSpace15 : const SizedBox(),
                  Text('Sign In', style: whiteSemiBold20),
                  heightSpace30,
                  const AuthTextField(
                    labelText: 'Email Address',
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  heightSpace25,
                  AuthTextField(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: _isPassSecured,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    suffixIcon: GestureDetector(
                      onTap: () =>
                          setState(() => _isPassSecured = !_isPassSecured),
                      child: Icon(
                        _isPassSecured
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: grey,
                      ),
                    ),
                  ),
                  heightSpace10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forget password?', style: colorB7Regular14),
                    ],
                  ),
                  heightSpace20,
                  const PrimaryButton(
                    text: 'Sign In',
                    navigate: 'SignUpPage',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(child: Text('OR', style: colorB7Regular16)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(12),
                              margin: index == 2
                                  ? EdgeInsets.zero
                                  : const EdgeInsets.only(right: 30),
                              decoration: BoxDecoration(
                                color: grey.withOpacity(0.1),
                                borderRadius: borderRadius10,
                              ),
                              child: Image.asset(
                                index == 0
                                    ? fb
                                    : index == 1
                                        ? google
                                        : twitter,
                              ),
                            )),
                  ),
                  heightSpace20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an account? ', style: colorB7Regular16),
                      GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/SignUpPage'),
                          child: Text('Sign Up', style: primaryBold16))
                    ],
                  )
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: white,
      );
      return false;
    } else {
      return true;
    }
  }
}
