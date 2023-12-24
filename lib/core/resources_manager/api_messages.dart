import '../export/export.dart';

final class ResponseMessage {
  ResponseMessage._();
  //http response message
  static const String success = AppStrings.success;
  static const String noContent = AppStrings.noContent;
  static const String badContent = AppStrings.badContent;
  static const String unAuthorised = AppStrings.unAuthorised;
  static const String forbidden = AppStrings.forbidden;
  static const String internalServerError = AppStrings.internalServerError;
  static const String notFound = AppStrings.notFound;
  static const String connectTimeOut = AppStrings.connectTimeOut;
  static const String cancel = AppStrings.cancel;
  static const String receiveTimeOut = AppStrings.receiveTimeOut;
  static const String sendTimeOut = AppStrings.sendTimeOut;
  static const String cashError = AppStrings.cashError;
  static const String noInternetConnection = AppStrings.noInternetConnection;
  static const String unknownError = AppStrings.unknownError;

  //location response
  static const String locationPermissionDined =
      AppStrings.locationPermissionDined;
  static const String locationUnAvailable = AppStrings.locationUnAvailable;
  static const String locationServiceDisabled =
      AppStrings.locationServiceDisabled;
  static const String locationDetectedTimeOut =
      AppStrings.locationDetectedTimeOut;
  static const String locationUpdateError = AppStrings.locationUpdateError;
  static const String locationAlreadySubscribed =
      AppStrings.locationAlreadySubscribed;
  static const String locationActivityMissing =
      AppStrings.locationActivityMissing;

  //Permission message error
  static const String permissionDined = AppStrings.permissionDined;
  static const String permissionCheckError = AppStrings.permissionCheckError;
  static const String unknownPermissionError =
      AppStrings.unknownPermissionError;
  static const String permissionPermanentlyDenied =
      AppStrings.permissionPermanentlyDenied;
  static const String permissionRestricted = AppStrings.permissionRestricted;
  static const String noImageSelected = AppStrings.noImageSelected;

  //launch Url messages
  static const String cantNotOpen = AppStrings.cantNotOpen;
  static const String inValidUrl = AppStrings.inValidUrl;
  static const String systemError = AppStrings.systemError;
  static const String unKnownLauncherError = AppStrings.unKnownLauncherError;

  //Battery state
  static const String batteryInfoError = AppStrings.batteryInfoError;

  // local Notification
  static const String onInitError = AppStrings.onInitError;
  static const String onGetSettingIosOrAndroidError =
      AppStrings.onGetSettingIosOrAndroidError;
  static const String onCancelAllError = AppStrings.onCancelAllError;
  static const String onCancelOneError = AppStrings.onCancelOneError;
  static const String onShowError = AppStrings.onShowError;
  static const String onSelectNotificationError =
      AppStrings.onSelectNotificationError;
  static const String onDidReceiveNotificationError =
      AppStrings.onDidReceiveNotificationError;
  static const String onGetDetailsNotificationError =
      AppStrings.onGetDetailsNotificationError;

  //timer
  //Timer State
  static const String timerIsActive = AppStrings.timerIsActive;
  static const String timerIsInActive = AppStrings.timerIsInActive;
  static const String timerCancelError = AppStrings.timerCancelError;
  static const String timerError = AppStrings.timerError;
}
