
import '../export/export.dart';


class ExceptionHandling {
  ExceptionHandling.handleError(final dynamic error, {dynamic data = ''}) {
    final type = error.runtimeType;

    if (type == DioException) {
      failure = NetworkException.handleNetworkError(error, data: data).failure;
      logger.logData('DioException : $error /n failure : ${failure.message}',
          level: LogLevel.success);
    } else if (type == SocketException) {
      failure = DataSourceNetworkError.internalServerError.getFailure();
      logger.logData('SocketException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == FormatException) {
      failure = DataSourceNetworkError.formatException.getFailure();
      logger.logData('FormatException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == UrlLauncherException) {
      failure = UrlLauncherException.handleUrlLancherError(error).failure;
      logger.logData(
          'UrlLauncherException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == PermissionException) {
      failure = PermissionException.handlePermissionError(error).failure;
      logger.logData(
          'PermissionException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else if (type == Map<String, dynamic>) {
      failure = ApiException.handleApiError(error).failure;
      logger.logData(
          'PermissionException : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    } else {
      failure = DataSourceNetworkError.unknownError.getFailure();
      logger.logData('default : $error /n failure : ${failure.message}',
          level: LogLevel.debug);
    }
  }

  late Failure failure;
}
