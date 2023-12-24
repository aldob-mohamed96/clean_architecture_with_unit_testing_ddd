
import '../../export/export.dart';

part 'env.g.dart';

/// Here the env data comes from the root project's .env file
/// So, I need to declare the path as '.env'
/// Don't forget to generate 'env.g.dart' file

@Envied(path: '.env')
abstract class Env {
  @EnviedField(
      varName: 'BASE_URL',
      obfuscate: true,
      defaultValue: AppConstants.defaultEmptyString)
  static final String baseUrl = _Env.baseUrl;

  @EnviedField(
      varName: 'BASE_URL_DEBUG',
      obfuscate: true,
      defaultValue: AppConstants.defaultEmptyString)
  static final String baseUrlDebug = _Env.baseUrlDebug;
  @EnviedField(
      varName: 'SEND_TIMEOUT',
      obfuscate: true,
      defaultValue: AppConstants.defaultEmptyInteger)
  static final int sendTimeOut = _Env.sendTimeOut;

  @EnviedField(
      varName: 'RECEIVE_TIMEOUT',
      obfuscate: true,
      defaultValue: AppConstants.defaultEmptyInteger)
  static final int receiveTimeOut = _Env.receiveTimeOut;

  @EnviedField(
      varName: 'SETTINGS_APP_KEY',
      obfuscate: true,
      defaultValue: AppConstants.defaultEmptyString)
  static final String settingsAppKey = _Env.settingsAppKey;

  @EnviedField(
      varName: 'APP_CASHED_AUTHENTICATION_RESPONSE_TIME_INTERVAL',
      obfuscate: true,
      defaultValue: AppConstants.defaultEmptyInteger)
  static final String appCashedAuthenticationResponseTimeInterval =
      _Env.appCashedAuthenticationResponseTimeInterval;

  @EnviedField(
      varName: 'DEFAULT_LANG',
      obfuscate: true,
      defaultValue: AppConstants.defaultLanguageAppCode)
  static final String defaultLanguageApi = _Env.defaultLanguageApi;
}
