import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorManager.primaryDark, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 4,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ]),
      height: SizeConfig.heightMultiplier * 5,
      width: SizeConfig.widthMultiplier * 45,
      child: ElevatedButton(
          onPressed: () {
            onTap();
          },
          child: Text(
            label,
            style: getRegularTextStyle(
                color: ColorManager.white,
                fontSize: SizeConfig.textMultiplier * 1.8),
          )),
    );
  }
}
