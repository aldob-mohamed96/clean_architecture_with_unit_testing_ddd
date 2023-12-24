import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._();
 
  static const Color primaryColor = Color(0xFF1E88E5);
  static const Color primaryColorDark = Color(0xFF0D47A1);
  static const Color primaryColorLight = Color(0xFFBBDEFB);
  static const Color accentColor = Color(0xFF00B0FF);
  static const Color primaryTextColor = Color(0xFF212121);
  static const Color secondaryTextColor = Color(0xFF757575);
  static const Color dividerColor = Color(0xFFBDBDBD);
  static const Color disabledColor = Color(0xFFBDBDBD);
  static const Color hintColor = Color(0xFFBDBDBD);
  static const Color unselectedWidgetColor = Color(0xFFBDBDBD);
  static const Color buttonColor = Color(0xFF1E88E5);
  static const Color cursorColor = Color(0xFF1E88E5);
  static const Color textSelectionColor = Color(0xFF1E88E5);
  static const Color textSelectionHandleColor = Color(0xFF1E88E5);
  static const Color highlightColor = Color(0xFF1E88E5);
  static const Color indicatorColor = Color(0xFF1E88E5);
  static const Color hintTextColor = Color(0xFFBDBDBD);
  static const Color toggleableActiveColor = Color(0xFF1E88E5);
  static const Color selectedRowColor = Color(0xFFBBDEFB);
  static const Color secondaryHeaderColor = Color(0xFFE3F2FD);
  static const Color dialogButtonColor = Color(0xFF1E88E5);
  static const Color textButtonColor = Color(0xFF1E88E5);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color iconColor = Color(0xFF757575);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color scaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const Color splashColor = Color(0xFF1E88E5);
  static const Color focusColor = Color(0xFF1E88E5);
  static const Color dialogBackgroundColor = Color(0xFFFFFFFF);     
  static const Color errorColor = Color(0xFFD32F2F);
  static const Color successColor = Color(0xFF388E3C);
  static const Color warningColor = Color(0xFFFFA000);
  static const Color infoColor = Color(0xFF1976D2);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color greyColor = Color(0xFF9E9E9E);
  static const Color greyColorLight = Color(0xFFEEEEEE);
  static const Color greyColorDark = Color(0xFF212121);
  static const Color transparentColor = Color(0x00000000);
  static const Color lightThemeColor = Color(0xFFFFFFFF);
  static const Color darkThemeColor = Color(0xFF212121);
 
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
