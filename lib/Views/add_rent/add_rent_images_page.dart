import 'dart:io';

import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Views/title_of_rent/title_of_rent_page.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/my_button.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/Widgets/sized_box_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'components/header.dart';
import 'components/step_indicator.dart';

class AddRenImagesPage extends StatefulWidget {
  const AddRenImagesPage({Key? key}) : super(key: key);

  @override
  State<AddRenImagesPage> createState() => _AddRenImagesPageState();
}

class _AddRenImagesPageState extends State<AddRenImagesPage> {
  File? image;
  Future pickImage(ImageSource sr) async {
    try {
      final image = await ImagePicker().pickImage(source: sr);
      if (image == null) {}
      final imageTemporary = File(image!.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        actions: const [CustomAppBar()],
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Drawer(
          child: MyDrawer(
            onTap: () {
              Navigator.of(context).pop();
              showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black45,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext buildContext, Animation animation,
                      Animation secondaryAnimation) {
                    return Scaffold(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        body: Center(
                            child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ColorManager.white,
                            ),
                            width: SizeConfig.widthMultiplier * 60,
                            height: SizeConfig.heightMultiplier * 7,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.check_mark_circled_solid,
                                    color: ColorManager.primaryDark,
                                    size: SizeConfig.imageSizeMultiplier * 5),
                                SizedBox(
                                  width: SizeConfig.widthMultiplier * 2,
                                ),
                                Text('Link Copied',
                                    style: getSemiBoldTextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.textMultiplier * 2))
                              ],
                            ),
                          ),
                        )));
                  });
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                //SizedBox(height: 2 * SizeConfig.heightMultiplier),
                const SizedBoxContainer(
                  height: 1,
                ),
                Header(
                  text: 'Add an Rent/Rave',
                  onTap: () {},
                ),
                const SizedBoxContainer(
                  height: 1,
                ),
                Container(
                  height: 15 * SizeConfig.heightMultiplier,
                  width: 100 * SizeConfig.widthMultiplier,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Two easy steps and you're done!",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.black),
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StepIndicatorWithDoneIcon(
                            isComplete: true,
                            isSelected: true,
                            onTap: () {
                              Get.back();
                            },
                            title: 'Details',
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 2 * SizeConfig.heightMultiplier),
                            child: Container(
                                height: 1,
                                width: 20 * SizeConfig.widthMultiplier,
                                color: Colors.grey),
                          ),
                          StepIndicatorWithDoneIcon(
                            isComplete: false,
                            isSelected: true,
                            onTap: () {},
                            title: 'Images',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBoxContainer(
                  height: 1,
                ),
                Container(
                  height: 60 * SizeConfig.heightMultiplier,
                  width: 100 * SizeConfig.widthMultiplier,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black38, blurRadius: 7),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 3 * SizeConfig.heightMultiplier),
                      Text(
                        'Upload Images',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.black),
                      ),
                      SizedBox(height: 3 * SizeConfig.heightMultiplier),
                      Container(
                        height: 40 * SizeConfig.heightMultiplier,
                        width: 90 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            color: const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                height: 20 * SizeConfig.heightMultiplier,
                                width: 100 * SizeConfig.widthMultiplier,
                                child: image != null
                                    ? Image.file(
                                        image!,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset('assets/images/img.png')
                                // : Icon(Icons.image,
                                //     size: 30 * SizeConfig.imageSizeMultiplier,
                                //     color: Colors.grey),
                                ),
                            const Text('JPG or PNG',
                                style: TextStyle(color: Colors.grey)),
                            const Text('Max File Size: 1MB',
                                style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 2 * SizeConfig.heightMultiplier),
                            RentimageButton(
                              onTap: () {
                                pickImage(ImageSource.gallery);
                              },
                              text: 'Upload from gallery',
                            ),
                            SizedBox(height: 1 * SizeConfig.heightMultiplier),
                            RentimageButton(
                              onTap: () {
                                pickImage(ImageSource.camera);
                              },
                              text: 'Take a picture',
                            ),
                            SizedBox(height: 2 * SizeConfig.heightMultiplier),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBoxContainer(
                  height: 1,
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      onTap: () {
                        Get.back();
                      },
                      text: 'Back',
                      isBack: true,
                    ),
                    SizedBox(width: 2 * SizeConfig.heightMultiplier),
                    MyButton(
                      onTap: () {
                        Get.to(() => const TitleOfRentPage());
                      },
                      text: 'Confirm',
                      isBack: false,
                    ),
                  ],
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
              ],
            ),
            // const ReportButton(bottom: 7, right: 5, top: 0, left: 0)
          ],
        ),
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 4, top: 2),
    );
  }
}

class RentimageButton extends StatelessWidget {
  const RentimageButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 5 * SizeConfig.heightMultiplier,
          width: 60 * SizeConfig.widthMultiplier,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 8),
            ],
          ),
          child: Center(
            child: Text(text, style: const TextStyle(color: Colors.black)),
          )),
    );
  }
}
