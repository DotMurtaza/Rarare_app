import 'package:flow1/Resources/color_manager.dart';
import 'package:flow1/Resources/font_manager.dart';
import 'package:flow1/Resources/style_manager.dart';
import 'package:flow1/Resources/values_manager.dart';
import 'package:flow1/Utils/size_config.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //main colors for the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryWithOpcity70,
      primaryColorDark: ColorManager.primaryDark,
      disabledColor: ColorManager.grey1,
      // ignore: deprecated_member_use
      accentColor: ColorManager.grey,
//ripple color
      splashColor: ColorManager.primaryWithOpcity70,

      //card view themeData
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),

      //app bar themeData
      appBarTheme: AppBarTheme(
        elevation: 7,
        titleTextStyle: getRegularTextStyle(
            color: ColorManager.primary, fontSize: FontSizes.s18),
        centerTitle: true,
        color: ColorManager.white,
        shadowColor: ColorManager.grey.withOpacity(0.5),
        toolbarHeight: 50,
      ),

      //Button themeData
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.white,
      ),
      //elevated button theme data
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularTextStyle(
                color: ColorManager.white,
                fontSize: SizeConfig.textMultiplier * 1.8),
            primary: ColorManager.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
      ),
      iconTheme: IconThemeData(color: ColorManager.primary),

      //Text theme
      textTheme: TextTheme(
          headline1: getSemiBoldTextStyle(
              color: ColorManager.darkGrey, fontSize: FontSizes.s16),
          subtitle1: getMediumTextStyle(
              color: ColorManager.lightGrey, fontSize: FontSizes.s14),
          subtitle2: getMediumTextStyle(
              color: ColorManager.primary, fontSize: FontSizes.s14),
          caption: getRegularTextStyle(color: ColorManager.grey1),
          bodyText1: getRegularTextStyle(color: ColorManager.grey)),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
            (states) => ColorManager.primary.withOpacity(0.3)),
      )),

      //input decoration theme data

      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(AppPadding.p12),
          hintStyle: getRegularTextStyle(color: ColorManager.grey1),
          labelStyle: getMediumTextStyle(color: ColorManager.darkGrey),
          errorStyle: getRegularTextStyle(color: ColorManager.error),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff2c2c2c), width: 1),
              borderRadius:
                    BorderRadius.all(Radius.circular(AppSize.s8))),
          //focus border
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.grey1, width: 1),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s8))),
          //error border
          errorBorder: InputBorder.none,
          // OutlineInputBorder(
          //     borderSide:
          //         BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          //     borderRadius:
          //         const BorderRadius.all(Radius.circular(AppSize.s8))),
          //focused Error Border
          border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.grey1, width: 1),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s8))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.grey1, width: 1),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.s8)))));

  //icon
}
