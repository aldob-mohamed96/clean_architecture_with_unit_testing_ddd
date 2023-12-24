import '../../../../core/export/export.dart';

abstract interface class IDioFactory {
  Future<Dio> getDio();
}

class DioFactoryImpl implements IDioFactory {

  final LocalStroagePreferances _appPreferences;
  final NetWorkEnvMetaData _netWorkEnvMetaData;

  DioFactoryImpl({
    required LocalStroagePreferances appPreferences,
    required NetWorkEnvMetaData netWorkEnvMetaData,
  })  : _appPreferences = appPreferences,
        _netWorkEnvMetaData = netWorkEnvMetaData;
  @override
  Future<Dio> getDio() async {
    final dio = Dio();

    dio.interceptors.add(DioIntercepter(
        appPreferences: _appPreferences,
        dio: dio));

    return dio;
  }

   
}

