import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';

class SearchByCategory extends StatelessWidget {
  const SearchByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar(context),
        body: TabBarView(children: [topBar(), accountsBar(), tagsBar()]),
      ),
    );
  }

  PreferredSize appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(160),
      child: AppBar(
        backgroundColor: appBarColor,
        elevation: 3,
        shadowColor: colorForShadow.withOpacity(.30),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10).copyWith(bottom: 8.5),
                child: Image.asset(arrowBack))),
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.5),
            margin: const EdgeInsets.all(20).copyWith(bottom: 50),
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
        bottom: TabBar(
          // padding: EdgeInsets.zero,
          labelStyle: primarySemiBold16,
          unselectedLabelStyle: colorB7SemiBold16,
          unselectedLabelColor: colorB7,
          labelColor: primaryColor,
          indicatorColor: primaryColor,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
          tabs: const [
            Tab(text: 'Top'),
            Tab(text: 'Accounts'),
            Tab(text: 'Tags'),
          ],
        ),
      ),
    );
  }

  ListView topBar() {
    List topSuggestedList = [
      {
        'image': storyBy3,
        'haveStory': true,
        'title': 'Tommy',
        'subtitle': 'nganwai • Following',
      },
    ];
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20).copyWith(bottom: 0),
      children: [
        Text('Suggested', style: blackSemiBold18),
        heightSpace20,
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: topSuggestedList.length,
          itemBuilder: (context, index) {
            int lastIndex = topSuggestedList.length - 1;
            dynamic item = topSuggestedList[index];
            return Padding(
              padding: index == lastIndex
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(bottom: 13),
              child: Row(
                children: [
                  Container(
                    decoration: DottedDecoration(
                      shape: Shape.circle,
                      dash: const [1, 0],
                      strokeWidth: 2.5,
                      color: item['haveStory'] ? primaryColor : transparent,
                    ),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color.fromARGB(255, 28, 33, 37),
                      backgroundImage: AssetImage(item['image']),
                    ),
                  ),
                  widthSpace10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['title'], style: blackSemiBold16),
                      Text(item['subtitle'], style: color94Regular14),
                    ],
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }

  Widget accountsBar() {
    List accountsSuggestedList = [
    {
        'image': storyBy3,
        'haveStory': true,
        'title': 'Tommy',
        'subtitle': 'nganwai • Following',
      },
      
    ];
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20).copyWith(bottom: 0),
      children: [
        Text('Suggested', style: blackSemiBold18),
        heightSpace20,
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: accountsSuggestedList.length,
          itemBuilder: (context, index) {
            int lastIndex = accountsSuggestedList.length - 1;
            dynamic item = accountsSuggestedList[index];
            return Padding(
              padding: index == lastIndex
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(bottom: 13),
              child: Row(
                children: [
                  Container(
                    decoration: DottedDecoration(
                      shape: Shape.circle,
                      dash: const [1, 0],
                      strokeWidth: 2.5,
                      color: item['haveStory'] ? primaryColor : transparent,
                    ),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color.fromARGB(255, 28, 33, 37),
                      backgroundImage: AssetImage(item['image']),
                    ),
                  ),
                  widthSpace10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['title'], style: blackSemiBold16),
                        Text(
                          item['subtitle'],
                          style: color94Regular14,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }

  Widget tagsBar() {
    List tagsSuggestedList = [
   {
        'image': storyBy3,
        'haveStory': true,
        'title': 'Tommy',
        'subtitle': 'nganwai • Following',
      },
     
    ];
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20).copyWith(bottom: 0),
      children: [
        Text('Suggested', style: blackSemiBold18),
        heightSpace20,
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tagsSuggestedList.length,
          itemBuilder: (context, index) {
            int lastIndex = tagsSuggestedList.length - 1;
            dynamic item = tagsSuggestedList[index];
            return Padding(
              padding: index == lastIndex
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(bottom: 13),
              child: Row(
                children: [
                  // Container(
                  //   decoration: DottedDecoration(
                  //     shape: Shape.circle,
                  //     dash: [1, 0],
                  //     strokeWidth: 2.5,
                  //     color: item['haveStory'] ? primaryColor : transparent,
                  //   ),
                  //   child: CircleAvatar(
                  //     radius: 25,
                  //     backgroundColor: Color.fromARGB(255, 28, 33, 37),
                  //     backgroundImage: AssetImage(item['image']),
                  //   ),
                  // ),
                  SizedBox(
                    height: 60,
                    child: Stack(
                      // alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: primaryColor.withOpacity(.25),
                          child: Image.asset(item['image']),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 0,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: primaryColor,
                            child: Text('#', style: whiteBold12),
                          ),
                        )
                      ],
                    ),
                  ),
                  widthSpace10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['title'], style: blackSemiBold16),
                        Text(
                          item['subtitle'],
                          style: color94Regular14,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
