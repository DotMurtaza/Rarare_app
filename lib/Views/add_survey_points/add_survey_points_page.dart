import 'dart:async';
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Views/add_rent/components/header.dart';
import 'package:flow1/Views/add_rent/components/step_indicator.dart';
import 'package:flow1/Views/my_survey/my_survey_page.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/my_button.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/Widgets/sized_box_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/buy_now.dart';
import 'components/calculation_box.dart';

class AddSurveyPointsPage extends StatelessWidget {
  const AddSurveyPointsPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBoxContainer(
              height: 1,
            ),
            Header(
              onTap: () {
                Get.back();
              },
              text: 'Add a Survey',
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
                    "Four easy steps and you're done!",
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
                        isComplete: true,
                        isSelected: true,
                        onTap: () {
                          Get.back();
                        },
                        title: 'Template',
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 2 * SizeConfig.heightMultiplier),
                        child: Container(
                            height: 1,
                            width: 9 * SizeConfig.widthMultiplier,
                            color: Colors.grey),
                      ),
                      StepIndicatorWithDoneIcon(
                        isComplete: true,
                        isSelected: true,
                        onTap: () {
                          Get.back();
                        },
                        title: 'Description',
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 2 * SizeConfig.heightMultiplier),
                        child: Container(
                            height: 1,
                            width: 9 * SizeConfig.widthMultiplier,
                            color: Colors.grey),
                      ),
                      StepIndicatorWithDoneIcon(
                        isComplete: true,
                        isSelected: true,
                        onTap: () {
                          Get.back();
                        },
                        title: 'Location',
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 2 * SizeConfig.heightMultiplier),
                        child: Container(
                            height: 1,
                            width: 9 * SizeConfig.widthMultiplier,
                            color: Colors.grey),
                      ),
                      StepIndicatorWithDoneIcon(
                        isComplete: false,
                        isSelected: false,
                        onTap: () {},
                        title: 'Points',
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
              height: 60 * SizeConfig.heightMultiplier,
              width: 100 * SizeConfig.widthMultiplier,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: Colors.black38, blurRadius: 7),
              ]),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 3 * SizeConfig.widthMultiplier,
                    vertical: 2 * SizeConfig.heightMultiplier),
                child: Column(
                  children: [
                    Text(
                      'Define the number of participants and reward \npoints allocated per paticipants.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    Text(
                      'Participants',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    Container(
                      height: 6 * SizeConfig.heightMultiplier,
                      width: 30 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: Text('999',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: ColorManager.primary))),
                    ),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    Text(
                      'Min. 0 | Max 99,999',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: likeGreyColor,
                          ),
                    ),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    Text(
                      'Reward Points per participants',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    Container(
                      height: 6 * SizeConfig.heightMultiplier,
                      width: 30 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: Text('999',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: ColorManager.primary))),
                    ),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    Text(
                      'Min. 0 | Max 99,999',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: likeGreyColor,
                          ),
                    ),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    const CalculationBox(),
                    SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    const BuyNow(),
                  ],
                ),
              ),
            ),
            const SizedBoxContainer(
              height: 1,
            ),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  onTap: () {
                    Get.back();
                  },
                  text: 'Back',
                  isBack: true,
                ),
                SizedBox(width: 2 * SizeConfig.heightMultiplier),
                MyButton(
                  onTap: () {
                    Timer(const Duration(seconds: 2), () {
                      Get.to(() => const MySurveyPage());
                    });

                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext c) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: 10 * SizeConfig.heightMultiplier),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15 * SizeConfig.widthMultiplier),
                              child: Container(
                                  height: 6 * SizeConfig.heightMultiplier,
                                  width: 30 * SizeConfig.widthMultiplier,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12, blurRadius: 8)
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height:
                                              8 * SizeConfig.heightMultiplier,
                                          width: 8 * SizeConfig.widthMultiplier,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorManager.primary),
                                          child: const Center(
                                            child: Icon(Icons.done,
                                                color: Colors.white),
                                          )),
                                      SizedBox(
                                        width: 3 * SizeConfig.widthMultiplier,
                                      ),
                                      const Text('Successful!',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ],
                                  )),
                            ),
                          );
                        });
                  },
                  text: 'Confirm',
                  isBack: false,
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 30, top: 2),
    );
  }
}
