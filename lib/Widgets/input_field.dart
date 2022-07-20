import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hint,
    this.icon,
  }) : super(key: key);
  final String hint;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5 * SizeConfig.heightMultiplier,
      child: TextField(
        cursorColor: ColorManager.primaryDark,
        style: getMediumTextStyle(
            fontSize: SizeConfig.textMultiplier * 1.7,
            color: ColorManager.primaryDark),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: getRegularTextStyle(
              color: ColorManager.grey,
              fontSize: SizeConfig.textMultiplier * 1.7),
          // suffixIcon: Icon(Icons.remove_red_eye),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5 * SizeConfig.heightMultiplier,
      width: 90 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: ColorManager.lightGrey, width: 1.5),
      ),
      child: TextField(
        cursorColor: Colors.grey,
        style: getMediumTextStyle(
            fontSize: SizeConfig.textMultiplier * 1.7,
            color: ColorManager.primaryDark),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          suffixIcon: Image.asset("assets/images/search.png"),
          hintText: "Search for a Rent/Rave",
          hintStyle: getRegularTextStyle(
              color: ColorManager.grey,
              fontSize: SizeConfig.textMultiplier * 1.8),
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField(
      {Key? key, this.hint, this.icon, this.isShow, this.voidCallback})
      : super(key: key);
  final String? hint;
  final IconData? icon;
  final bool? isShow;
  final VoidCallback? voidCallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5 * SizeConfig.heightMultiplier,
      child: TextField(
        obscureText: isShow!,
        cursorColor: ColorManager.primaryDark,
        style: getMediumTextStyle(
            fontSize: SizeConfig.textMultiplier * 1.7,
            color: ColorManager.primaryDark),
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: voidCallback,
              child: Icon(
                icon,
                size: 5.5 * SizeConfig.imageSizeMultiplier,
                color: isShow! ? ColorManager.grey : ColorManager.primaryDark,
              ),
            ),
            hintText: hint,
            hintStyle: getRegularTextStyle(
                color: ColorManager.grey,
                fontSize: SizeConfig.textMultiplier * 1.7)),
      ),
    );
  }
}
