import 'dart:ui';

import 'package:flow1/Resources/assets_manager.dart';
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/models/person_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/custom_slider.dart';
import 'components/post_status.dart';

class TitleOfRentPage extends StatefulWidget {
  const TitleOfRentPage({Key? key}) : super(key: key);

  @override
  State<TitleOfRentPage> createState() => _TitleOfRentPageState();
}

class _TitleOfRentPageState extends State<TitleOfRentPage>
    with TickerProviderStateMixin {
  bool isLike = false;
  bool isComment = false;

  AnimationController? controller;
  @override
  initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller!.duration = const Duration(seconds: 10);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

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
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: 100 * SizeConfig.widthMultiplier,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black54,
                          //     blurRadius: 15.0,
                          //     offset: Offset(0.0, 0.75),
                          //   ),
                          // ],
                          boxShadow: kElevationToShadow[4]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2 * SizeConfig.heightMultiplier),
                          const CustomSlider(),
                          // SizedBox(height: 2 * SizeConfig.heightMultiplier),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Title of the Rant/Rave',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                2 * SizeConfig.textMultiplier)),
                                Text(
                                    'Lorerm ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 1.4 *
                                                SizeConfig.textMultiplier)),
                                const SizedBox(height: 6),
                                Text(
                                  'See More',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(
                                          color: Colors.black,
                                          // fontWeight: FontWeight.bold,
                                          fontSize:
                                              1.6 * SizeConfig.textMultiplier),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: ColorManager.primary,
                                        size:
                                            4 * SizeConfig.imageSizeMultiplier),
                                    const SizedBox(width: 6),
                                    Flexible(
                                      child: Text(
                                        'Lorerm ipsum dolor sit amet, consetetur sadipscing elitr',
                                        style: getRegularTextStyle(
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 6 * SizeConfig.heightMultiplier,
                      width: 100 * SizeConfig.widthMultiplier,
                      color: const Color(0xffE9E9E9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isLike = !isLike;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2 * SizeConfig.widthMultiplier),
                              height: 4.5 * SizeConfig.heightMultiplier,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorManager.primary, width: 1.2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 10)
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: isLike == true
                                        ? ColorManager.primary
                                        : likeGreyColor,
                                  ),
                                  const SizedBox(width: 10),
                                  Text('Like',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isComment = !isComment;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2 * SizeConfig.widthMultiplier),
                              height: 4.5 * SizeConfig.heightMultiplier,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorManager.primary, width: 1.2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 10)
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/comment.png',
                                    height: 5 * SizeConfig.imageSizeMultiplier,
                                    color: isComment == true
                                        ? ColorManager.primary
                                        : likeGreyColor,
                                  ),
                                  const SizedBox(width: 10),
                                  Text('Comment',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              share(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2 * SizeConfig.widthMultiplier),
                              height: 4.5 * SizeConfig.heightMultiplier,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorManager.primary, width: 1.2),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 10)
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/share.png',
                                    height: 5 * SizeConfig.imageSizeMultiplier,
                                    color: likeGreyColor,
                                  ),
                                  const SizedBox(width: 10),
                                  Text('Share',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const PostStatus(),
                    // SizedBox(height: 5),
                    Container(
                      height: 1 * SizeConfig.heightMultiplier,
                      width: 100 * SizeConfig.widthMultiplier,
                      color: const Color(0xffe9e9e9),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: SizedBox(
                        height: 45 * SizeConfig.heightMultiplier,
                        child: ListView.builder(
                          itemCount: personData.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Person data = personData[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundImage:
                                            AssetImage(data.imgPath),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(data.personName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: Colors.black)),
                                      const Spacer(),
                                      Text(data.time,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  color: likeGreyColor,
                                                  fontSize: 10)),
                                      const SizedBox(width: 2),
                                      Container(
                                          height: 10,
                                          width: 2,
                                          color: likeGreyColor),
                                      const SizedBox(width: 2),
                                      Text('April 2, 2020',
                                          style: Theme.of(context)
                                              .textTheme
                                              .overline!
                                              .copyWith(
                                                  color: likeGreyColor,
                                                  fontSize: 10)),
                                    ],
                                  ),
                                  Text(data.message,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          )),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            12 * SizeConfig.widthMultiplier),
                                    child: const Divider(color: likeGreyColor),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 8 * SizeConfig.heightMultiplier,
                    width: 100 * SizeConfig.widthMultiplier,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8 * SizeConfig.widthMultiplier,
                          vertical: 2 * SizeConfig.heightMultiplier),
                      child: Container(
                        height: 6 * SizeConfig.heightMultiplier,
                        width: 90 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                          color: const Color(0xffEBEBEB),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 65 * SizeConfig.widthMultiplier,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: 'Write a comment',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(color: Colors.black54)),
                              ),
                            ),
                            Icon(Icons.emoji_emotions_outlined,
                                color: Colors.black,
                                size: 5 * SizeConfig.imageSizeMultiplier),
                            Container(height: 20, width: 1, color: Colors.grey),
                            Icon(Icons.send,
                                color: ColorManager.primary,
                                size: 5 * SizeConfig.imageSizeMultiplier),
                            const SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // const ReportButton(bottom: 7, right: 5, top: 0, left: 0)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 45, top: 2),
    );
  }

  void share(BuildContext context) {
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
                        height: 12 * SizeConfig.heightMultiplier,
                        width: 70 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 18),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Share',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/images/whatsapp.png',
                                    color: ColorManager.primary),
                                Image.asset('assets/images/facebook1.png',
                                    color: ColorManager.primary,
                                    height: 2.5 * SizeConfig.heightMultiplier),
                                Image.asset(
                                  'assets/images/insta.png',
                                  color: ColorManager.primary,
                                ),
                                Image.asset('assets/images/twitter.png',
                                    color: ColorManager.primary,
                                    height: 2.5 * SizeConfig.heightMultiplier),
                                Image.asset(AssetsManager.copy,
                                    color: ColorManager.primary,
                                    height: 2.3 * SizeConfig.heightMultiplier),
                              ],
                            ),
                          ],
                        ),
                      ),
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
