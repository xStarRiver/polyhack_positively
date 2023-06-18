import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';

class UiHelper {
  static void logOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(20).copyWith(top: 14),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Sure you want to logout?', style: blackSemiBold20),
            heightSpace20,
            Row(
              children: List.generate(
                  2,
                  (index) => Expanded(
                        child: GestureDetector(
                          onTap: index == 0
                              ? () {
                                  Navigator.pop(context);
                                }
                              : () {
                                  Navigator.pushReplacementNamed(
                                      context, '/SignInPage');
                                },
                          child: Container(
                            margin: index == 0
                                ? const EdgeInsets.only(right: 10)
                                : const EdgeInsets.only(left: 10),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 12.5),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    color: index == 0
                                        ? colorForShadow.withOpacity(.25)
                                        : primaryColor)
                              ],
                              color: index == 0 ? white : primaryColor,
                              borderRadius: borderRadius5,
                            ),
                            child: Text(index == 0 ? 'Cancel' : 'Logout',
                                style:
                                    index == 0 ? primaryBold18 : whiteBold18),
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
