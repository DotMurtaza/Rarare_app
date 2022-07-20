import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopHeader extends StatelessWidget {
  const ShopHeader({Key? key}) : super(key: key);

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 6 * SizeConfig.imageSizeMultiplier,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 5 * SizeConfig.widthMultiplier,
                ),
                Text(
                  'Shop',
                  style: TextStyle(
                      fontSize: 2.5 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  'Current Balance: ',
                  style: TextStyle(
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 3 * SizeConfig.widthMultiplier,
                ),
                Text(
                  '50',
                  style: TextStyle(
                      fontSize: 2 * SizeConfig.textMultiplier,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.primary),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
