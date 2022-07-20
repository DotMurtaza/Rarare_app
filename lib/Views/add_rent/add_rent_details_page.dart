import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Views/add_rent/tabs/rant.dart';
import 'package:flow1/Views/add_rent/tabs/rave.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/Widgets/sized_box_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/header.dart';
import 'components/step_indicator.dart';

class AddRentDetailsPage extends StatefulWidget {
  const AddRentDetailsPage({Key? key}) : super(key: key);

  @override
  State<AddRentDetailsPage> createState() => _AddRentDetailsPageState();
}

class _AddRentDetailsPageState extends State<AddRentDetailsPage> {
  int selectedIndex = 0;
  final _pages = const [
    Rant(),
    Rave(),
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
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    // SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    const SizedBoxContainer(
                      height: 1,
                    ),
                    Header(
                      text: 'Add an Rent/Rave',
                      onTap: () {},
                    ),
                    const SizedBoxContainer(
                      height: 1,
                    ),
                    Container(
                      height: 15 * SizeConfig.heightMultiplier,
                      width: 100 * SizeConfig.widthMultiplier,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Two easy steps and you're done!",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(height: 2 * SizeConfig.heightMultiplier),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              StepIndicatorWithDoneIcon(
                                isComplete: false,
                                isSelected: true,
                                onTap: () {
                                  Get.back();
                                },
                                title: 'Details',
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: 2 * SizeConfig.heightMultiplier),
                                child: Container(
                                    height: 1,
                                    width: 20 * SizeConfig.widthMultiplier,
                                    color: Colors.grey),
                              ),
                              StepIndicatorWithDoneIcon(
                                isComplete: false,
                                isSelected: false,
                                onTap: () {},
                                title: 'Images',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBoxContainer(
                      height: 1,
                    ),
                    Container(
                      height: 70 * SizeConfig.heightMultiplier,
                      width: 100 * SizeConfig.widthMultiplier,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black38, blurRadius: 7),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 3 * SizeConfig.heightMultiplier),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              tabs('Rant', 0),
                              tabs('Rave', 1),
                              SizedBox(height: 1 * SizeConfig.heightMultiplier),
                            ],
                          ),
                          Expanded(child: _pages[selectedIndex]),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 2,
                    // ),
                    // const SizedBoxContainer(
                    //   height: 1,
                    // ),
                  ],
                ),
                //  const ReportButton(bottom: 7, right: 5, top: 0, left: 0)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 2, top: 2),
    );
  }

  Widget tabs(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
          height: 6 * SizeConfig.heightMultiplier,
          width: 40 * SizeConfig.widthMultiplier,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(
                  color: index == selectedIndex
                      ? ColorManager.primary
                      : Colors.black)),
          child: Center(
              child: Text(title,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: index == selectedIndex
                          ? Colors.black
                          : Colors.grey)))),
    );
  }
}
