import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/add_survey_template/add_survey_template_page.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_floating_button.dart';

class SurveyPage extends StatelessWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
          child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Container(
                        width: 100 * SizeConfig.widthMultiplier,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 8),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 8,
                                left: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Title of the survey',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            color: Colors.black,
                                            fontSize:
                                                SizeConfig.textMultiplier *
                                                    1.8),
                                  ),
                                  SizedBox(
                                      height:
                                          1.5 * SizeConfig.heightMultiplier),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on,
                                          color: ColorManager.primary,
                                          size: 4 *
                                              SizeConfig.imageSizeMultiplier),
                                      Text(
                                          'lorem ispum dolor sit amet, consetetur',
                                          softWrap: false,
                                          maxLines: 2,
                                          style: getRegularTextStyle(
                                              fontSize:
                                                  SizeConfig.textMultiplier *
                                                      1.1,
                                              color: ColorManager.grey),
                                          overflow: TextOverflow.ellipsis),
                                    ],
                                  ),
                                  SizedBox(height: SizeConfig.heightMultiplier),
                                  Row(
                                    children: [
                                      Icon(Icons.favorite,
                                          color: likeGreyColor,
                                          size: 5 *
                                              SizeConfig.imageSizeMultiplier),
                                      Text(
                                        '  1.5 K',
                                        style: getRegularTextStyle(
                                            color: Colors.black,
                                            fontSize: 1.4 *
                                                SizeConfig.textMultiplier),
                                      ),
                                      SizedBox(
                                        width: 3 * SizeConfig.widthMultiplier,
                                      ),
                                      Image.asset('assets/images/comment.png',
                                          height: 5 *
                                              SizeConfig.imageSizeMultiplier,
                                          color: likeGreyColor),
                                      Text(
                                        '  800 Comments',
                                        style: getRegularTextStyle(
                                            color: Colors.black,
                                            fontSize: 1.4 *
                                                SizeConfig.textMultiplier),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 12 * SizeConfig.heightMultiplier,
                              width: 24 * SizeConfig.widthMultiplier,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: ColorManager.primary,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('20',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(color: Colors.white)),
                                    SizedBox(
                                        height:
                                            2 * SizeConfig.heightMultiplier),
                                    Text('15/11/2020',
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline!
                                            .copyWith(color: Colors.white))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 2 * SizeConfig.heightMultiplier,
            left: 2 * SizeConfig.heightMultiplier,
            child: CutomFloatingButton(
              onTap: () {
                Get.to(() => const AddSurveyTemplatePage());
              },
            ),
          ),
          //   const ReportButton(bottom: 7, right: 5, top: 0, left: 0)
        ],
      )),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 4, top: 2),
    );
  }
}
