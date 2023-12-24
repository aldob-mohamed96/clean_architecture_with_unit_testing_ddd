import 'package:flutter/material.dart';
import '../export/export.dart';


abstract class ThemeManager {
  ThemeData get getLightTheme;
  ThemeData get getDarkTheme;
  void changeStatusBarAndNavigationBarColors(ThemeMode themeMode);
}

class ThemeManagerImpl extends ThemeManager {
  ThemeManagerImpl();

  @override
  ThemeData get getLightTheme => _getLightTheme();

  @override
  ThemeData get getDarkTheme => _getDarkTheme();

  _getLightTheme() => ThemeData.light(useMaterial3: true).copyWith();

  _getDarkTheme() => ThemeData.dark(useMaterial3: true).copyWith();

  @override
  void changeStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        _setStatusBarAndNavigationBarColors(
            SystemUiOverlayStyle.light, ColorManager.lightThemeColor);
        break;
      case ThemeMode.dark:
        _setStatusBarAndNavigationBarColors(
            SystemUiOverlayStyle.dark, ColorManager.darkThemeColor);
        break;
      case ThemeMode.system:
      default:
        (AppConstants.defaultThemeModeApp == AppConstants.darkTheme)
            ? _setStatusBarAndNavigationBarColors(
                SystemUiOverlayStyle.dark, ColorManager.darkThemeColor)
            : _setStatusBarAndNavigationBarColors(
                SystemUiOverlayStyle.light, ColorManager.lightThemeColor);
        break;
    }
  }

  void _setStatusBarAndNavigationBarColors(
      SystemUiOverlayStyle overlayStyle, Color color) {
    overlayStyle == SystemUiOverlayStyle.dark
        ? SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.black,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light,
          ))
        : SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
            .copyWith(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness: Brightness.dark));
  }
}
