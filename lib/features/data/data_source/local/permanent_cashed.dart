import 'package:functional/core/export/export.dart';



abstract interface class LocalDataSource {
  //setting app local data
  Future<SuccessOperation> cashAppSttings(SettingsApp settingsApp);
  Future<SuccessOperation> cashUserAppSttings(UserData userData);

  Future<SettingsApp> getAppSettings();
  Future<SuccessOperation> logout(SettingsApp setting);
}

class LocalDataSourceImpl implements LocalDataSource {
  final LocalStroagePreferances _appPreferences;
  LocalDataSourceImpl({required LocalStroagePreferances appPreferences})
      : _appPreferences = appPreferences;

  @override
  Future<SuccessOperation> cashAppSttings(SettingsApp settingsApp) async {
    return await _appPreferences.cashAppSttings(settingsApp);
  }

  @override
  Future<SettingsApp> getAppSettings() async {
    return await _appPreferences.getAppSettings();
  }

  @override
  Future<SuccessOperation> logout(SettingsApp setting) async {
    return await _appPreferences.logout(setting);
  }

  @override
  Future<SuccessOperation> cashUserAppSttings(UserData userData) async {
    return await _appPreferences.cashUserDataSttings(userData);
  }
}
