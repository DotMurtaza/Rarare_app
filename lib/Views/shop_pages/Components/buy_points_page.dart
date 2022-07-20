import 'dart:ui';

import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/shop_pages/paypal_login_pages.dart';
import 'package:flow1/Widgets/elevated_icon_button.dart';
import 'package:flow1/models/buy_points_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BuyPointsPage extends StatelessWidget {
  const BuyPointsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 6 * SizeConfig.widthMultiplier),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: buyPointsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          showDialog(context);
                        },
                        child: Container(
                            // margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 10, color: Colors.black12)
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50 * SizeConfig.widthMultiplier,
                                      height: 13 * SizeConfig.heightMultiplier,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          color: ColorManager.primary),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.coins,
                                              color: Colors.white,
                                              size: 8 *
                                                  SizeConfig
                                                      .imageSizeMultiplier,
                                            ),
                                            Text(
                                              buyPointsList[index].points!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            ),
                                            Text(
                                              buyPointsList[index]
                                                  .type!
                                                  .toUpperCase(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.copyWith(
                                                      color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text(
                                      buyPointsList[index].currency!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                              color: ColorManager.primary),
                                    )
                                  ]),
                            ))),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void showDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'You will get',
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2 * SizeConfig.heightMultiplier,
                        ),
                        Icon(
                          FontAwesomeIcons.coins,
                          size: 12 * SizeConfig.imageSizeMultiplier,
                        ),
                        SizedBox(
                          height: 2 * SizeConfig.heightMultiplier,
                        ),
                        Text(
                          '2000',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.primary),
                        ),
                        SizedBox(
                          height: 0.1 * SizeConfig.heightMultiplier,
                        ),
                        Text(
                          'Loco Points',
                          style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: 1.8 * SizeConfig.textMultiplier,
                          ),
                        ),
                        SizedBox(
                          height: 2 * SizeConfig.heightMultiplier,
                        ),
                        Text(
                          'FOR ₦ 2500',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 1.8 * SizeConfig.textMultiplier,
                          ),
                        ),
                        SizedBox(
                          height: 2 * SizeConfig.heightMultiplier,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevetedIconButton(
                            isIcon: false,
                            btnText: 'Pay Via Paypal',
                            height: 5 * SizeConfig.heightMultiplier,
                            width: 45 * SizeConfig.widthMultiplier,
                            iconData: FontAwesomeIcons.paypal,
                            voidCallback: () {
                              Get.to(() => const PayPalLoginPage());
                              //final Get.back();
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
