import 'package:flutter/material.dart';

import '../../export/export.dart';

abstract class AppLocalizations {
  Future<void> load();
  String translate(String key);
  String get getCurrentLocale;
}

class AppLocalizationsImpl implements AppLocalizations {
  final LoadFileAsset _loadFileAsset = LoadFileAssetImpl();
  final Locale locale;
  late Map<String, String> _localizedStrings;
  AppLocalizationsImpl(this.locale);

  static AppLocalizationsImpl of(BuildContext context) =>
      Localizations.of<AppLocalizationsImpl>(context, AppLocalizations) ??
      AppLocalizationsImpl(AppConstants.defaultLocal);
  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();
  String get jsonFileContent =>
      '${AppConstants.assetTranslationsJson}${locale.languageCode}.json';

  @override
  Future<void> load() async {
    final result = await _loadFileAsset.loadJsonFileFromAsset(jsonFileContent);
    result.fold((l) => l, (r) => _localizedStrings = r);
  }

  @override
  String translate(String key) => _localizedStrings[key] ?? key;

  @override
  String get getCurrentLocale => locale.languageCode;
}
