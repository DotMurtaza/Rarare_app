import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class MyAccountHeader extends StatelessWidget {
  const MyAccountHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 6 * SizeConfig.heightMultiplier,
      width: 100 * SizeConfig.widthMultiplier,
      decoration: const BoxDecoration(color: Color(0xffffffff)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Account',
              style: TextStyle(
                  fontSize: 2.5 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.w700),
            ),
            Icon(
              Icons.done,
              color: ColorManager.primary,
            )
          ],
        ),
      ),
    );
  }
}
