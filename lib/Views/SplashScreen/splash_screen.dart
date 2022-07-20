import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flow1/Resources/assets_manager.dart';
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/LoginScreen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // ignore: must_call_super
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Get.to(() => const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInUp(
              delay: const Duration(seconds: 2),
              child: Image.asset(
                AssetsManager.splashLogo,
                height: SizeConfig.imageSizeMultiplier * 38,
              ),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 0.3),
            FadeInUp(
              delay: const Duration(seconds: 3),
              child: Text(
                'RaRaRe',
                style: getSemiBoldTextStyle(
                    color: ColorManager.lightGrey,
                    fontSize: SizeConfig.textMultiplier * 3.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
