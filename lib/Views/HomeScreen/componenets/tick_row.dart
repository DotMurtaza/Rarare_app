import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Widgets/check_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class TIckButtonsRow extends StatelessWidget {
  const TIckButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CheckBoxWidget(isCheck: true.obs),
          Text(
            "All",
            style: getRegularTextStyle(color: ColorManager.darkGrey),
          ),
          CheckBoxWidget(isCheck: false.obs),
          Text(
            "Rants",
            style: getRegularTextStyle(color: ColorManager.darkGrey),
          ),
          CheckBoxWidget(isCheck: false.obs),
          Text(
            "Rave",
            style: getRegularTextStyle(color: ColorManager.darkGrey),
          ),
          // Spacer(),
          SizedBox(width: SizeConfig.widthMultiplier * 5),
          TextButton.icon(
              onPressed: () {},
              icon: Image.asset('assets/images/location.png'),
              label: Text(
                'Current location',
                style: getSemiBoldTextStyle(color: ColorManager.darkGrey),
              ))
        ],
      ),
    );
  }
}
