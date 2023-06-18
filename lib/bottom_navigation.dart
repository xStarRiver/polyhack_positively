import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:positively/pages/home/home_page.dart';
import 'package:positively/pages/message/message.dart';
import 'package:positively/pages/profile/profile.dart';
import 'package:positively/utils/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'pages/notification/notification_page.dart';

class BottomNavigation extends StatefulWidget {
  final int? initialIndex;
  const BottomNavigation({
    Key? key,
    this.initialIndex,
  }) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  DateTime? currentBackPressTime;
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const NotificationPage(),
    const Message(),
    const Profile()
  ];
  @override
  void initState() {
    selectedIndex = widget.initialIndex ?? 0;
    super.initState();
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 7.h,
          width: 7.h,
          child: FloatingActionButton(
            backgroundColor: white,
            onPressed: () => Navigator.pushNamed(context, '/NewPost'),
            child: Container(
              height: 6.5.h,
              width: 6.5.h,
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: white,
                size: 2.8.h,
              ),
            ),
          ),
        ),
        bottomNavigationBar: StylishBottomBar(
          items: [
            BottomBarItem(
                icon: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    bN1,
                    color: selectedIndex == 0 ? black : colorB7,
                  ),
                ),
                title: const Text('Home')),
            BottomBarItem(
                icon: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    bN2,
                    color: selectedIndex == 1 ? black : colorB7,
                  ),
                ),
                title: const Text('Home')),
            BottomBarItem(
                icon: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    bN3,
                    color: selectedIndex == 2 ? black : colorB7,
                  ),
                ),
                title: const Text('Home')),
            BottomBarItem(
                icon: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    bN4,
                    color: selectedIndex == 3 ? black : colorB7,
                  ),
                ),
                title: const Text('Home')),
          ],
          option: AnimatedBarOptions(
            iconSize: 32,
            barAnimation: BarAnimation.fade,
            iconStyle: IconStyle.simple,
            opacity: 0.3,
            // opacity: 0.3,
          ),
          // iconSize: 32,
          // barAnimation: BarAnimation.fade,
          backgroundColor: white,
          // iconStyle: IconStyle.simple,
          hasNotch: false,
          fabLocation: StylishBarFabLocation.center,
          // opacity: 0.3,
          currentIndex: selectedIndex,
          // barStyle: BubbleBarStyle.horizotnal,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        body: _widgetOptions.elementAt(selectedIndex),
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
