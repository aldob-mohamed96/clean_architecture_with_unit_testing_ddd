import '../export/export.dart';


class NetworkException implements Exception {
  NetworkException.handleNetworkError(final dynamic error,
      {dynamic data = ''}) {
    if (error is DioException) {
      failure = _handleNetworkDioFailure(error, data);
    } else {
      failure = DataSourcePermission.unknownPermissionError.getFailure();
    }
  }
  late Failure failure;

  Failure _handleNetworkDioFailure(final DioException error, dynamic data) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSourceNetworkError.connectTimeOut.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSourceNetworkError.sendTimeOut.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSourceNetworkError.receiveTimeOut.getFailure();
      case DioExceptionType.connectionError:
        return DataSourceNetworkError.connectTimeOut.getFailure();
      case DioExceptionType.badResponse:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return Failure(
              code: error.response?.statusCode ??
                  AppConstants.defaultEmptyInteger,
              message: error.response?.statusMessage ??
                  AppConstants.defaultEmptyString);
        } else {
          return DataSourceNetworkError.unknownError.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSourceNetworkError.cancel.getFailure();
      case DioExceptionType.badCertificate:
        return DataSourceNetworkError.unAuthorized.getFailure();

      default:
        return DataSourceNetworkError.unknownError.getFailure();
    }
  }
}
