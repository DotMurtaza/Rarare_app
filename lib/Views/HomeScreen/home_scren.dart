import 'dart:ui';

import 'package:flow1/Resources/assets_manager.dart';
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/AboutRarare/about/about_page.dart';
import 'package:flow1/Views/AboutRarare/about_rarare.dart';
import 'package:flow1/Views/HomeScreen/componenets/rent_rave.dart';
import 'package:flow1/Views/HomeScreen/componenets/tick_row.dart';
import 'package:flow1/Views/LoginScreen/login.dart';
import 'package:flow1/Views/MyAccount/my_account_page.dart';
import 'package:flow1/Views/MyTransaction/my_transaction_page.dart';
import 'package:flow1/Views/shop_pages/shop_pages.dart';
import 'package:flow1/Views/survey/survey_page.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    const RentRaveBody(),
    const SurveyPage(),
  ];
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  
  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [CustomAppBar()],
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Drawer(
          key: drawerKey,
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
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 1.5),
            Container(
              alignment: Alignment.center,
              height: 8 * SizeConfig.heightMultiplier,
              color: ColorManager.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 4.5 * SizeConfig.heightMultiplier,
                      width: 70 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                          color: ColorManager.lightGrey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          tabButton(0, 'Rent/Rave'),
                          tabButton(1, 'Surveys'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
           
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchField()),
            const TIckButtonsRow(),
            SizedBox(height: SizeConfig.heightMultiplier * 2),
            Expanded(child: pages[_selectedIndex]),
          ],
        ),
      ),
    );
  }

  Widget tabButton(int index, String txt) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 4.5 * SizeConfig.heightMultiplier,
        width: 35 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? ColorManager.primary
                : ColorManager.lightGrey,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          txt,
          style: TextStyle(
              color: _selectedIndex == index ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 10, 0),
                child: SizedBox(
                  width: SizeConfig.widthMultiplier * 16,
                  height: SizeConfig.heightMultiplier * 8,
                  child: DrawerHeader(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          image: const DecorationImage(
                              image: AssetImage(
                                AssetsManager.men,
                              ),
                              fit: BoxFit.cover)),
                      child: null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Armando Marks',
                      style: getSemiBoldTextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.textMultiplier * 2),
                    ),
                    const Text('12345678909'),
                    SizedBox(height: SizeConfig.heightMultiplier * 0.5),
                    const Text('Armando@gmail.com'),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: ListView(
            padding: const EdgeInsets.all(5.0),
            children: [
              DrawerTile(
                icon: Icons.home,
                onTap: () => selectedScreen(context, 0),
                //  {
                //   Get.to(() => const HomeScreen(
                //         index: 0,
                //       ));
                //   // Scaffold.of(context).openEndDrawer();
                //   // Get.back();
                // },
                title: "HOME",
              ),
              Divider(
                color: ColorManager.grey,
              ),
              DrawerTile(
                icon: CupertinoIcons.check_mark_circled_solid,
                onTap: () => selectedScreen(context, 0),
                title: "RANT/RAVE",
              ),
              Divider(
                color: ColorManager.grey,
              ),
              DrawerTile(
                icon: CupertinoIcons.graph_square_fill,
                onTap: () => selectedScreen(context, 1),
                // {
                //   Get.to(() => const HomeScreen(
                //         index: 1,
                //       ));
                //   // Scaffold.of(context).openEndDrawer();
                // },
                title: "SURVEYS",
              ),
              Divider(
                color: ColorManager.grey,
              ),
              DrawerTile(
                icon: CupertinoIcons.cart_fill,
                onTap: () => selectedScreen(context, 2),
                title: 'Shops',
              ),
              Divider(
                color: ColorManager.grey,
              ),
              DrawerTile(
                icon: CupertinoIcons.calendar,
                onTap: () => selectedScreen(context, 3),
                title: "MY transcation",
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 20),
              DrawerTile(
                icon: CupertinoIcons.person_alt,
                onTap: () => selectedScreen(context, 4),
                title: "MY PROFILE",
              ),
              Divider(
                color: ColorManager.grey,
              ),
              DrawerTile(
                icon: Icons.settings,
                onTap: () => selectedScreen(context, 5),
                title: "SETTING",
              ),
              Divider(
                color: ColorManager.grey,
              ),
              DrawerTile(
                icon: Icons.help,
                onTap: () => selectedScreen(context, 6),
                title: "ABOUT RARARE",
              ),
              Divider(
                color: ColorManager.grey,
              ),
              DrawerTile(
                icon: Icons.share,
                onTap: () => selectedScreen(context, 7),
                title: "SHARE RARARE",
              ),
              Divider(
                color: ColorManager.grey,
              ),
              DrawerTile(
                icon: Icons.exit_to_app_sharp,
                onTap: () => selectedScreen(context, 8),
                title: "LOGOUT",
              ),
            ],
          ),
        )
      ],
    );
  }

  void selectedScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HomeScreen(index: index)));
        break;
      case 1:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HomeScreen(index: index)));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const ShopPages()));
        break;
      case 3:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MyTransactionPage()));
        break;
      case 4:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MyAccountPage()));
        break;
      case 5:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MyAccountPage()));
        break;
      case 6:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const PrivacyPage()));
        break;
      case 7:
        share(context);
        break;
      case 8:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
        break;
    }
  }

  void share(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20.0,
            sigmaY: 20.0,
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 12 * SizeConfig.heightMultiplier,
                        width: 70 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 18),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Share',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/whatsapp.png',
                                    color: ColorManager.primary),
                                Image.asset('assets/images/facebook1.png',
                                    color: ColorManager.primary,
                                    height: 2.5 * SizeConfig.heightMultiplier),
                                Image.asset(
                                  'assets/images/insta.png',
                                  color: ColorManager.primary,
                                ),
                                Image.asset('assets/images/twitter.png',
                                    color: ColorManager.primary,
                                    height: 2.5 * SizeConfig.heightMultiplier),
                                Image.asset(AssetsManager.copy,
                                    color: ColorManager.primary,
                                    height: 2.3 * SizeConfig.heightMultiplier),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: const Color(0xffe9e9e9).withOpacity(0.1),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 4 * SizeConfig.widthMultiplier),
          child: SizedBox(
              height: 4 * SizeConfig.heightMultiplier,
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: ColorManager.primaryDark,
                    size: 5 * SizeConfig.imageSizeMultiplier,
                  ),
                  SizedBox(width: 4 * SizeConfig.widthMultiplier),
                  Text(
                    title.toUpperCase(),
                    style: getDrawerText(color: Colors.black),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 5 * SizeConfig.imageSizeMultiplier,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
