import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.text,
    required this.isBack,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final bool isBack;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 4.5 * SizeConfig.heightMultiplier,
        width: 35 * SizeConfig.widthMultiplier,
        decoration: BoxDecoration(
          color: isBack ? Colors.white : ColorManager.primary,
          border:
              Border.all(color: isBack ? Colors.black : ColorManager.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(text,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: isBack ? Colors.black : Colors.white,
                  fontWeight: FontWeight.normal)),
        ),
      ),
    );
  }
}
