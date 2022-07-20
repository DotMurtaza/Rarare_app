import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class ShareWidgets extends StatelessWidget {
  const ShareWidgets({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);
  final String image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Image.asset(
        image, height: SizeConfig.imageSizeMultiplier * 5,
        color: ColorManager.primary,
        // color: ColorManager.primaryDark,
      ),
    );
  }
}
