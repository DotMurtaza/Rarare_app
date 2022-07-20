import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDow extends StatefulWidget {
  const CustomDropDow({
    Key? key,
    // required this.child,
  }) : super(key: key);

  // final Widget child;

  @override
  State<CustomDropDow> createState() => _CustomDropDowState();
}

class _CustomDropDowState extends State<CustomDropDow> {
  bool isOpen = false;
  bool isCheck1 = false;
  bool isCheck2 = false;
  bool isCheck3 = false;
  bool isCheck4 = false;
  bool isCheck5 = false;
  bool isCheck6 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Container(
            height: 6 * SizeConfig.heightMultiplier,
            width: 100 * SizeConfig.widthMultiplier,
            decoration: BoxDecoration(
              color: isOpen ? ColorManager.primary : Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4 * SizeConfig.widthMultiplier,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Template Title',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.black)),
                  Icon(
                      isOpen
                          ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_down,
                      color: isOpen ? Colors.white : Colors.black),
                ],
              ),
            ),
          ),
        ),
        isOpen
            ? Container(
                height: 30 * SizeConfig.heightMultiplier,
                width: 100 * SizeConfig.widthMultiplier,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                          'Lorem ispum dolor sit amet, consetetur adipscing elittr, sed diam',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.black)),
                      Row(
                        children: [
                          Checkbox(
                              value: isCheck1,
                              onChanged: (val) {
                                setState(() {
                                  isCheck1 = val!;
                                });
                              }),
                          Text('Lorem ispum dolor sit amet, consetetur',
                              style: TextStyle(
                                  color:
                                      isCheck1 ? Colors.black : Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: isCheck2,
                              onChanged: (val) {
                                setState(() {
                                  isCheck2 = val!;
                                });
                              }),
                          Text('Lorem ispum dolor sit amet, consetetur',
                              style: TextStyle(
                                  color:
                                      isCheck2 ? Colors.black : Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: isCheck3,
                              onChanged: (val) {
                                setState(() {
                                  isCheck3 = val!;
                                });
                              }),
                          Text('Lorem ispum dolor sit amet, consetetur',
                              style: TextStyle(
                                  color:
                                      isCheck3 ? Colors.black : Colors.grey)),
                        ],
                      ),
                      Text(
                          'Lorem ispum dolor sit amet, consetetur adipscing elittr, sed diam',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.black)),
                      Row(
                        children: [
                          Checkbox(
                              value: isCheck4,
                              onChanged: (val) {
                                setState(() {
                                  isCheck4 = val!;
                                });
                              }),
                          Text('Lorem ispum dolor sit amet, consetetur',
                              style: TextStyle(
                                  color:
                                      isCheck4 ? Colors.black : Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: isCheck5,
                              onChanged: (val) {
                                setState(() {
                                  isCheck5 = val!;
                                });
                              }),
                          Text('Lorem ispum dolor sit amet, consetetur',
                              style: TextStyle(
                                  color:
                                      isCheck5 ? Colors.black : Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: isCheck6,
                              onChanged: (val) {
                                setState(() {
                                  isCheck6 = val!;
                                });
                              }),
                          Text('Lorem ispum dolor sit amet, consetetur',
                              style: TextStyle(
                                  color:
                                      isCheck6 ? Colors.black : Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
