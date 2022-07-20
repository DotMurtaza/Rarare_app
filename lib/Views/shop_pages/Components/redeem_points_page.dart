import 'dart:ui';

import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Widgets/elevated_icon_button.dart';
import 'package:flow1/models/redeem_points_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedeemPointsPage extends StatefulWidget {
  const RedeemPointsPage({Key? key}) : super(key: key);

  @override
  State<RedeemPointsPage> createState() => _RedeemPointsPageState();
}

class _RedeemPointsPageState extends State<RedeemPointsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 3 * SizeConfig.widthMultiplier),
          child: Column(
            children: <Widget>[
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: redeemPointsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog();
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 3 * SizeConfig.widthMultiplier,
                              vertical: 1.5 * SizeConfig.heightMultiplier),
                          // margin: EdgeInsets.all(8),
                          height: 15 * SizeConfig.heightMultiplier,
                          width: 70 * SizeConfig.widthMultiplier,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(blurRadius: 3, color: Colors.black12)
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(redeemPointsList[index].title!,
                                        style: getSemiBoldTextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    1.9)),
                                    Text(
                                      redeemPointsList[index].subTitile!,
                                      style: TextStyle(
                                        fontSize:
                                            1.6 * SizeConfig.textMultiplier,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          size: 3 *
                                              SizeConfig.imageSizeMultiplier,
                                          color: const Color(
                                            0xff19c2a0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2 * SizeConfig.widthMultiplier,
                                        ),
                                        Text(
                                          redeemPointsList[index].location!,
                                          style: TextStyle(
                                              fontSize: 1.3 *
                                                  SizeConfig.textMultiplier,
                                              color: ColorManager.darkGrey),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.card_giftcard_sharp,
                                          size: 3 *
                                              SizeConfig.imageSizeMultiplier,
                                          color: const Color(
                                            0xff19c2a0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2 * SizeConfig.widthMultiplier,
                                        ),
                                        Text(
                                          redeemPointsList[index].location!,
                                          style: TextStyle(
                                            color: ColorManager.darkGrey,
                                            fontSize:
                                                1.3 * SizeConfig.textMultiplier,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 15 * SizeConfig.heightMultiplier,
                                width: 25 * SizeConfig.widthMultiplier,
                                decoration: const BoxDecoration(
                                    color: Color(0xff19c2a0),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '2000',
                                      style: TextStyle(
                                          fontSize:
                                              2.5 * SizeConfig.textMultiplier,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Logo\nPoints',
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize:
                                              1.8 * SizeConfig.textMultiplier,
                                          //fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void showDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Scaffold(
                backgroundColor: Colors.transparent.withOpacity(0.3),
                body: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorManager.white,
                    ),
                    width: SizeConfig.widthMultiplier * 90,
                    height: SizeConfig.heightMultiplier * 40,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title of the offer',
                            style: getSemiBoldTextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.textMultiplier * 2)),
                        Text(
                          'nemo est quas nostrum id accusamus error id deleniti sequi est dolores beatae. Ex dolorem beatae et mollitia aperiam non nisi impedit ut dolorem similique sed quod galisum ut sapiente recusandae et enim autem. Eos doloribus architecto et ipsum dolorem qui nesciunt mollitia ut soluta quod non nemo sapiente et magnam nihil ab molestiae voluptate.',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(),
                        ),
                        SizedBox(
                          height: 2 * SizeConfig.heightMultiplier,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 3 * SizeConfig.imageSizeMultiplier,
                              color: const Color(
                                0xff19c2a0,
                              ),
                            ),
                            SizedBox(
                              width: 2 * SizeConfig.widthMultiplier,
                            ),
                            Text(
                              'Lorem ipsum dolor sit  consetetur',
                              style: TextStyle(
                                  fontSize: 1.3 * SizeConfig.textMultiplier,
                                  color: ColorManager.darkGrey),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2 * SizeConfig.heightMultiplier,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.card_giftcard_sharp,
                              size: 3 * SizeConfig.imageSizeMultiplier,
                              color: const Color(
                                0xff19c2a0,
                              ),
                            ),
                            SizedBox(
                              width: 2 * SizeConfig.widthMultiplier,
                            ),
                            Text(
                              'Reward  with redemption',
                              style: TextStyle(
                                color: ColorManager.darkGrey,
                                fontSize: 1.3 * SizeConfig.textMultiplier,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.5 * SizeConfig.heightMultiplier,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevetedIconButton(
                            isIcon: false,
                            btnText: 'Redeem Points',
                            height: 5 * SizeConfig.heightMultiplier,
                            width: 45 * SizeConfig.widthMultiplier,
                            iconData: Icons.done,
                            voidCallback: () {
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
