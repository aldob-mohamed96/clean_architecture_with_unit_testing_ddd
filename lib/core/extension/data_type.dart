

import '../export/export.dart';
import  'package:flutter/material.dart';



extension NonNullStringData on String {
  String getNamedLocation() {
    if (startsWith('/') && length > 1) {
      return substring(1);
    } else if (this == '/') {
      return 'splash';
    }
    return this;
  }

 
  String concantanate({required String value}) => '$this $value';

  String toPhoneInputStlyle() {
    
    if(length == 10 && startsWith('09')){
      return substring(1);
    }
    else if(length == 13 && startsWith('+218')){
      return substring(4);
    }
    if(length == 12 && startsWith('+218')){
      return substring(3);
    }
    return this;
  }
  String toPhoneStyle(){
    if(length == 9 && startsWith('9')){
      return '+218$this';
    }
    else if( startsWith('+218')){
      return this;
    }
    else if(length == 10 && startsWith('09')){
      return '+218$this';
    }
    else if(length == 12 && startsWith('218')){
      return '+$this';
    }
    else if(length == 13 && startsWith('+218')){
      return this;
    }
    return this;
  }


}

extension NonNullString on String? {
  String toEnglishNumber() => convertDigitsToLatin(orEmptyString());

  Widget toAssetLottie(
          {double height = AppSize.appSize200,
          BoxFit fit = BoxFit.cover,
          Alignment alignment = Alignment.center,
          double width = AppSize.appSize200}) =>
      Lottie.asset(this ?? AppConstants.defaultEmptyString,
          height: height,
          width: width,
          alignment: alignment,
          errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.error,
                color: ColorManager.errorColor,
              ),
          fit: fit);

  Widget toEelevatedButton(
    BuildContext context,
    Function()? onPressed, {
    double height = AppSize.appSize45,
    double width = AppSize.appSize100,
    Color color = ColorManager.primaryColor,
    FontWeight? fontWeight = FontWeight.normal,
    double? fontSize = AppSize.appSize16,
    Color? colortext = ColorManager.blackColor,
    String? fontFamily = 'Tajawal',
    TextAlign? textAlign = TextAlign.start,
    bool? softWrap = true,
    TextOverflow overflow = TextOverflow.clip,
    int? maxLines,
    Locale locale = const Locale('ar', 'SA'),
    StrutStyle? strutStyle,
    TextWidthBasis? textWidthBasis = TextWidthBasis.parent,
  }) =>
      ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(AppSize.appSize4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.appSize4),
          ),
        ),
        child: toText(
          context,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: colortext,
          overflow: overflow,
          textAlign: textAlign,
          softWrap: softWrap,
          maxLines: maxLines,
          locale: locale,
          strutStyle: strutStyle,
          textWidthBasis: textWidthBasis,
        ),
      ).toSizedBox(
        width: width,
        height: height,
      );

  Widget toSvgAssetImage(
          {double height = AppSize.appSize200,
          BoxFit fit = BoxFit.contain,
          Alignment alignment = Alignment.center,
          double width = AppSize.appSize200}) =>
      SvgPicture.asset(
        this ?? AppConstants.defaultEmptyString,
        height: height,
        width: width,
        alignment: alignment,
        fit: fit,
      );

  Text toText(BuildContext context,
          {FontWeight? fontWeight = FontWeight.normal,
          double? fontSize = AppSize.appSize16,
          Color? color = ColorManager.blackColor,
          String? fontFamily = 'Tajawal',
          TextAlign? textAlign = TextAlign.start,
          bool? softWrap = true,
          TextOverflow overflow = TextOverflow.clip,
          int? maxLines,
          Locale locale = const Locale('ar', 'SA'),
          StrutStyle? strutStyle,
          TextWidthBasis? textWidthBasis = TextWidthBasis.parent,
          TextHeightBehavior? textHeightBehavior}) =>
      Text(
        trans(context, this ?? AppConstants.defaultEmptyString),
        style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
            overflow: overflow),
        textAlign: textAlign,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
        locale: locale,
        strutStyle: strutStyle,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
      );

  String get toUrlImage => '${instance<EnvMetaData>().baseUrl}/${this ?? ''}';

  String get toBearerTokenStyle => 'Bearer $this';

  String orEmptyString(
          {String defaultValue = AppConstants.defaultEmptyString}) =>
      (this == null) ? defaultValue : this ?? defaultValue;

  double convertToDouble(
          {double defaultValue = AppConstants.defaultEmptyDouble}) =>
      (this == null) ? defaultValue : double.tryParse(this!) ?? defaultValue;
  int convertToInteger({int defaultValue = AppConstants.defaultEmptyInteger}) =>
      (this == null) ? defaultValue : int.tryParse(this!) ?? defaultValue;

  Locale toLocale() {
    switch (this) {
      case AppConstants.englishLanguageCode:
        return AppConstants.englishLocal;
      case AppConstants.arabicLanguageCode:
        return AppConstants.arabicLocal;
      default:
        return AppConstants.defaultLocal;
    }
  }

  ThemeMode toThemeMode() {
    switch (this) {
      case AppConstants.lightTheme:
        return ThemeMode.light;
      case AppConstants.darkTheme:
        return ThemeMode.dark;
      case AppConstants.systemTheme:
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  AppAuthenticationLevel toAppAuthenticationLevel() {
    switch (this) {
      case 'authenticated':
        return AppAuthenticationLevel.authenticated;
      case 'unAuthenticated':
        return AppAuthenticationLevel.unAuthenticated;
      case 'blocked':
        return AppAuthenticationLevel.blocked;
      case 'draft':
      default:
        return AppAuthenticationLevel.draft;
    }
  }
}

extension NonNullInteger on int? {
  int orZeroInteger({int defaultValue = AppConstants.defaultEmptyInteger}) =>
      (this == null) ? defaultValue : this ?? defaultValue;

 bool operationSucceeded() => this! >= 200 && this! < 300;

 bool operationFailed() =>( this! > 300 || this! < 200);     
}

extension NonNullMap on Map? {
  Map orEmptyMap({Map defaultValue = AppConstants.defaultEmptyMap}) =>
      (this == null) ? defaultValue : this ?? defaultValue;
}

extension NonNullList<T> on List? {
  List orEmptyList(
          {List defaultValue = AppConstants.defaultEmptyGenericList}) =>
      (this == null) ? defaultValue : this ?? defaultValue;
}

extension NonNullDouble on double? {
  double orZeroDouble(
          {double defaultValue = AppConstants.defaultEmptyDouble}) =>
      (this == null) ? defaultValue : this ?? defaultValue;

  double doubleTwoDigit(
          {double defaultValue =
              AppConstants.defaultEmptyDoubleWithTwoDigit}) =>
      (this == null)
          ? defaultValue
          : double.parse(this!.toStringAsFixed(AppValue.appValue2));
}

extension NonNullBool on bool? {
  bool orBoolDefaultFalseValue(
          {bool defaultValue = AppConstants.defaultEmptyBoolFalse}) =>
      (this == null) ? defaultValue : this ?? defaultValue;

  bool orBoolDefaultTrueValue(
          {bool defaultValue = AppConstants.defaultEmptyBoolTrue}) =>
      (this == null) ? defaultValue : this ?? defaultValue;
}

extension NonNullBoolData on Future<bool> {
  Future<SuccessOperation> isOperationSucceeded() async =>
      SuccessOperation(await this);
}

extension SizedBoxValuesHeightOrWidth on num {
  SizedBox get heightSizedBox => SizedBox(height: toDouble());

  SizedBox get widthSizedBox => SizedBox(width: toDouble());

  String toDoubleNumber(int digit) => toStringAsFixed(digit);

  int get toIntegerNumber => toInt();

  // 6.1 => 7 

  int get toIntegerNumberCeil => ceil();

  double get toDoubleNumberCeil => ceilToDouble();
  

}

