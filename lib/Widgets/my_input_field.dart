import 'package:flow1/Resources/color_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyInputField extends StatelessWidget {
  MyInputField({Key? key, this.hinttext, this.maxLines, this.controller})
      : super(key: key);
  String? hinttext;
  int? maxLines;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: hinttext,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText2
            ?.copyWith(fontWeight: FontWeight.bold),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightGrey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
