import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

class CalculationBox extends StatelessWidget {
  const CalculationBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 15 * SizeConfig.heightMultiplier,
      width: 100 * SizeConfig.widthMultiplier,
      decoration: BoxDecoration(
        color: likeGreyColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/calculator.png",
                    color: Colors.white,
                    height: 8 * SizeConfig.heightMultiplier),
                Text('You will need 2000\npoints to create this\nsurvey',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.white)),
                const Spacer(),
                Column(
                  children: [
                    Text('2000',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('Points',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.white)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
