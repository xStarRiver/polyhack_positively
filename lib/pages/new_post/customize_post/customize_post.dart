import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class CustomizePost extends StatefulWidget {
  const CustomizePost({Key? key}) : super(key: key);

  @override
  State<CustomizePost> createState() => _CustomizePostState();
}

Map filterTypes = {
  'Normal': filterImage1,
  'Clarendon': filterImage2,
  'Skyline': filterImage3,
  'Moon': filterImage4,
  'Juno': filterImage5,
  'Gingham': filterImage6,
  'Lark': filterImage7
};

class _CustomizePostState extends State<CustomizePost>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedFilter = 2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(20).copyWith(bottom: 0),
            child: Image.asset(
              filterTypes.values.toList()[_selectedFilter],
              height: 336,
              width: 100.w,
              fit: BoxFit.cover,
            ),
          ),
          tabBars(),
          tabBarView()
        ],
      ),
    );
  }

  Widget tabBarView() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: 147,
      child: TabBarView(
        controller: _tabController,
        children: [
          filterTab(),
          editTab(),
        ],
      ),
    );
  }

  Widget tabBars() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: colorB7, width: 1.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 35,
              child: TabBar(
                physics: const BouncingScrollPhysics(),
                overlayColor: MaterialStateProperty.all(transparent),
                indicatorColor: primaryColor,
                labelColor: primaryColor,
                unselectedLabelColor: colorB7,
                labelStyle: primarySemiBold16,
                unselectedLabelStyle: colorB7SemiBold16,
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Filter'),
                  Tab(text: 'Edit'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: MyAppBar(
        actions: [
          IconButton(
              onPressed: () {
                if (_tabController.index == 0) {
                  _tabController.animateTo(1);
                } else {
                  Navigator.pushNamed(context, '/PostCaptionAndTag');
                }
              },
              icon: const Icon(
                Icons.arrow_forward,
                color: black,
              ))
        ],
      ),
    );
  }

  Widget filterTab() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: filterTypes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => setState(() => _selectedFilter = index),
          child: Padding(
            padding: index == 0
                ? const EdgeInsets.only(right: 5)
                : index == filterTypes.length - 1
                    ? const EdgeInsets.only(left: 5)
                    : const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Text(filterTypes.keys.toList()[index], style: blackSemiBold16),
                heightSpace5,
                Image.asset(
                  filterTypes.values.toList()[index],
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget editTab() {
    Map editTypes = {
      'Adjust': editIcon1,
      'Brightness': editIcon2,
      'Contrast': editIcon3,
      'Curves': editIcon4,
      'Crop': editIcon5,
      'Rotate': editIcon6,
      'Blur': editIcon7,
      'Perspective': editIcon8,
    };
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: editTypes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 1.5),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset(
              editTypes.values.toList()[index],
              height: 25,
            ),
            heightSpace2,
            Text(editTypes.keys.toList()[index])
          ],
        );
      },
    );
  }
}
