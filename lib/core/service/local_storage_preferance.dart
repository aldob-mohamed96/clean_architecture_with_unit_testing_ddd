

import '../export/export.dart';

abstract interface class LocalStroagePreferances {
  //setting app local data
  Future<SuccessOperation> cashAppSttings(SettingsApp settingsApp);
  Future<SuccessOperation> cashUserDataSttings(UserData userData);

  Future<SettingsApp> getAppSettings();
  Future<SuccessOperation> logout(SettingsApp setting);
}

class LocalStroagePreferancesImpl implements LocalStroagePreferances {
  // ignore: unused_field
  final SharedPreferences _sharedPreferences;
  final FlutterSecureStorage _secureStorage;
  final NetWorkEnvMetaData _netWorkEnvMetaData;

  LocalStroagePreferancesImpl({
    required FlutterSecureStorage secureStorage,
    required SharedPreferences sharedPreferences,
    required NetWorkEnvMetaData netWorkEnvMetaData,
  })  : _sharedPreferences = sharedPreferences,
        _netWorkEnvMetaData = netWorkEnvMetaData,
        _secureStorage = secureStorage;
/*------------------- -------------------------------------------------   */
  @override
  Future<SuccessOperation> cashAppSttings(SettingsApp settingsApp) async {
    return await _secureStorage.cashSettings(
        settingsApp, _netWorkEnvMetaData.settingsAppKey);
  }

  @override
  Future<SettingsApp> getAppSettings() async {
    return await _secureStorage.getSettings(_netWorkEnvMetaData.settingsAppKey);
  }

  @override
  Future<SuccessOperation> logout(SettingsApp setting) async {
    return await _secureStorage.logout(
        setting, _netWorkEnvMetaData.settingsAppKey);
  }

  @override
  Future<SuccessOperation> cashUserDataSttings(UserData userData) async {
    final settings = await getAppSettings();

    final newSettings = settings.copyWith(
      authenticationSettings: settings.authenticationSettings.copyWith(
          user: userData,
          appAuthenticationLevel: AppAuthenticationLevel.authenticated),
    );
    final result = await cashAppSttings(newSettings);
    return result;
  }
}
