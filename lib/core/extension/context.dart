import '../export/export.dart';
import  'package:flutter/material.dart';


extension BuildContextValue on BuildContext {
  // media query from view edges
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  // view insets from view edges
  double get topViewInsets => MediaQuery.viewInsetsOf(this).top;
  double get bottomViewInsets => MediaQuery.viewInsetsOf(this).bottom;
  double get leftViewInsets => MediaQuery.viewInsetsOf(this).left;
  double get rightViewInsets => MediaQuery.viewInsetsOf(this).right;
  double get toViewInsetsHorizontal => leftViewInsets + rightViewInsets;
  double get toViewInsetsVertical => topViewInsets + bottomViewInsets;

  // padding from view edges
  double get toPaddingBottom => MediaQuery.viewPaddingOf(this).bottom;
  double get toPaddingLeft => MediaQuery.viewPaddingOf(this).left;
  double get toPaddingRight => MediaQuery.viewPaddingOf(this).right;
  double get toPaddingTop => MediaQuery.viewPaddingOf(this).top;
  double get toPaddingHorizontal => toPaddingLeft + toPaddingRight;
  double get toPaddingVertical => toPaddingTop + toPaddingBottom;

  // device pixel ratio and text scale factor
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);
  double get textScaleFactor => MediaQuery.textScaleFactorOf(this);

  // orientation
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;
  Orientation get orientation => MediaQuery.orientationOf(this);

  // platform
  bool get isAndroid => Platform.isAndroid;
  bool get isIOS => Platform.isIOS;
  bool get isFuchsia => Platform.isFuchsia;

  //input
  void unFocusOnTapOutSite(final PointerDownEvent event) {
    if (!FocusScope.of(this).hasPrimaryFocus && FocusScope.of(this).hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  //theme

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  Color get primaryColor => theme.primaryColor;

  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;
  Color get dialogBackgroundColor => theme.dialogBackgroundColor;
  Color get cardColor => theme.cardColor;
  Color get shadowColor => theme.shadowColor;
  Color get canvasColor => theme.canvasColor;
  Color get dividerColor => theme.dividerColor;
  Color get focusColor => theme.focusColor;
  Color get hoverColor => theme.hoverColor;
  Color get highlightColor => theme.highlightColor;
  Color get splashColor => theme.splashColor;
  Color get unselectedWidgetColor => theme.unselectedWidgetColor;
  Color get disabledColor => theme.disabledColor;
  Color get secondaryHeaderColor => theme.secondaryHeaderColor;

  Color get indicatorColor => theme.indicatorColor;
  Color get hintColor => theme.hintColor;
  Color get primaryColorLight => theme.primaryColorLight;
  Color get primaryColorDark => theme.primaryColorDark;

  //color scheme
  Color get onPrimary => colorScheme.onPrimary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get onSurface => colorScheme.onSurface;
  Color get onBackground => colorScheme.onBackground;
  Color get onError => colorScheme.onError;
  Color get primary => colorScheme.primary;
  Color get secondary => colorScheme.secondary;
  Color get surface => colorScheme.surface;
  Color get background => colorScheme.background;
  Color get error => colorScheme.error;
}
