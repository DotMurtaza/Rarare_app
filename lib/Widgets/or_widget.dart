import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class ORWidget extends StatelessWidget {
  const ORWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: SizeConfig.widthMultiplier * 30,
            child: Divider(
              height: 2,
              thickness: 2,
              color: ColorManager.grey,
            ),
          ),
        ),
        Text(
          'OR',
          style: getRegularTextStyle(color: ColorManager.grey),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: SizeConfig.widthMultiplier * 30,
            child: Divider(
              height: 2,
              thickness: 2,
              color: ColorManager.grey,
            ),
          ),
        ),
      ],
    );
  }
}
