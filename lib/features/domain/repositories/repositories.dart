import '../../../core/export/export.dart';


abstract interface class IRepository {
  //----------------------base function----------------------
  Future<Either<Failure, T>> getRemoteBaseFunction<T>(
      Future<Either<Failure, T>> Function() function);

  Future<Either<Failure, T>> getLocalBaseFunction<T>(
      Future<Either<Failure, T>> Function() function);
  //----------------------local data source----------------------
  Future<Either<Failure, SuccessOperation>> cashAppSttings(
      SettingsApp settingsApp);
  Future<Either<Failure, SettingsApp>> getAppSettings();

  //----------------------end local data source----------------------

  //----------------------remote data source----------------------

  //auth
  Future<Either<Failure, UserData>> login(LoginRequest loginRequest);

  Future<Either<Failure, SuccessOperation>> register(
      RegisterRequest registerRequest);

  Future<Either<Failure, SuccessOperation>> forgetPassword(
      ForgetPasswordRequest resetPasswordRequest);

  Future<Either<Failure, SuccessOperation>> changePassword(
      ChangePasswordCodeRequest resetPasswordCodeRequest);

  Future<Either<Failure, SuccessOperation>> confirmEmail(
      ConfirmEmailRequest confirmEmailRequest);

  Future<Either<Failure, SuccessOperation>> sendDeviceToken();

  Future<Either<Failure, TokenData>> refreshToken(RefershTokenRequest token);

  Future<Either<Failure, SuccessOperation>> logout(SettingsApp setting);

  // //notification
  Future<Either<Failure, NotificationData>> getNotifications(
      PaginationRequest paginationRequest);
}
