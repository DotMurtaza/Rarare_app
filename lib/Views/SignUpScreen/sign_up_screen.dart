import 'package:flow1/Resources/assets_manager.dart';
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Views/LoginScreen/login.dart';
import 'package:flow1/Widgets/auth_button.dart';
import 'package:flow1/Widgets/input_field.dart';
import 'package:flow1/Widgets/or_widget.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/Widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool ishow = true;
  bool ishow1 = false;
  var isCheck = false;
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
              'Sign Up',
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
                        "Sign up and be a contributing\nmember of the society!",
                        style: getRegularTextStyle(
                          color: ColorManager.grey,
                          fontSize: SizeConfig.textMultiplier * 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 2.5,
                      ),
                      SocialButton(
                        onTap: () {},
                        isFilled: false,
                        title: 'Sign Up with Facebook',
                        image: AssetsManager.facebook,
                      ),
                      SocialButton(
                        onTap: () {},
                        isFilled: true,
                        title: 'Sign Up with Google',
                        image: AssetsManager.google,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.5,
                      ),
                      const ORWidget(),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 1.5,
                      ),
                      SizedBox(
                        width: 75 * SizeConfig.widthMultiplier,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 36,
                              height: SizeConfig.heightMultiplier * 5,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: InputField(
                                  icon: Icons.person,
                                  hint: 'First Name',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 38,
                              height: SizeConfig.heightMultiplier * 5,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: InputField(
                                  icon: Icons.person,
                                  hint: 'Last Name',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1 * SizeConfig.heightMultiplier,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22,
                        ),
                        child: InputField(
                          icon: Icons.email_rounded,
                          hint: 'Email Address',
                        ),
                      ),
                      SizedBox(
                        height: 1 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                        ),
                        child: PasswordField(
                          hint: 'Confirm Password',
                          isShow: ishow,
                          icon: Icons.remove_red_eye,
                          voidCallback: () {
                            setState(() {
                              ishow = !ishow;
                            });
                          },
                        ),
                      ),
                      // SizedBox(
                      //   height: SizeConfig.heightMultiplier * 1.4,
                      // ),
                      SizedBox(
                        height: 1 * SizeConfig.heightMultiplier,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: PasswordField(
                          hint: 'Confirm Password',
                          isShow: ishow1,
                          icon: Icons.remove_red_eye,
                          voidCallback: () {
                            setState(() {
                              ishow1 = !ishow1;
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
                            Container(
                              height: SizeConfig.heightMultiplier * 3,
                              width: SizeConfig.widthMultiplier * 7,
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: ColorManager.grey)),
                              child: Checkbox(
                                  side: BorderSide(color: ColorManager.white),
                                  value: isCheck,
                                  checkColor: ColorManager
                                      .primaryDark, // color of tick Mark
                                  activeColor: ColorManager.primaryDark,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCheck = value!;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: SizeConfig.widthMultiplier * 1.4,
                            ),
                            Flexible(
                              child: Text(
                                'I agree to the terms & conditions and privacy policy ',
                                style: getRegularTextStyle(
                                    color: ColorManager.grey,
                                    fontSize: SizeConfig.textMultiplier * 1.7),
                              ),
                            ),
                            // const Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 6,
                      ),
                      AuthButton(
                        label: 'Sign up',
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
                            'Already a member?',
                            style:
                                getRegularTextStyle(color: ColorManager.grey),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(const LoginScreen());
                              },
                              child: Text(
                                'Login',
                                style: getSemiBoldTextStyle(
                                    color: ColorManager.primaryDark,
                                    fontSize: SizeConfig.textMultiplier * 1.8),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                //const ReportButton(bottom: 7, right: 5, top: 0, left: 0)
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
