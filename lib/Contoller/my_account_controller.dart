import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyAccountController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final image = Rxn<File>();

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) {}
      final imageTemporary = File(image!.path);

      this.image.value = imageTemporary;
    } catch (e) {
      // print(e.toString());
    }
  }

  var items = [
    'NO Set',
    'Male',
    'Female',
  ];

  RxString dropdownvalue = 'NO Set'.obs;
}
