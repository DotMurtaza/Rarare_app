import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Views/add_rent/components/header.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/sized_box_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  List<String> message = [
    "Hello There! Good Morning! It's now 05:00 PM in Islamabad, Pakistan",
    "Thank you for your effort in making a difference to the community!",
    "Before we start, please login or sign in up so i can assist you better with submitting, searching and tracking your requests.",
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
      body: SafeArea(
        child: SizedBox(
          height: 100 * SizeConfig.heightMultiplier,
          width: 100 * SizeConfig.widthMultiplier,
          child: Stack(
            children: [
              Column(
                children: [
                  // SizedBox(height: 1 * SizeConfig.heightMultiplier),
                  const SizedBoxContainer(
                    height: 1,
                  ),
                  Header(
                    onTap: () {
                      Get.back();
                    },
                    text: 'Messages',
                  ),
                  const SizedBoxContainer(
                    height: 1,
                  ),
                  SizedBox(
                    height: 40 * SizeConfig.heightMultiplier,
                    child: ListView.builder(
                      itemCount: message.length,
                      itemBuilder: (BuildContext context, int index) {
                        return message.length == 2
                            ? const Text(
                                '12:45 PM',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height:
                                              6 * SizeConfig.heightMultiplier,
                                          width: 6 * SizeConfig.widthMultiplier,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 8)
                                            ],
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  'assets/images/speaker.webp'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                4 * SizeConfig.widthMultiplier),
                                        Container(
                                          // height: 15 * SizeConfig.heightMultiplier,
                                          width:
                                              80 * SizeConfig.widthMultiplier,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 8),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(message[index],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        color: Colors.black)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            2 * SizeConfig.heightMultiplier),
                                  ],
                                ),
                              );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChatAuthButton(
                        onTap: () {},
                        text: 'Login',
                      ),
                      SizedBox(width: 2 * SizeConfig.widthMultiplier),
                      ChatAuthButton(
                        onTap: () {},
                        text: 'Sign up',
                      )
                    ],
                  ),
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
                                  hintText: 'How can i help you?',
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
            ],
          ),
        ),
      ),
    );
  }
}

class ChatAuthButton extends StatelessWidget {
  const ChatAuthButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 6 * SizeConfig.heightMultiplier,
          width: 40 * SizeConfig.widthMultiplier,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  ColorManager.primary,
                  const Color(0xff26D6E2),
                  const Color(0xff06CFF1)
                ],
              ),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8)
              ]),
          child: Center(
            child: Text(text,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.white)),
          )),
    );
  }
}
