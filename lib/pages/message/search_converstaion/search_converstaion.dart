import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class SearchConverstaion extends StatelessWidget {
  const SearchConverstaion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map recentSearch = {
      'xstarrover': user1,
      'Tommy': user2,
     
    };
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(20).copyWith(bottom: 0),
            child: Text('Recent Searches', style: color94SemiBold14),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              itemCount: recentSearch.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(right: 5)
                      : index == recentSearch.length - 1
                          ? const EdgeInsets.only(left: 5)
                          : const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: primaryColor,
                        backgroundImage:
                            AssetImage(recentSearch.values.toList()[index]),
                      ),
                      heightSpace5,
                      Text(recentSearch.keys.toList()[index],
                          style: blackRegular14)
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  PreferredSize appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(130),
      child: AppBar(
        backgroundColor: appBarColor,
        centerTitle: false,
        titleSpacing: -7,
        elevation: 3,
        shadowColor: colorForShadow.withOpacity(.30),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10).copyWith(bottom: 8.5),
                child: Image.asset(arrowBack))),
        title: Text('Search Conversation', style: blackSemiBold20),
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: white,
              borderRadius: borderRadius10,
              boxShadow: [primaryBS],
            ),
            child: Row(
              children: [
                Image.asset(
                  searchIcon,
                  color: color94,
                  height: 16,
                ),
                widthSpace10,
                Expanded(
                  child: TextField(
                    enabled: true,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Search here...',
                      hintStyle: color94Regular14,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
