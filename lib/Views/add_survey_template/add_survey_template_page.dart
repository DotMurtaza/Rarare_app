import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Views/add_rent/components/header.dart';
import 'package:flow1/Views/add_rent/components/step_indicator.dart';
import 'package:flow1/Views/add_survey_description/add_survey_description_page.dart';
import 'package:flow1/Views/add_survey_template/components/custom_dropdown.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/my_button.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/Widgets/sized_box_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSurveyTemplatePage extends StatelessWidget {
  const AddSurveyTemplatePage({Key? key}) : super(key: key);

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
            //  SizedBox(height: 1 * SizeConfig.heightMultiplier),
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
                        isComplete: false,
                        isSelected: true,
                        onTap: () {},
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
                        isComplete: false,
                        isSelected: false,
                        onTap: () {
                          Get.to(() => AddSurveyDescriptionPage());
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
                        isComplete: false,
                        isSelected: false,
                        onTap: () {},
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
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black38, blurRadius: 7),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5 * SizeConfig.widthMultiplier,
                    vertical: 2 * SizeConfig.heightMultiplier),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomDropDow(),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      const CustomDropDow(),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      const CustomDropDow(),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      const CustomDropDow(),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      const CustomDropDow(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBoxContainer(
              height: 1,
            ),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // SizedBox(width: 2 * SizeConfig.heightMultiplier),
                Padding(
                  padding:
                      EdgeInsets.only(right: 15 * SizeConfig.widthMultiplier),
                  child: MyButton(
                    onTap: () {
                      Get.to(() => AddSurveyDescriptionPage());
                    },
                    text: 'Next',
                    isBack: false,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
          ],
        ),
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 8, top: 2),
    );
  }
}
