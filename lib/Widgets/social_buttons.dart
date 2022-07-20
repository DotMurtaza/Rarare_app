import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.image,
    required this.isFilled,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final bool isFilled;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
        //onTap!();
      },
      child: Container(
        height: 4.5 * SizeConfig.heightMultiplier,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(color: ColorManager.primaryDark),
            color: isFilled == false
                ? ColorManager.primaryDark
                : ColorManager.white,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(image, height: SizeConfig.imageSizeMultiplier * 4),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(title,
                  style: getSemiBoldTextStyle(
                      fontSize: SizeConfig.textMultiplier * 1.8,
                      color: isFilled == false
                          ? ColorManager.white
                          : ColorManager.primaryDark)),
            ),
          ],
        ),
      ),
    );
  }
}
