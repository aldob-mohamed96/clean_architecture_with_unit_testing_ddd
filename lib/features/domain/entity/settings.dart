import 'package:flutter/material.dart';

import '../../../core/export/export.dart';


final class SettingsApp extends Equatable {
  final AuthenticationSettings authenticationSettings;
  final ThemeSettings themeSettings;
  final LanguageSettings languageSettings;

  const SettingsApp({
    this.authenticationSettings = const AuthenticationSettings(),
    this.themeSettings = const ThemeSettings(),
    this.languageSettings = const LanguageSettings(),
  });

  SettingsApp copyWith({
    AuthenticationSettings? authenticationSettings,
    ThemeSettings? themeSettings,
    LanguageSettings? languageSettings,
  }) {
    return SettingsApp(
      authenticationSettings:
          authenticationSettings ?? this.authenticationSettings,
      themeSettings: themeSettings ?? this.themeSettings,
      languageSettings: languageSettings ?? this.languageSettings,
    );
  }

  factory SettingsApp.fromJson(Map<String, dynamic> json) {
    return SettingsApp(
        authenticationSettings: AuthenticationSettings.fromJson(
            json['authenticationSettings'] as Map<String, dynamic>),
        themeSettings: ThemeSettings.fromJson(
            json['themeSettings'] as Map<String, dynamic>),
        languageSettings: LanguageSettings.fromJson(
            json['languageSettings'] as Map<String, dynamic>));
  }

  Map<String, dynamic> toJson() {
    return {
      'authenticationSettings': authenticationSettings.toJson(),
      'themeSettings': themeSettings.toJson(),
      'languageSettings': languageSettings.toJson(),
    };
  }

  String get convertToStorageData => jsonEncode(toJson());

  SettingsApp convertFromStorageData(String data) =>
      SettingsApp.fromJson(jsonDecode(data));

  @override
  List<Object?> get props => [
        authenticationSettings,
        themeSettings,
        languageSettings,
      ];
}

final class AuthenticationSettings extends Equatable {
  final AppAuthenticationLevel appAuthenticationLevel;
  final bool isBiometricEnabled;
  final UserData user;

  const AuthenticationSettings({
    this.appAuthenticationLevel = AppAuthenticationLevel.initial,
    this.isBiometricEnabled = false,
    this.user = const UserData(),
  });

  AuthenticationSettings copyWith({
    AppAuthenticationLevel? appAuthenticationLevel,
    bool? isBiometricEnabled,
    UserData? user,
  }) {
    return AuthenticationSettings(
      appAuthenticationLevel:
          appAuthenticationLevel ?? this.appAuthenticationLevel,
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
      user: user ?? this.user,
    );
  }

  factory AuthenticationSettings.fromJson(Map<String, dynamic> json) {
    return AuthenticationSettings(
      appAuthenticationLevel:
          (json['appAuthenticationLevel'] as String).toAppAuthenticationLevel(),
      isBiometricEnabled: json['isBiometricEnabled'] as bool,
      user: UserData.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appAuthenticationLevel': appAuthenticationLevel.name,
      'isBiometricEnabled': isBiometricEnabled,
      'user': user.toJson(),
    };
  }

  @override
  List<Object?> get props => [appAuthenticationLevel, isBiometricEnabled, user];
}

final class ThemeSettings extends Equatable {
  final ThemeMode themeMode;

  const ThemeSettings({
    this.themeMode = AppConstants.defaultTheme,
  });

  bool get isDrakMode => themeMode == ThemeMode.dark;

  bool get isLightMode => themeMode == ThemeMode.light;

  ThemeSettings copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeSettings(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  factory ThemeSettings.fromJson(Map<String, dynamic> json) {
    return ThemeSettings(
      themeMode: (json['themeMode'] as String).toThemeMode(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode.name,
    };
  }

  @override
  List<Object?> get props => [themeMode];
}

final class LanguageSettings extends Equatable {
  final Locale locale;

  const LanguageSettings({
    this.locale = AppConstants.defaultLocal,
  });

  String get languageCode => locale.languageCode;

  String get countryCode =>
      locale.countryCode ?? AppConstants.defaultLocal.countryCode!;

  LanguageSettings copyWith({
    Locale? locale,
  }) {
    return LanguageSettings(
      locale: locale ?? this.locale,
    );
  }

  factory LanguageSettings.fromJson(Map<String, dynamic> json) {
    return LanguageSettings(
      locale: (json['locale'] as String).toLocale(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'locale': locale.languageCode,
    };
  }

  @override
  List<Object?> get props => [locale];
}
