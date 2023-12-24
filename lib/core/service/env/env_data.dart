

import '../../export/export.dart';


abstract interface class EnvMetaData {
  Future<NetWorkEnvMetaData> getNetworkMetaData();
  String get baseUrl;
}

class EnvMetaDataImpl implements EnvMetaData {
  @override
  String get baseUrl => Env.baseUrl.toString();
  @override
  Future<NetWorkEnvMetaData> getNetworkMetaData() {
    return Future.value(NetWorkEnvMetaData(
      baseUrls: Env.baseUrl.toString(),
      baseUrlsDebug: Env.baseUrlDebug.toString(),
      settingsAppKey: Env.settingsAppKey.toString(),
      appCashedAuthenticationResponseTimeInterval: Env
          .appCashedAuthenticationResponseTimeInterval
          .toString()
          .convertToInteger(),
      defaultLanguageApi: Env.defaultLanguageApi.toString(),
      receiveTimeout: Env.receiveTimeOut.toString().convertToInteger(),
      sendTimeout: Env.sendTimeOut.toString().convertToInteger(),

      // loca
    ));
  }
}
