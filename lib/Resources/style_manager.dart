import 'package:flow1/Resources/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

TextStyle _getTextStyle(
    double fontSize, FontWeight fontWeight, String fontFmaily, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFmaily,
      color: color);
}

TextStyle getRegularTextStyle(
    {double fontSize = FontSizes.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.regular, FontConstants.fontFamily, color);
}

TextStyle getLightTextStyle(
    {double fontSize = FontSizes.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.light, FontConstants.fontFamily, color);
}

TextStyle getBoldTextStyle(
    {double fontSize = FontSizes.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.bold, FontConstants.fontFamily, color);
}

TextStyle getSemiBoldTextStyle(
    {double fontSize = FontSizes.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.semiBold, FontConstants.fontFamily, color);
}

TextStyle getDrawerText(
    {double fontSize = FontSizes.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.regular, FontConstants.fontFamily, color);
}

TextStyle getMediumTextStyle(
    {double fontSize = FontSizes.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeightManager.medium, FontConstants.fontFamily, color);
}
