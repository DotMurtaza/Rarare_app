import 'package:flow1/Contoller/my_account_controller.dart';
import 'package:flow1/Resources/assets_manager.dart';
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Widgets/elevated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserAccountTile extends StatefulWidget {
  const UserAccountTile({Key? key}) : super(key: key);

  @override
  State<UserAccountTile> createState() => _UserAccountTileState();
}

class _UserAccountTileState extends State<UserAccountTile> {
  MyAccountController myAccountController = Get.put(MyAccountController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22 * SizeConfig.heightMultiplier,
      width: 100 * SizeConfig.widthMultiplier,
      color: ColorManager.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GetX<MyAccountController>(
              init: Get.put(MyAccountController()),
              builder: (cont) {
                return Container(
                  height: 10 * SizeConfig.heightMultiplier,
                  width: 22 * SizeConfig.widthMultiplier,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    //  border: Border.all(color: Colors.black),
                  ),
                  child: cont.image.value == null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            AssetsManager.men,
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.file(
                            cont.image.value!,
                            fit: BoxFit.cover,
                          ),
                        ),
                );
              }),
          ElevetedIconButton(
            btnText: 'Upload Picture',
            height: 4 * SizeConfig.heightMultiplier,
            width: 42 * SizeConfig.widthMultiplier,
            iconData: Icons.file_upload_sharp,
            voidCallback: () {
              myAccountController.pickImage(ImageSource.gallery);
            },
          ),
          Text(
            'Armando Marks',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Colors.black, fontSize: 1.8 * SizeConfig.textMultiplier),
          ),
          Text(
            '14527895646',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Colors.grey,
                fontSize: 1 * SizeConfig.textMultiplier,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
