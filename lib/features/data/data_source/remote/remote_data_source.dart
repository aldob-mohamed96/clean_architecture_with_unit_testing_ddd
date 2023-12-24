

import '../../../../core/export/export.dart';


abstract interface class IRemoteDataSource {
  //auth
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  //send mail to reset password
  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordRequest resetPasswordRequest);
  //change password
  Future<ChangePasswordCodeResponse> changePassword(
      ChangePasswordCodeRequest resetPasswordCodeRequest);

  Future<ConfirmEmailResponse> confirmEmail(
      ConfirmEmailRequest confirmEmailRequest);
  Future<SendDeviceTokenResponse> sendDeviceToken(
      DeviceTokenRequest deviceTokenRequest);
  Future<RefreshTokenResponse> refreshToken(RefershTokenRequest refershTokenRequest);
  Future<LogoutResponse> logout();

  //notification
  Future<NotificationsDataResponses> getNotifications(
      PaginationRequest paginationRequest);
  Future<ReadingNotificationResponse> readingNotification(RequestWithId requestWithId);
}

class RemoteDataSourceImpl extends IRemoteDataSource {
  // ignore: unused_field
  final IAppServiceApiClient _appServiceApiClient;

  RemoteDataSourceImpl({required IAppServiceApiClient appServiceApiClient})
      : _appServiceApiClient = appServiceApiClient;

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appServiceApiClient.login(loginRequest);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return await _appServiceApiClient.register(registerRequest);
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword(
      ForgetPasswordRequest resetPasswordRequest) async {
    return await _appServiceApiClient.forgetPassword(resetPasswordRequest);
  }


  @override
  Future<ChangePasswordCodeResponse> changePassword(
      ChangePasswordCodeRequest resetPasswordCodeRequest) async {
    return await _appServiceApiClient.changePassword(resetPasswordCodeRequest);
  }

  @override
  Future<ConfirmEmailResponse> confirmEmail(
      ConfirmEmailRequest confirmEmailRequest) async {
    return await _appServiceApiClient.confirmEmail(confirmEmailRequest);
  }

  @override
  Future<SendDeviceTokenResponse> sendDeviceToken(
      DeviceTokenRequest deviceTokenRequest) async {
    return await _appServiceApiClient.sendDeviceToken(deviceTokenRequest);
  }

  @override
  Future<RefreshTokenResponse> refreshToken(RefershTokenRequest refershTokenRequest) async {
    return await _appServiceApiClient.refreshToken(refershTokenRequest);
  }

  @override
  Future<LogoutResponse> logout() async {
    return await _appServiceApiClient.logout();
  }

  @override
  Future<NotificationsDataResponses> getNotifications(
      PaginationRequest paginationRequest) async {
    return await _appServiceApiClient.getNotifications(paginationRequest);
  }

  @override
  Future<ReadingNotificationResponse> readingNotification(
      RequestWithId requestWithId) async {
    return await _appServiceApiClient.readingNotification(requestWithId);
  }

}
