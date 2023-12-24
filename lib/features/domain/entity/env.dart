 
import '../../../core/export/export.dart';

class NetWorkEnvMetaData extends Equatable {
  final String baseUrlsDebug;
  final String baseUrls;
  final String settingsAppKey;
  final int appCashedAuthenticationResponseTimeInterval;
  final String defaultLanguageApi;
  final int receiveTimeout;
  final int sendTimeout;
  final String projectId;

  const NetWorkEnvMetaData({
    this.baseUrlsDebug = AppConstants.defaultEmptyString,
    this.baseUrls = AppConstants.defaultEmptyString,
    this.settingsAppKey = AppConstants.defaultEmptyString,
    this.appCashedAuthenticationResponseTimeInterval =
        AppConstants.defaultEmptyInteger,
    this.defaultLanguageApi = AppConstants.defaultEmptyString,
    this.receiveTimeout = AppConstants.defaultEmptyInteger,
    this.sendTimeout = AppConstants.defaultEmptyInteger,
    this.projectId = AppConstants.defaultEmptyString,
  });

  NetWorkEnvMetaData copyWith({
    String? baseUrlsDebug,
    String? baseUrls,
    String? settingsAppKey,
    int? appCashedAuthenticationResponseTimeInterval,
    String? defaultLanguageApi,
    int? receiveTimeout,
    int? sendTimeout,

    String? projectId,
  }) =>
      NetWorkEnvMetaData(
        baseUrlsDebug: baseUrlsDebug ?? this.baseUrlsDebug,
        baseUrls: baseUrls ?? this.baseUrls,
        settingsAppKey: settingsAppKey ?? this.settingsAppKey,
        appCashedAuthenticationResponseTimeInterval:
            appCashedAuthenticationResponseTimeInterval ??
                this.appCashedAuthenticationResponseTimeInterval,
        defaultLanguageApi: defaultLanguageApi ?? this.defaultLanguageApi,
        receiveTimeout: receiveTimeout ?? this.receiveTimeout,
        sendTimeout: sendTimeout ?? this.sendTimeout,
        projectId: projectId ?? this.projectId,
      );

  @override
  List<Object?> get props => [
        baseUrlsDebug,
        baseUrls,
        settingsAppKey,
        appCashedAuthenticationResponseTimeInterval,
        defaultLanguageApi,
        receiveTimeout,
        sendTimeout,
        projectId,
      ];
}
