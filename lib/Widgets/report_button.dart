import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportButton extends StatelessWidget {
  const ReportButton({
    Key? key,
    required this.left,
    required this.right,
    required this.bottom,
    required this.top,
  }) : super(key: key);
  final double left;
  final double right;
  final double bottom;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(
            left * SizeConfig.widthMultiplier,
            top * SizeConfig.heightMultiplier,
            right * SizeConfig.widthMultiplier,
            bottom * SizeConfig.heightMultiplier),
        child: GestureDetector(
          onTap: () {
            Get.to(() => ChatPage());
          },
          child: const CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            backgroundImage: AssetImage(
              'assets/images/report.png',
            ),
          ),
        ));
  }
}
