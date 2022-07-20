import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flow1/Views/HomeScreen/home_scren.dart';
import 'package:flow1/Widgets/auth_button.dart';
import 'package:flow1/Widgets/custom_app_bar.dart';
import 'package:flow1/Widgets/input_field.dart';
import 'package:flow1/Widgets/report_button.dart';
import 'package:flow1/Widgets/shop_header.dart';
import 'package:flow1/Widgets/sized_box_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayPalLoginPage extends StatefulWidget {
  const PayPalLoginPage({Key? key}) : super(key: key);

  @override
  State<PayPalLoginPage> createState() => _PayPalLoginPageState();
}

class _PayPalLoginPageState extends State<PayPalLoginPage> {
  bool ishow = false;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBoxContainer(height: 1),
            const ShopHeader(),
            Container(
              height: 1 * SizeConfig.heightMultiplier,
              color: ColorManager.lightGrey,
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 4,
            ),
            SizedBox(
                height: 20 * SizeConfig.heightMultiplier,
                width: 20 * SizeConfig.widthMultiplier,
                child: Image.asset('assets/images/paypal_PNG22.png')),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: InputField(
                icon: Icons.email_rounded,
                hint: 'Email Address',
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 1.4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: PasswordField(
                hint: 'Password',
                isShow: ishow,
                icon: Icons.remove_red_eye,
                voidCallback: () {
                  setState(() {
                    ishow = !ishow;
                  });
                },
              ),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 4,
            ),
            AuthButton(
              label: 'Login',
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton:
          const ReportButton(left: 2, right: 2, bottom: 2, top: 2),
    );
  }
}
