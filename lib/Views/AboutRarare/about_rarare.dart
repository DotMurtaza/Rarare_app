import 'package:flow1/Resources/assets_manager.dart';
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/AboutRarare/about/about_page.dart';
import 'package:flow1/Views/AboutRarare/privacy/privacy_page_main.dart';
import 'package:flow1/Views/AboutRarare/terms/terms_page.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/Widgets/sized_box_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  int selectedIndex = 0;
  final _pages = [
    const AboutPage(),
    const TermsPage(),
    const PrivacyPageMain(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
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
      body: Column(
        children: [
          const SizedBoxContainer(height: 1),
          Container(
            alignment: Alignment.center,
            height: 6 * SizeConfig.heightMultiplier,
            width: 100 * SizeConfig.widthMultiplier,
            decoration: const BoxDecoration(color: Color(0xffffffff)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 5 * SizeConfig.widthMultiplier,
                      ),
                      Text(
                        'About Us',
                        style: TextStyle(
                            fontSize: 2.5 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBoxContainer(height: 1),
          Image.asset(
            AssetsManager.splashLogo,
            height: SizeConfig.heightMultiplier * 13,
            // width: SizeConfig.widthMultiplier * 95,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tabs('About Rarare', 0),
                tabs('Terms of use', 1),
                tabs('Privacy Policy', 2),
              ],
            ),
          ),
          Expanded(child: _pages[selectedIndex]),
        ],
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 2, top: 2),
    );
  }

  Widget tabs(String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: index == selectedIndex
                    ? ColorManager.primary
                    : Colors.grey),
          ),
          const SizedBox(height: 3),
          Container(
              height: SizeConfig.heightMultiplier * 0.4,
              width: SizeConfig.widthMultiplier * 20,
              color: index == selectedIndex
                  ? ColorManager.primary
                  : Colors.transparent)
        ],
      ),
    );
  }
}
