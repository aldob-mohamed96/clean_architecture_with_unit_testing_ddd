import '../../../../core/export/export.dart';
import '../../../domain/usecases/auth/refresh_token_use_case.dart';

class DioIntercepter extends Interceptor {
  final LocalStroagePreferances _appPreferences;
  final Dio _dio;
  SettingsApp _settings = const SettingsApp();
  String _token = '';

  DioIntercepter(
      {required LocalStroagePreferances appPreferences,
      
      required Dio dio})
      : _appPreferences = appPreferences,
        _dio = dio
          {
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
  }

  @override
  void onRequest(
          RequestOptions options, RequestInterceptorHandler handler) async =>
      _handleRequest(options, handler);
  @override
  void onResponse(Response<dynamic> response,
          ResponseInterceptorHandler handler) async =>
      handler.next(response);
  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async =>
      _handleError(err, handler);

  Future<String> _getRefreshToken(String refeshtoken) async {
    GetRefershTokenUseCase getRefershTokenUseCase = await refreshTokenModule();
    final response =
        await getRefershTokenUseCase(RefershTokenRequest(refeshtoken));

    return response.fold(
      (l) {
        return '';
      },
      (data) {
        _appPreferences.cashAppSttings(
            instance<SettingsAppCubit>().state.settingsApp.copyWith(
                  authenticationSettings: instance<SettingsAppCubit>()
                      .state
                      .settingsApp
                      .authenticationSettings
                      .copyWith(
                        user: instance<SettingsAppCubit>()
                            .state
                            .settingsApp
                            .authenticationSettings
                            .user
                            .copyWith(
                              token: data.token,
                              refreshToken: data.refreshToken,
                              tokenExpires: data.tokenExpires,
                            ),
                      ),
                ));

        return data.token;
      },
    );
  }

  bool _checkUrlDidnotNeedAuthentication(String url) {
    for (var element in AppConstants.urlwithoutAuthentication) {
      if (url.contains(element)) {
        return true;
      }
    }

    return false;
  }

  bool _checkForCallRefreshToken(DioException error) {
    if (error.response!.statusCode == 401 &&
        _settings.authenticationSettings.user.refreshToken.isNotEmpty &&
        _settings.authenticationSettings.user.token.isNotEmpty &&
        DateTime.fromMillisecondsSinceEpoch(
                _settings.authenticationSettings.user.tokenExpires)
            .isBefore(DateTime.now())) {
      return true;
    }
    return false;
  }

  void _handleError(DioException error, ErrorInterceptorHandler handler) async {
    if (_checkForCallRefreshToken(error)) {
      final newToken = await _getRefreshToken(
          _settings.authenticationSettings.user.refreshToken);
      final newAccessToken = newToken.toBearerTokenStyle;
      error.requestOptions.headers['Authorization'] = newAccessToken;
      return handler.resolve(await _dio.fetch(error.requestOptions));
    }
    return handler.next(error);
  }

  void _handleRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (_checkUrlDidnotNeedAuthentication(options.path)) {
      options.headers.remove('Authorization');
    } else {
      if (_token.isEmpty) {
        SettingsApp newsSettings = await _appPreferences.getAppSettings();
        _settings = newsSettings;
        _token = _settings.authenticationSettings.user.token;
      }

      options.headers['Authorization'] = _token.toBearerTokenStyle;
    }

    return handler.next(options);
  }
}
