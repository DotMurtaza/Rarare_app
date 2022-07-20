import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Views/shop_pages/Components/redeem_points_page.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/Widgets/shop_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/buy_points_page.dart';

class ShopPages extends StatefulWidget {
  const ShopPages({Key? key}) : super(key: key);

  @override
  State<ShopPages> createState() => _ShopPagesState();
}

class _ShopPagesState extends State<ShopPages> {
  int selectedIndex = 1;
  List<Widget> myList = [
    const RedeemPointsPage(),
    const BuyPointsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [CustomAppBar()],
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Drawer(
          child: MyDrawer(
            onTap: () {
              Navigator.of(context).pop();
              showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return Scaffold(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        body: Center(
                            child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorManager.white,
                            ),
                            width: SizeConfig.widthMultiplier * 60,
                            height: SizeConfig.heightMultiplier * 7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.check_mark_circled_solid,
                                    color: ColorManager.primaryDark,
                                    size: SizeConfig.imageSizeMultiplier * 5),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 2,
                                ),
                                Text('Link Copied',
                                    style: getSemiBoldTextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.textMultiplier * 2))
                              ],
                            ),
                          ),
                        )));
                  });
            },
          ),
        ),
      ),
      backgroundColor: ColorManager.lightGrey,
      body: Column(
        children: [
          SizedBox(
            height: 1 * SizeConfig.heightMultiplier,
          ),
          const ShopHeader(),
          SizedBox(
            height: 1 * SizeConfig.heightMultiplier,
          ),
          Container(
            alignment: Alignment.center,
            height: 10 * SizeConfig.heightMultiplier,
            color: ColorManager.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 5 * SizeConfig.heightMultiplier,
                    width: 86 * SizeConfig.widthMultiplier,
                    decoration: BoxDecoration(
                        color: ColorManager.lightGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        tabButton(0, 'Redeem Point'),
                        tabButton(1, 'Buy Point'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: myList[selectedIndex])
        ],
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 2, top: 2),
    );
  }

  Widget tabButton(int index, String txt) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: SizeConfig.widthMultiplier * 43,
        height: SizeConfig.heightMultiplier * 8,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? ColorManager.primary
              : ColorManager.lightGrey,
          borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   selectedIndex == index
          //       ? const BoxShadow(
          //           color: Colors.grey, blurRadius: 8, offset: Offset(0, 1))
          //       : const BoxShadow(color: Colors.grey, blurRadius: 0)
          // ],
        ),
        child: Text(
          txt,
          style: TextStyle(
              color: selectedIndex == index ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
