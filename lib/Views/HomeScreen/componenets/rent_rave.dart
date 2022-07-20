import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/add_rent/add_rent_details_page.dart';
import 'package:flow1/Views/survey/custom_floating_button.dart';
import 'package:flow1/Views/title_of_rent/title_of_rent_page.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentRaveBody extends StatelessWidget {
  const RentRaveBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(color: ColorManager.white, boxShadow: [
                BoxShadow(
                    // blurRadius: 3,
                    // spreadRadius: 5,
                    // offset: Offset(0, 3),
                    color: ColorManager.grey)
              ]),
              height: SizeConfig.heightMultiplier * 63.6,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: SizedBox(
                        height: SizeConfig.heightMultiplier * 13,
                        width: 50,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const TitleOfRentPage());
                          },
                          child: Card(
                              // elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12)),
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            "assets/images/bg.jpg",
                                            fit: BoxFit.cover,
                                            height:
                                                SizeConfig.heightMultiplier *
                                                    100,
                                            width:
                                                SizeConfig.widthMultiplier * 30,
                                          ),
                                          Positioned(
                                              bottom: 10,
                                              left: 10,
                                              child: Container(
                                                height: SizeConfig
                                                        .heightMultiplier *
                                                    3,
                                                width:
                                                    SizeConfig.widthMultiplier *
                                                        6,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ColorManager.grey
                                                      .withOpacity(0.6),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "2",
                                                    style: getSemiBoldTextStyle(
                                                        color:
                                                            ColorManager.white),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      )),
                                  SizedBox(
                                      width: SizeConfig.widthMultiplier * 1),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Title of the Rant/Rave",
                                          style: getSemiBoldTextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  SizeConfig.textMultiplier *
                                                      1.8)),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(CupertinoIcons.location_solid,
                                              size: 3.5 *
                                                  SizeConfig
                                                      .imageSizeMultiplier,
                                              color: ColorManager.primaryDark),
                                          SizedBox(
                                            width:
                                                SizeConfig.widthMultiplier * 50,
                                            child: Text(
                                                "Lorem ipsum dolar sit amet,consectetur adipiscing elitr",
                                                softWrap: false,
                                                maxLines: 2,
                                                style: getRegularTextStyle(
                                                    fontSize: SizeConfig
                                                            .textMultiplier *
                                                        1.1,
                                                    color: ColorManager.grey),
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            1.5 * SizeConfig.heightMultiplier,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(CupertinoIcons.heart_fill,
                                              size: 4 *
                                                  SizeConfig
                                                      .imageSizeMultiplier,
                                              color: ColorManager.grey),
                                          Text(
                                            ' 1.5K',
                                            style: getRegularTextStyle(
                                                color: Colors.black,
                                                fontSize: 1.2 *
                                                    SizeConfig.textMultiplier),
                                          ),
                                          SizedBox(
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      4),
                                          Image.asset(
                                              "assets/images/comment.png",
                                              height: 4 *
                                                  SizeConfig
                                                      .imageSizeMultiplier,
                                              color: ColorManager.grey),
                                          SizedBox(
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      1.5),
                                          Text(
                                            "800 Comments",
                                            style: getRegularTextStyle(
                                                color: Colors.black,
                                                fontSize: 1.2 *
                                                    SizeConfig.textMultiplier),
                                          ),
                                          SizedBox(
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      7),

                                          // const Spacer(),
                                          Text(
                                            "15/05/2022",
                                            style: getRegularTextStyle(
                                                color: Colors.black,
                                                fontSize: 1.2 *
                                                    SizeConfig.textMultiplier),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ),
                      ),
                    );
                  })),
          Positioned(
              right: SizeConfig.widthMultiplier * 3,
              bottom: SizeConfig.heightMultiplier * 3,
              child: CutomFloatingButton(
                onTap: () {
                  Get.to(() => const AddRentDetailsPage());
                },
              )),
          // const ReportButton(bottom: 40, right: 10)
        ],
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 32, top: 2),
    );
  }
}
