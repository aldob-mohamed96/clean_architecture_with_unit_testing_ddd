enum AppAuthenticationLevel {
  draft,
  initial,
  unAuthenticated,
  authenticated,
  blocked,
}

enum StateItem {
  darft,
  deleted,
  loadingDelete,
  saved,
  loadingSaved,
}

enum ResetPasswordStateLevel {
  darft,
  enterCode,
  enterNewPassword,
  loading,
  success,
  error,
  successSendCode,
  successEnterdCode,
  successCreateNewPassword,
}

enum FlowStateApp {
  draft,
  loading,
  userBlocked,
  loadingMore,
  loadingUpdate,
  loadingDelete,
  loadingInsert,
  normal,
  error,
  success,
  successLoggedIn,
  successLoggedOut,
  successRegisted,
  successInserting,
  successDeleting,
  successUpdate,
  hint,
  missingData,
  unAuthenticated,
  updateApp,
  noConnection,
  weakConnection,
  connectionRestored,
  connectionError,
  connectionTimeOut,
  connectionCanceled,
  connectionUnknownError,
  connectionBadContent,
  newNotification,
  offerCreated,
  notInserted,
  notDeleted,
  notUpdated,
  emailSendSuccfully,
  showNotification,
  emailConfirmedSuccessfully,
  successSendCode,
  successEnterdCode,
  loadingDetails,
  errorShowDetails,
  showDetailsSuccess,
}

enum DataSourceValidationInput {
  empty,
  usernameStyle,
  shortPassword,
  notIdenticalPassword,
  weakPassword,
  veryLong,
  length,
  maxInputCount,
  notPhoneStyle,
  notEmail,
  notInteger,
  notDouble,
  notBool,
  notString,
  containSpecialChar,
  unknown,
  inValidImg,
  inValidFormat,
}

enum DataSourcePermission {
  checkPermissionError,
  permissionDenied,
  permissionPermanentlyDenied,
  permissionRestricted,
  unknownPermissionError,
  noImageSelected,
  imageSelected
}

enum DataSourceNetworkError {
  noContent,
  badContent,
  forbidden,
  unAuthorized,
  notFound,
  internalServerError,
  socketError,
  formatException,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cashError,
  noInternetConnection,
  unknownError,
}

enum DataSourceLaunchUrl {
  success,
  cantNotOpen,
  inValidUrl,
  systemError,
  unKnownLauncherError,
}

enum LanguageCode {
  ar,
  en,
}

enum DataSourceLocalNotification {
  show,
  onInitError,
  onGetSettingIosOrAndroidError,
  onCancelAllError,
  onCancelOneError,
  onShowError,
  onSelectNotificationError,
  onDidReceiveNotificationError,
  onGetDetailsNotificationError
}

enum LogLevel { debug, info, warning, error, trace, success }
