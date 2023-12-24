import '../export/export.dart';


class PermissionException implements Exception {
  PermissionException.handlePermissionError(final dynamic error) {
    if (error is DataSourcePermission) {
      failure = _handlePermissionError(error);
    } else {
      failure = DataSourcePermission.unknownPermissionError.getFailure();
    }
  }
  late Failure failure;

  Failure _handlePermissionError(
      final DataSourcePermission dataSourcePermissionError) {
    switch (dataSourcePermissionError) {
      case DataSourcePermission.permissionDenied:
        return DataSourcePermission.permissionDenied.getFailure();
      case DataSourcePermission.permissionPermanentlyDenied:
        return DataSourcePermission.permissionPermanentlyDenied.getFailure();
      case DataSourcePermission.permissionRestricted:
        return DataSourcePermission.permissionRestricted.getFailure();
      case DataSourcePermission.checkPermissionError:
        return DataSourcePermission.checkPermissionError.getFailure();
      case DataSourcePermission.noImageSelected:
        return DataSourcePermission.noImageSelected.getFailure();
      default:
        return DataSourcePermission.unknownPermissionError.getFailure();
    }
  }
}

class ApiException implements Exception {
  ApiException.handleApiError(final dynamic error) {
    if (error is Map<String, dynamic>) {


      
      if(error['errors'] !=null)
      {

            if (error['errors'].values != null) 
            {
            failure =  Failure(message: error['errors'].values.first, code: 10203040);
            } 
      }
      else if (error['message'] != null)
      {
        failure = Failure(message: error['message'], code: 10203040);
      } 
      else if (error['error'] != null)
      {
        failure = Failure(message: error['error'], code: 10203040);
      } 
      else
      {
        failure = DataSourceNetworkError.unknownError.getFailure();
      }
    } else {
      failure = DataSourceNetworkError.unknownError.getFailure();
    }
  }
  late Failure failure;
}
