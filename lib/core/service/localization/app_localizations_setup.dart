import 'package:flutter/material.dart';

import '../../export/export.dart';

class AppLocalizationsSetup {
  static const Iterable<Locale> supportedLocales =
      AppConstants.supportedLocales;
  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    AppLocalizationsImpl.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate
  ];
  static Locale localeResolutionCallBack(
      Locale? locale, Iterable<Locale>? supportedLocales) {
    for (Locale supportedLocale in supportedLocales!) {
      if (supportedLocale.languageCode == locale!.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}
