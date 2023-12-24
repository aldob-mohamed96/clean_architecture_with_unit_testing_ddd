import '../export/export.dart';

class UrlLauncherException implements Exception {
  UrlLauncherException.handleUrlLancherError(final dynamic error) {
    if (error is DataSourceLaunchUrl) {
      failure = _handleLaunchUrlError(error);
    } else if (error is FormatException) {
      failure = DataSourceLaunchUrl.inValidUrl.getFailure();
    } else {
      failure = DataSourceLaunchUrl.unKnownLauncherError.getFailure();
    }
  }
  late Failure failure;

  Failure _handleLaunchUrlError(final DataSourceLaunchUrl dataSourceLaunchUrl) {
    switch (dataSourceLaunchUrl) {
      case DataSourceLaunchUrl.cantNotOpen:
        return DataSourceLaunchUrl.cantNotOpen.getFailure();
      case DataSourceLaunchUrl.inValidUrl:
        return DataSourceLaunchUrl.inValidUrl.getFailure();
      case DataSourceLaunchUrl.systemError:
        return DataSourceLaunchUrl.systemError.getFailure();
      default:
        return DataSourceLaunchUrl.unKnownLauncherError.getFailure();
    }
  }
}
