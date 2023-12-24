final class ApiInternalStatusCode {
  ApiInternalStatusCode._();
  static const int failure = 0;
  static const int success = 1;
}

final class ResponseCode {
  ResponseCode._();
  //http response code
  static const int success = 200;
  static const int noContent = 201;
  static const int createdSuccessfully = 204;
  static const int badContent = 400;
  static const int unAuthorised = 401;
  static const int forbidden = 403;
  static const int internalServerError = 200;
  static const int notFound = 404;

  //local error code http not executed
  static const int connectTimeOut = -1000;
  static const int cancel = -1002;
  static const int recieveTimeOut = -1003;
  static const int sendTimeOut = -1004;
  static const int cashError = -1005;
  static const int noInternetConnection = -1006;
  static const int unknownError = -1007;

  //location error
  static const int locationPermissionDined = 2000;
  static const int locationUnAvailable = 2001;
  static const int locationDetectedTimeOut = 2002;
  static const int locationServiceDisabled = 2003;
  static const int locationUpdateError = 2004;
  static const int locationAlreadySubscribed = 2005;
  static const int locationActivityMissing = 2006;

  //permission error handling
  static const int permissionDined = 3001;
  static const int permissionCheckError = 3002;
  static const int unknownPermissionError = 3003;
  static const int noImageSelected = 3004;
  static const int permissionPermanentlyDenied = 3005;
  static const int permissionRestricted = 3006;

  //launch Url
  static const int cantNotOpen = 3100;
  static const int inValidUrl = 3101;
  static const int systemError = 3102;
  static const int unKnownLauncherError = 3103;

  //Battery state
  static const int batteryInfoError = 3200;

  //Timer State
  static const int timerIsActive = 4000;
  static const int timerIsInActive = 4001;
  static const int timerCancelError = 4002;
  static const int timerError = 4003;

  //local notification error
  static const int onInitError = 5000;
  static const int onGetSettingIosOrAndroidError = 5001;
  static const int onCancelAllError = 5002;
  static const int onCancelOneError = 5003;
  static const int onShowError = 5004;
  static const int onSelectNotificationError = 5005;
  static const int onDidReceiveNotificationError = 5006;
  static const int onGetDetailsNotificationError = 5007;
}
