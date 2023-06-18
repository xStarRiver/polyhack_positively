import 'package:flutter/material.dart';
import 'package:positively/utils/constants.dart';
import 'package:positively/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class BlockAccounts extends StatefulWidget {
  const BlockAccounts({Key? key}) : super(key: key);

  @override
  State<BlockAccounts> createState() => _BlockAccountsState();
}

List _blockAccounts = [
  
];

class _BlockAccountsState extends State<BlockAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: _blockAccounts.isNotEmpty
          ? filledScreen()
          : SafeArea(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(emptyBlock, height: 5.h),
                  heightSpace10,
                  Text('No Accounts found', style: color94SemiBold16),
                ],
              )),
            ),
    );
  }

  ListView filledScreen() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: _blockAccounts.length,
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        dynamic item = _blockAccounts[index];
        return Column(children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: primaryColor,
              backgroundImage: AssetImage(item['image']),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['title'], style: blackSemiBold16),
                Text(item['subtitle'], style: color94Regular14)
              ],
            ),
            trailing: GestureDetector(
              onTap: () => setState(() => _blockAccounts.removeAt(index)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 5.5),
                decoration: BoxDecoration(
                  borderRadius: borderRadius5,
                  border: Border.all(color: primaryColor),
                ),
                child: Text('Unblock', style: primaryBold14),
              ),
            ),
          ),
          const Divider(
            color: colorE6,
            thickness: 1,
          )
        ]);
      },
    );
  }

  PreferredSize appBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: MyAppBar(title: 'Block Accounts'),
    );
  }
}
