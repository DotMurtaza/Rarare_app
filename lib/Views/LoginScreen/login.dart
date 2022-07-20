import 'package:flow1/Resources/assets_manager.dart';
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Views/SignUpScreen/sign_up_screen.dart';
import 'package:flow1/Widgets/auth_button.dart';
import 'package:flow1/Widgets/check_box_widget.dart';
import 'package:flow1/Widgets/input_field.dart';
import 'package:flow1/Widgets/or_widget.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/Widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  RxBool isCheck = false.obs;
  bool ishow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        leading: Container(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Login',
              style: getBoldTextStyle(
                  color: ColorManager.darkGrey,
                  fontSize: SizeConfig.textMultiplier * 2.2),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Stack(
              children: [
                SizedBox(
                  height: SizeConfig.heightMultiplier * 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Image.asset(AssetsManager.splashLogo,
                            height: SizeConfig.imageSizeMultiplier * 25),
                      ),
                      Text(
                        "Login to your account and explore\nwhat's happening near you!",
                        style: getRegularTextStyle(
                          color: ColorManager.grey,
                          fontSize: SizeConfig.textMultiplier * 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 4.5,
                      ),
                      SocialButton(
                        onTap: () {},
                        isFilled: false,
                        title: 'Login with Facebook',
                        image: AssetsManager.facebook,
                      ),
                      SocialButton(
                        onTap: () {},
                        isFilled: true,
                        title: 'Login with Google',
                        image: AssetsManager.google,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 4,
                      ),
                      const ORWidget(),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 4,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: InputField(
                          icon: Icons.email_rounded,
                          hint: 'Email Address',
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: PasswordField(
                          hint: 'Password',
                          isShow: ishow,
                          icon: Icons.remove_red_eye,
                          voidCallback: () {
                            setState(() {
                              ishow = !ishow;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            CheckBoxWidget(isCheck: isCheck),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 1.4,
                            ),
                            Text(
                              'Remember me',
                              style: getRegularTextStyle(
                                  color: ColorManager.grey,
                                  fontSize: SizeConfig.textMultiplier * 1.7),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                showGeneralDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    barrierLabel:
                                        MaterialLocalizations.of(context)
                                            .modalBarrierDismissLabel,
                                    barrierColor: Colors.black45,
                                    transitionDuration:
                                        const Duration(milliseconds: 200),
                                    pageBuilder: (BuildContext buildContext,
                                        Animation animation,
                                        Animation secondaryAnimation) {
                                      return Scaffold(
                                        backgroundColor:
                                            Colors.transparent.withOpacity(0.3),
                                        body: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: ColorManager.white,
                                            ),
                                            width:
                                                SizeConfig.widthMultiplier * 80,
                                            height:
                                                SizeConfig.heightMultiplier *
                                                    40,
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Image.asset(
                                                    AssetsManager.forgot,
                                                    height: SizeConfig
                                                            .imageSizeMultiplier *
                                                        26),
                                                Text('Forgot Password',
                                                    style: getBoldTextStyle(
                                                        color: ColorManager
                                                            .darkGrey,
                                                        fontSize: SizeConfig
                                                                .textMultiplier *
                                                            2)),
                                                SizedBox(
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        1.2),
                                                Text(
                                                  'Enter your email address so we send\nyou the password reset link!',
                                                  style: getRegularTextStyle(
                                                      color: Colors.black,
                                                      fontSize: SizeConfig
                                                              .textMultiplier *
                                                          2),
                                                  textAlign: TextAlign.center,
                                                ),
                                                SizedBox(
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        1.2),
                                                const InputField(
                                                    hint: 'Email Address'),
                                                SizedBox(
                                                    height: SizeConfig
                                                            .heightMultiplier *
                                                        1.2),
                                                AuthButton(
                                                    label: 'Send Link',
                                                    onTap: () {
                                                      Get.back();
                                                    })
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Text('Forgot pasword?',
                                  style: TextStyle(
                                    color: ColorManager.grey,
                                    fontSize: SizeConfig.textMultiplier * 1.7,
                                    decoration: TextDecoration.underline,
                                  )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 6,
                      ),
                      AuthButton(
                        label: 'Login',
                        onTap: () {
                          Get.to(const HomeScreen(
                            index: 0,
                          ));
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New user?',
                            style:
                                getRegularTextStyle(color: ColorManager.grey),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(() => const SignUpScreen());
                              },
                              child: Text(
                                'Sign Up',
                                style: getSemiBoldTextStyle(
                                    color: ColorManager.primaryDark,
                                    fontSize: SizeConfig.textMultiplier * 1.8),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                // const ReportButton(bottom: 7, right: 5, top: 0, left: 0)
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 2, top: 2),
    );
  }
}
