import 'package:flutter/cupertino.dart';

import '../export/export.dart';


//general style text func
TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontFamily: FontConstants.fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight);
}

//regular text style
TextStyle getRegularStyle(
    {double fontSize = FontSize.fontSize12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

//medium text style
TextStyle getMediumStyle(
    {double fontSize = FontSize.fontSize12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

//bold text style
TextStyle getBoldStyle(
    {double fontSize = FontSize.fontSize12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

//simaBold text style
TextStyle getSimaBoldStyle(
    {double fontSize = FontSize.fontSize12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.simaBold, color);
}

//light text style
TextStyle getLightStyle(
    {double fontSize = FontSize.fontSize12, required Color color}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}
