import 'package:flutter/material.dart' show Locale, LocalizationsDelegate;



import '../../export/export.dart';


class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        AppConstants.englishLanguageCode,
        AppConstants.arabicLanguageCode,
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizationsImpl(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
