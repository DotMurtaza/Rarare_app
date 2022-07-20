import 'package:country_picker/country_picker.dart';
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Views/add_rent/components/header.dart';
import 'package:flow1/Views/add_rent/components/step_indicator.dart';
import 'package:flow1/Views/add_survey_points/add_survey_points_page.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/my_button.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/Widgets/sized_box_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSurveyLocationPage extends StatefulWidget {
  const AddSurveyLocationPage({Key? key}) : super(key: key);

  @override
  State<AddSurveyLocationPage> createState() => _AddSurveyLocationPageState();
}

class _AddSurveyLocationPageState extends State<AddSurveyLocationPage> {
  List<String> countryList = [];
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
            //SizedBox(height: 2 * SizeConfig.heightMultiplier),
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
                        isComplete: false,
                        isSelected: true,
                        onTap: () {
                          // Get.to(() => const AddSurveyLocationPage());
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
                        onTap: () {
                          Get.to(() => const AddSurveyPointsPage());
                        },
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 6 * SizeConfig.widthMultiplier),
                    child: GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (Country country) {
                            setState(() {
                              countryList.add(country.displayNameNoCountryCode
                                  .split("(")
                                  .first);
                            });
                          },
                          // Optional. Sets the theme for the country list picker.
                        );
                      },
                      child: Container(
                          height: 5 * SizeConfig.heightMultiplier,
                          width: 90 * SizeConfig.widthMultiplier,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2 * SizeConfig.widthMultiplier),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Select Country',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(color: likeGreyColor),
                                ),
                                const Icon(Icons.keyboard_arrow_down,
                                    color: likeGreyColor),
                              ],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 40 * SizeConfig.heightMultiplier,
                    width: 92 * SizeConfig.widthMultiplier,
                    child: ListView.builder(
                      // physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.values[0],
                      itemCount: countryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Wrap(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  height: 6 * SizeConfig.heightMultiplier,
                                  // width: 12 * SizeConfig.widthMultiplier,
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        countryList[index],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                2 * SizeConfig.textMultiplier),
                                      ),
                                      SizedBox(
                                          width:
                                              2 * SizeConfig.widthMultiplier),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              countryList.removeAt(index);
                                            });
                                          },
                                          icon: Icon(CupertinoIcons.clear,
                                              color: Colors.white,
                                              size: 5 *
                                                  SizeConfig
                                                      .imageSizeMultiplier))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
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
                    Get.to(() => const AddSurveyPointsPage());
                  },
                  text: 'Next',
                  isBack: false,
                ),
              ],
            ),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
          ],
        ),
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 9, top: 2),
    );
  }
}
