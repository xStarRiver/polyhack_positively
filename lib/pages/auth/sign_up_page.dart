import 'dart:io';

import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isCreatePassSecured = true;
  bool _isConfirmPassSecured = true;
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
                      color: white,
                      height: 4.h,
                      width: 4.h,
                    ),
                  ),
                  widthSpace2,
                  Text('Sign Up', style: whiteSemiBold20)
                ],
              ),
            ),
            heightSpace25,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      heightSpace2,
                      const AuthTextField(
                        labelText: 'Name',
                        hintText: 'Enter your name',
                      ),
                      heightSpace25,
                      const AuthTextField(
                        labelText: 'Email Address',
                        hintText: 'Enter your email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      heightSpace25,
                      const AuthTextField(
                        labelText: 'Phone Number',
                        hintText: 'Enter your phonenumber',
                        keyboardType: TextInputType.number,
                      ),
                      heightSpace25,
                      AuthTextField(
                        labelText: 'Create Password',
                        hintText: 'Enter your password',
                        obscureText: _isCreatePassSecured,
                        maxLines: 1,
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() =>
                              _isCreatePassSecured = !_isCreatePassSecured),
                          child: Icon(
                            _isCreatePassSecured
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: grey,
                          ),
                        ),
                      ),
                      heightSpace25,
                      AuthTextField(
                        labelText: 'Confirm Password',
                        hintText: 'Enter your password',
                        obscureText: _isConfirmPassSecured,
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() =>
                              _isConfirmPassSecured = !_isConfirmPassSecured),
                          child: Icon(
                            _isConfirmPassSecured
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: grey,
                          ),
                        ),
                      ),
                      heightSpace30,
                      const PrimaryButton(
                        text: 'Sign Up',
                        navigate: 'VerificationPage',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child:
                            Center(child: Text('OR', style: colorB7Regular16)),
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
                          Text('Already have an account? ',
                              style: colorB7Regular16),
                          GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Text('Sign In', style: primaryBold16))
                        ],
                      ),
                      heightSpace20
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
