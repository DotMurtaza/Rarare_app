// ignore: file_names
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ElevetedIconButton extends StatelessWidget {
  IconData? iconData;
  String? btnText;
  VoidCallback? voidCallback;
  double? height;
  double? width;
  bool isIcon;

  ElevetedIconButton(
      {Key? key,
      this.btnText,
      this.iconData,
      this.voidCallback,
      this.height,
      this.isIcon = true,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: voidCallback,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            isIcon
                ? Icon(
                    iconData,
                    color: Colors.white,
                    size: 5 * SizeConfig.imageSizeMultiplier,
                  )
                : Container(
                    height: 5 * SizeConfig.heightMultiplier,
                    width: 6 * SizeConfig.widthMultiplier,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ColorManager.white),
                    child: Icon(
                      iconData,
                      size: 4 * SizeConfig.imageSizeMultiplier,
                      color: ColorManager.primary,
                    ),
                  ),
            Text(
              btnText!,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Colors.white,
                  fontSize: 1.5 * SizeConfig.textMultiplier),
            )
          ],
        ),
      ),
    );
  }
}
