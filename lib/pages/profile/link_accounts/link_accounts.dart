import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';

class LinkAccounts extends StatelessWidget {
  const LinkAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map linkAccounts = {
      'Facebook': fb,
      'Google': google,
      'Twitter': twitter,
      'Linkdin': linkDin,
    };
    return Scaffold(
        appBar: appBar(),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: List.generate(
              4,
              (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: Row(
                      children: [
                        Image.asset(
                          linkAccounts.values.toList()[index],
                          width: 22,
                          height: index == 0
                              ? 22
                              : index == 1
                                  ? 20
                                  : index == 2
                                      ? 16
                                      : 19,
                        ),
                        widthSpace20,
                        Text(linkAccounts.keys.toList()[index],
                            style: blackSemiBold14)
                      ],
                    ),
                  )),
        ));
  }

  PreferredSize appBar() {
    return const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'Link Accounts',
        ));
  }
}
