import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class MyField extends StatelessWidget {
  const MyField({
    this.isLarge = false,
    this.extraLarge = false,
    required this.hintText,
    required this.controller,
    Key? key,
  }) : super(key: key);
  final bool isLarge, extraLarge;
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: extraLarge
          ? 35 * SizeConfig.heightMultiplier
          : isLarge
              ? 10 * SizeConfig.heightMultiplier
              : 5 * SizeConfig.heightMultiplier,
      width: 90 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black)),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        maxLines: isLarge ? 5 : 2,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.grey),
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
