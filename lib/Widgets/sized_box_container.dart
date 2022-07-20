import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class SizedBoxContainer extends StatelessWidget {
  const SizedBoxContainer({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * SizeConfig.heightMultiplier,
        width: 100 * SizeConfig.widthMultiplier,
        color: const Color(0xffE3E3E3));
  }
}
