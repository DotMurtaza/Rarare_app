import 'dart:ui';

import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Views/add_rent/components/header.dart';
import 'package:flow1/Views/add_survey_template/add_survey_template_page.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/Widgets/sized_box_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DetailMySurveyPage extends StatefulWidget {
  const DetailMySurveyPage({Key? key}) : super(key: key);

  @override
  State<DetailMySurveyPage> createState() => _DetailMySurveyPageState();
}

class _DetailMySurveyPageState extends State<DetailMySurveyPage> {
  bool isOpen = false;
  bool isCheck1 = false;
  bool isCheck2 = false;
  bool isCheck3 = false;
  bool isCheck4 = false;
  bool isCheck5 = false;
  bool isCheck6 = false;
  bool isCheck7 = false;
  bool isCheck8 = false;
  bool isCheck9 = false;
  bool isCheck10 = false;
  bool isCheck11 = false;
  bool isCheck12 = false;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBoxContainer(
                height: 1,
              ),
              RowHeader(
                isAddButton: true,
                text: 'My Survey',
                onTap: () {
                  Get.back();
                },
                child: IconButton(
                  onPressed: () {
                    delete(context);
                  },
                  icon: const Icon(CupertinoIcons.delete, color: Colors.red),
                ),
              ),
              const SizedBoxContainer(
                height: 1,
              ),
              Container(
                // height: 15 * SizeConfig.heightMultiplier,
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
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'The title of the Survey',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const AddSurveyTemplatePage());
                            },
                            child: Container(
                              height: 3 * SizeConfig.heightMultiplier,
                              width: 16 * SizeConfig.widthMultiplier,
                              decoration: BoxDecoration(
                                color: ColorManager.primary,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorManager.primaryDark,
                                      blurRadius: 8),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // ignore: deprecated_member_use
                                  Icon(FontAwesomeIcons.edit,
                                      size: 4 * SizeConfig.imageSizeMultiplier,
                                      color: Colors.white),
                                  Text(
                                    'Edit',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(color: Colors.black)),
                      SizedBox(height: SizeConfig.heightMultiplier),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.location_on,
                              color: ColorManager.primary, size: 18),
                          Text(
                            'Region of survey',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.black54),
                          ),
                          Container(height: 15, width: 1, color: Colors.black),
                          Icon(Icons.card_giftcard_rounded,
                              color: ColorManager.primary, size: 18),
                          Text(
                            '200',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.black54),
                          ),
                          Container(height: 15, width: 1, color: Colors.black),
                          Icon(Icons.person,
                              color: ColorManager.primary, size: 18),
                          Text(
                            'Unlimited',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBoxContainer(
                height: 1,
              ),
              Container(
                // height:  * SizeConfig.heightMultiplier,
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                            'Lorem ispum dolor sit amet, consetetur adipscing elittr, sed diam',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.black)),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck1,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck1 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color:
                                        isCheck1 ? Colors.black : Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck2,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck2 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color:
                                        isCheck2 ? Colors.black : Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck3,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck3 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color:
                                        isCheck3 ? Colors.black : Colors.grey)),
                          ],
                        ),
                        Text(
                            'Lorem ispum dolor sit amet, consetetur adipscing elittr, sed diam',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.black)),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck4,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck4 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color:
                                        isCheck4 ? Colors.black : Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck5,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck5 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color:
                                        isCheck5 ? Colors.black : Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck6,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck6 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color:
                                        isCheck6 ? Colors.black : Colors.grey)),
                          ],
                        ),
                        Text(
                            'Lorem ispum dolor sit amet, consetetur adipscing elittr, sed diam',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.black)),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck7,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck7 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color:
                                        isCheck7 ? Colors.black : Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck8,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck8 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color:
                                        isCheck8 ? Colors.black : Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck9,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck9 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color:
                                        isCheck9 ? Colors.black : Colors.grey)),
                          ],
                        ),
                        Text(
                            'Lorem ispum dolor sit amet, consetetur adipscing elittr, sed diam',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.black)),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck10,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck10 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color: isCheck10
                                        ? Colors.black
                                        : Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck11,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck11 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color: isCheck11
                                        ? Colors.black
                                        : Colors.grey)),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: isCheck12,
                                onChanged: (val) {
                                  setState(() {
                                    isCheck12 = val!;
                                  });
                                }),
                            Text('Lorem ispum dolor sit amet, consetetur',
                                style: TextStyle(
                                    color: isCheck12
                                        ? Colors.black
                                        : Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 4, top: 2),
    );
  }

  void delete(BuildContext context) {
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
                          margin: EdgeInsets.symmetric(
                              vertical: 3 * SizeConfig.heightMultiplier,
                              horizontal: 3 * SizeConfig.widthMultiplier),
                          height: 40 * SizeConfig.heightMultiplier,
                          width: 80 * SizeConfig.widthMultiplier,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 18),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 2 * SizeConfig.heightMultiplier),
                              Image.asset(
                                'assets/images/Group 3061@3x.png',
                                height: 10 * SizeConfig.heightMultiplier,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 2 * SizeConfig.heightMultiplier),
                              Text(
                                'Delete Survey?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.black),
                              ),
                              SizedBox(height: 2 * SizeConfig.heightMultiplier),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Are you sure want to delete this survey?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(color: Colors.black),
                                    textAlign: TextAlign.center),
                              ),
                              SizedBox(height: 2 * SizeConfig.heightMultiplier),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: 6 * SizeConfig.heightMultiplier,
                                  width: 50 * SizeConfig.widthMultiplier,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text('Yes Delete!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          )),
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
