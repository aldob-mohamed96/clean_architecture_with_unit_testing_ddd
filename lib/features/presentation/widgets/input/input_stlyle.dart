//border
import 'package:flutter/material.dart';


import '../../../../core/export/export.dart';


OutlineInputBorder getInputBorder(
        {double borderRaduis = AppSize.appSize4,
        Color colorBorder = ColorManager.transparentColor,
        double widthBorder = AppSize.appSize1}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRaduis)),
      borderSide: BorderSide(color: colorBorder, width: widthBorder),
    );

OutlineInputBorder getInputBorderError(
        {double borderRaduis = AppSize.appSize4,
        Color colorBorder = ColorManager.errorColor,
        double widthBorder = AppSize.appSize1}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRaduis)),
      borderSide: BorderSide(color: colorBorder, width: widthBorder),
    );

//hint style
TextStyle getHintStyle(
        {Color colorHint = ColorManager.hintColor,
        double fontSizeHint = AppSize.appSize16,
        FontWeight fontWeightHint = FontWeight.w500}) =>
    TextStyle(
        color: colorHint.withOpacity(AppSize.appSize0_70),
        fontSize: fontSizeHint,
        fontWeight: fontWeightHint);

//text style
TextStyle getTextStyle(
        {Color colorText = ColorManager.blackColor,
        double fontSizeText = AppSize.appSize16,
        FontWeight fontWeightText = FontWeight.w500}) =>
    TextStyle(
        color: colorText, fontSize: fontSizeText, fontWeight: fontWeightText);

//error style
TextStyle getErrorStyle(
        {Color colorError = ColorManager.errorColor,
        double fontSizeError = AppSize.appSize14,
        FontWeight fontWeightError = FontWeight.w400}) =>
    TextStyle(
        color: colorError,
        fontSize: fontSizeError,
        fontWeight: fontWeightError);
