import 'package:flutter/material.dart';

import '../../../../../core/export/export.dart';

part 'settings_app_state.dart';

class SettingsAppCubit extends Cubit<SettingsAppState> {
  final GetSettingsApp _getSettingsApp;
  final CashSettingApp _cashSettingApp;
  final Logout _logout;
  final ThemeManager _themeManager;

  SettingsAppCubit({
    required GetSettingsApp getSettingsApp,
    required CashSettingApp cashSettingApp,
    required Logout logout,
    required ThemeManager themeManager,
  })  : _getSettingsApp = getSettingsApp,
        _cashSettingApp = cashSettingApp,
        _logout = logout,
        _themeManager = themeManager,
        super(const SettingsAppState());

  Future<void> getSettingsApp() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _getSettingsApp(noParam);
    await delayForCreateNewStatus(second: 1);
    result.fold(
        (failure) => emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure)),
        (data) {
      emit(state.copyWith(
          flowStateApp: FlowStateApp.success, settingsApp: data));
    });
  }

  Future<void> cashSettingsApp(SettingsApp settingsApp) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _cashSettingApp(settingsApp);
    await delayForCreateNewStatus();
    result.fold(
        (failure) => emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure)),
        (data) {
      _changeTheme(settingsApp.themeSettings.themeMode);
      emit(state.copyWith(
          flowStateApp: FlowStateApp.normal, settingsApp: settingsApp));
    });
  }

  Future<void> changeAuthSettingsApp(
      AppAuthenticationLevel appAuthenticationLevel) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final settings = state.settingsApp.copyWith(
        authenticationSettings: state.settingsApp.authenticationSettings
            .copyWith(appAuthenticationLevel: appAuthenticationLevel));

    cashSettingsApp(settings);
  }

  Future<void> logout() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _logout(state.settingsApp);
    await delayForCreateNewStatus();
    result.fold(
        (failure) => emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure)),
        (data) => emit(state.copyWith(
            flowStateApp: FlowStateApp.success,
            settingsApp: state.settingsApp.copyWith(
                authenticationSettings: state.settingsApp.authenticationSettings
                    .copyWith(
                        appAuthenticationLevel:
                            AppAuthenticationLevel.unAuthenticated)))));
  }

  void changeUserData(UserData userData) {
    emit(state.copyWith(
        settingsApp: state.settingsApp.copyWith(
            authenticationSettings: state.settingsApp.authenticationSettings
                .copyWith(user: userData))));
  }

  Future<void> activeUser() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));

    final settingsApp = state.settingsApp.copyWith(
        authenticationSettings: state.settingsApp.authenticationSettings
            .copyWith(
                user: state.settingsApp.authenticationSettings.user.copyWith(
                    userInfo: state
                        .settingsApp.authenticationSettings.user.userInfo
                        .copyWith(
                            status: const Status(id: 1, name: 'Active')))));
    cashSettingsApp(settingsApp);
  }

  void changeSettings(SettingsApp newSetting, SettingsApp oldSetting) {
    if (newSetting.themeSettings.themeMode !=
        oldSetting.themeSettings.themeMode) {
      _changeTheme(newSetting.themeSettings.themeMode);
    }
  }

  ThemeManager get getThemes => _themeManager;

  void _changeTheme(ThemeMode themeMode) {
    _themeManager.changeStatusBarAndNavigationBarColors(themeMode);
  }

  void changeThemeMode(ThemeMode themeMode) {
    final settingsApp = state.settingsApp.copyWith(
        themeSettings: state.settingsApp.themeSettings
            .copyWith(themeMode: themeMode));
    cashSettingsApp(settingsApp);
  }

  void changeLanguage(Locale locale) {
    final settingsApp = state.settingsApp.copyWith(
        languageSettings:
            state.settingsApp.languageSettings.copyWith(locale: locale));
    cashSettingsApp(settingsApp);

  }

  
}
