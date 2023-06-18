import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:positively/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

List _onBoardingList = [
  {
    'image': onBoard1,
    'title': 'Positive Communication ',
    'subtitle': 'Supportive and Uplifting Online Environment.',
  },
  {
    'image': onBoard2,
    'title': 'Customizability',
    'subtitle':
        'Empowers users to tailor the sensitivity of the positive word replacement feature',
  },
  {
    'image': onBoard3,
    'title': 'Mental Health Focus',
    'subtitle':
        'Contributes to a healthier online environment and reduces the risk of mental health issues associated with online interactions.',
  },
];

class _OnBoardingPageState extends State<OnBoardingPage> {
  DateTime? currentBackPressTime;
  int _pageIndex = 0;
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        }
        return false;
      },
      child: Scaffold(
        backgroundColor: secondaryBGColor,
        body: Column(
          children: [
            Expanded(
                child: PageView.builder(
              onPageChanged: (value) => setState(() => _pageIndex = value),
              itemCount: _onBoardingList.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                var item = _onBoardingList[index];
                return Column(
                  children: [
                    heightSpace50,
                    const Spacer(),
                    Center(
                      child: Image.asset(
                        item['image'],
                        height: 236,
                      ),
                    ),
                    const Spacer(),
                    Text(item['title'], style: blackSemiBold20),
                    heightSpace6,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        item['subtitle'],
                        style: blackRegular14,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    heightSpace18,
                  ],
                );
              },
            )),
            SmoothPageIndicator(
                controller: _pageController,
                count: _onBoardingList.length,
                effect: const ExpandingDotsEffect(
                    dotColor: black,
                    activeDotColor: primaryColor,
                    dotHeight: 8,
                    dotWidth: 8),
                onDotClicked: (index) {}),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _pageIndex == _onBoardingList.length - 1
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () {
                            if (_pageIndex != _onBoardingList.length - 1) {
                              _pageController.animateToPage(
                                  _onBoardingList.length - 1,
                                  duration: const Duration(milliseconds: 1500),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            }
                          },
                          child: Text('Skip', style: blackBold16)),
                  GestureDetector(
                      onTap: () {
                        if (_pageIndex != _onBoardingList.length - 1) {
                          _pageController.animateToPage(_pageIndex + 1,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.fastLinearToSlowEaseIn);
                        } else {
                          Navigator.pushReplacementNamed(
                              context, '/SignInPage');
                        }
                      },
                      child: Text(
                          _pageIndex == _onBoardingList.length - 1
                              ? 'Login'
                              : 'Next',
                          style: primaryBold16)),
                ],
              ),
            )
          ],
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
