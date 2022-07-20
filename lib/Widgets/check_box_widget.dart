import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    Key? key,
    required this.isCheck,
  }) : super(key: key);

  final RxBool isCheck;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: SizeConfig.heightMultiplier * 2.7,
        width: SizeConfig.widthMultiplier * 6,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: ColorManager.grey)),
        child: Checkbox(
            side: BorderSide(color: ColorManager.white),
            value: isCheck.value,
            checkColor: ColorManager.primaryDark, // color of tick Mark
            activeColor: ColorManager.primaryDark,
            onChanged: (bool? value) {
              isCheck.value = value!;
              // setState(() {

              // });
            }),
      ),
    );
  }
}
