import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class StepsIndicator extends StatelessWidget {
  const StepsIndicator({
    Key? key,
    required this.onTap,
    required this.title,
    required this.isSelected,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            // height: 5.5 * SizeConfig.heightMultiplier,
            width: 5.5 * SizeConfig.widthMultiplier,

            decoration: BoxDecoration(
                color: isSelected
                    ? ColorManager.primary.withOpacity(0.2)
                    : ColorManager.primary,
                shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 2 * SizeConfig.heightMultiplier,
                width: 2 * SizeConfig.widthMultiplier,
                decoration: BoxDecoration(
                    color: isSelected
                        ? ColorManager.primary
                        : ColorManager.primary,
                    shape: BoxShape.circle),
                child: isSelected
                    ? Center(
                        child: Icon(
                          Icons.done,
                          color: ColorManager.white,
                          size: SizeConfig.imageSizeMultiplier * 3,
                        ),
                      )
                    :const SizedBox(),
              ),
            ),
          ),
          Text(title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: isSelected ? Colors.black : ColorManager.primary)),
        ],
      ),
    );
  }
}

class StepIndicatorWithDoneIcon extends StatelessWidget {
  const StepIndicatorWithDoneIcon({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    required this.isComplete,
  }) : super(key: key);
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isComplete;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            // height: 5.5 * SizeConfig.heightMultiplier,
            width: 5.5 * SizeConfig.widthMultiplier,

            decoration: BoxDecoration(
                color: isComplete
                    ? ColorManager.primary
                    : isSelected
                        ? ColorManager.primary.withOpacity(0.4)
                        : ColorManager.primary,
                shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                height: 3 * SizeConfig.heightMultiplier,
                width: 3 * SizeConfig.widthMultiplier,
                decoration: BoxDecoration(
                    color: isComplete
                        ? ColorManager.primary
                        : isSelected
                            ? ColorManager.primary
                            : Colors.white,
                    shape: BoxShape.circle),
                child: isComplete
                    ? Center(
                        child: Icon(Icons.done,
                            color: Colors.white,
                            size: 1.5 * SizeConfig.heightMultiplier))
                    : const SizedBox(),
              ),
            ),
          ),
          Text(title,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: isSelected ? ColorManager.primary : Colors.black)),
        ],
      ),
    );
  }
}
