import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class CutomFloatingButton extends StatelessWidget {
  const CutomFloatingButton({
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 14 * SizeConfig.heightMultiplier,
          width: 14 * SizeConfig.widthMultiplier,
          decoration: BoxDecoration(
            border: Border.all(
                color: ColorManager.primary.withOpacity(0.4), width: 3),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.5),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorManager.primary, shape: BoxShape.circle),
              child: Center(
                child: Icon(Icons.add,
                    color: Colors.white,
                    size: 8 * SizeConfig.imageSizeMultiplier),
              ),
            ),
          )),
    );
  }
}
