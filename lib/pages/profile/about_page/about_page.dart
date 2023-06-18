import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List aboutItems = [
      {
        'title': 'Company Policies',
        'data': [
          'test',
          'test',
        ],
      },
      {
        'title': 'Terms of Use',
        'data': [
          'test',
          'test',
        ],
      },
    ];
    return Scaffold(
      appBar: appBar(),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: aboutItems.length,
        padding: const EdgeInsets.all(20).copyWith(bottom: 0),
        itemBuilder: (context, index) {
          dynamic item = aboutItems[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['title'], style: blackSemiBold18),
                heightSpace2,
                Column(
                  children: List.generate(
                      item['data'].length,
                      (index) =>
                          Text(item['data'][index], style: color94Regular14)),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  PreferredSize appBar() {
    return const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'About',
        ));
  }
}
