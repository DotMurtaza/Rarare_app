import 'package:flow1/Contoller/my_account_controller.dart';
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Widgets/elevated_icon_button.dart';
import 'package:flow1/Widgets/my_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserOtherInfoTile extends StatefulWidget {
  const UserOtherInfoTile({Key? key}) : super(key: key);

  @override
  State<UserOtherInfoTile> createState() => _UserOtherInfoTileState();
}

class _UserOtherInfoTileState extends State<UserOtherInfoTile> {
  MyAccountController controller = Get.put(MyAccountController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      // height: 65 * SizeConfig.heightMultiplier,
      width: 100 * SizeConfig.widthMultiplier,
      color: ColorManager.white,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 5 * SizeConfig.widthMultiplier),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2 * SizeConfig.heightMultiplier,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevetedIconButton(
                btnText: 'Edit Detail',
                height: 4.5 * SizeConfig.heightMultiplier,
                width: 35 * SizeConfig.widthMultiplier,
                iconData: FontAwesomeIcons.penToSquare,
                voidCallback: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'First Name',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.grey),
                ),
                MyInputField(
                  controller: controller.nameController,
                  hinttext: 'Armando',
                  maxLines: 1,
                ),
                SizedBox(
                  height: 1 * SizeConfig.heightMultiplier,
                ),
                Text(
                  'Last Name',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.grey),
                ),
                MyInputField(
                  controller: controller.lastNameController,
                  maxLines: 1,
                  hinttext: 'Marks',
                ),
                SizedBox(
                  height: 1 * SizeConfig.heightMultiplier,
                ),
                Text(
                  'Gender',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.grey),
                ),
                dropDown(),
                SizedBox(
                  height: 1 * SizeConfig.heightMultiplier,
                ),
                Text(
                  'Address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.grey),
                ),
                MyInputField(
                  controller: controller.addressController,
                  maxLines: 2,
                  hinttext:
                      'House 725,Street 3,Sector G-289,Nigeeria,440 Nigeria',
                ),
                SizedBox(
                  height: 1 * SizeConfig.heightMultiplier,
                ),
                Text(
                  'Email Adress',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.grey),
                ),
                MyInputField(
                  controller: controller.emailController,
                  maxLines: 2,
                  hinttext: 'Armando.marks@hotmail.com',
                ),
                SizedBox(
                  height: 1 * SizeConfig.heightMultiplier,
                ),
                Text(
                  'Password',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.grey),
                ),
                MyInputField(
                  controller: controller.passwordController,
                  maxLines: 2,
                  hinttext: '**************',
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget dropDown() {
    return GetX<MyAccountController>(
        init: Get.put(MyAccountController()),
        builder: (myAccountController) {
          return DropdownButton(
            style: const TextStyle(color: Colors.black),
            isExpanded: true,
            // Initial Value
            value: myAccountController.dropdownvalue.value,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),

            // Array list of items
            items: myAccountController.items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                myAccountController.dropdownvalue.value = newValue!;
              });
            },
          );
        });
  }
}
