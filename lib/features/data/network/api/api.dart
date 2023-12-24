import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';

import '../../../../core/resources_manager/constant.dart';
import '../../request/requests.dart';
import '../../response/auth/auth_responses.dart';
import '../../response/home/home_response.dart';

part 'api.g.dart';

@RestApi(
  baseUrl: AppConstants.defaultEmptyString,
)
abstract class IAppServiceApiClient {
  factory IAppServiceApiClient(Dio dio, {String baseUrl}) =
      _IAppServiceApiClient;

  //auth
  @POST(AppConstants.loginUrl)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST(AppConstants.registerUrl)
  Future<RegisterResponse> register(@Body() RegisterRequest registerRequest);

  //send mail to reset password
  @POST(AppConstants.forgetPasswordUrl,)
  Future<ForgetPasswordResponse> forgetPassword(
      @Body() ForgetPasswordRequest resetPasswordRequest);

  //change password
  @POST(AppConstants.changePasswordUrl,)
  Future<ChangePasswordCodeResponse> changePassword(
      @Body() ChangePasswordCodeRequest resetPasswordCodeRequest);

  @POST(AppConstants.confirmEmailUrl)
  Future<ConfirmEmailResponse> confirmEmail(
      @Body() ConfirmEmailRequest confirmEmailRequest);

  @POST(AppConstants.sendDeviceToken)
  Future<SendDeviceTokenResponse> sendDeviceToken(
      @Body() DeviceTokenRequest deviceTokenRequest);

  @POST(AppConstants.refreshTokenUrl)
  Future<RefreshTokenResponse> refreshToken(@Body() RefershTokenRequest refershTokenRequest);

  @POST(AppConstants.logoutUrl)
  Future<LogoutResponse> logout();

  //notification
  @POST(AppConstants.userNotificationUrl)
  Future<NotificationsDataResponses> getNotifications(
      @Body() PaginationRequest paginationRequest);

  @POST(AppConstants.userNotificationReadingNotificationByIdUrlSecondExtension)
  Future<ReadingNotificationResponse> readingNotification(
      @Body() RequestWithId requestWithId);
}
