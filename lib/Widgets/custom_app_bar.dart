import 'package:badges/badges.dart';
import 'package:flow1/Resources/assets_manager.dart';
import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/MyAccount/my_account_page.dart';
import 'package:flow1/Views/shop_pages/shop_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Get.to(const ShopPages());
            },
            icon: Badge(
              padding: const EdgeInsets.all(3),
              badgeColor: ColorManager.primaryDark,
              badgeContent: Text(
                "20",
                style: getRegularTextStyle(
                    color: ColorManager.white,
                    fontSize: SizeConfig.textMultiplier * 1),
              ),
              child: Icon(CupertinoIcons.cart_fill,
                  size: SizeConfig.imageSizeMultiplier * 6.5,
                  color: ColorManager.grey),
            )),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
          child: VerticalDivider(
            color: Colors.black,
            width: 3,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        GestureDetector(
          onTap: () {
            Get.to(const MyAccountPage());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Armondo Marks',
                style: getSemiBoldTextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.textMultiplier * 2.0),
              ),
              Text(
                '1234567890',
                style: getRegularTextStyle(
                    color: Colors.black,
                    fontSize: SizeConfig.textMultiplier * 1.6),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(const MyAccountPage());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(AssetsManager.men,
                    fit: BoxFit.cover,
                    height: SizeConfig.heightMultiplier * 5,
                    width: SizeConfig.widthMultiplier * 8.5)),
          ),
        ),
      ],
    );
  }
}
