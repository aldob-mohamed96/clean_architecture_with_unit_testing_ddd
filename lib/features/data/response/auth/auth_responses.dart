
import 'package:functional/core/export/export.dart';

part 'auth_responses.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'refreshToken')
  String? refreshToken;
  @JsonKey(name: 'tokenExpires')
  int? tokenExpires;

  LoginResponse(
    this.token,
    this.refreshToken,
    this.tokenExpires,
  );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

}

@JsonSerializable()
class RegisterResponse extends BaseResponse {
  RegisterResponse();
  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

}


@JsonSerializable()
class LogoutResponse extends BaseResponse {
  LogoutResponse();
  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

}


@JsonSerializable()
class RefreshTokenResponse extends BaseResponse {
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'refreshToken')
  String? refreshToken;
  @JsonKey(name: 'tokenExpires')
  int? tokenExpires;

  RefreshTokenResponse(
    this.token,
    this.refreshToken,
    this.tokenExpires,
  );

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

}

@JsonSerializable()
class SendDeviceTokenResponse extends BaseResponse {
  SendDeviceTokenResponse();
  factory SendDeviceTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$SendDeviceTokenResponseFromJson(json);

}

@JsonSerializable()
class ConfirmEmailResponse extends BaseResponse {
  ConfirmEmailResponse();
  factory ConfirmEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmEmailResponseFromJson(json);

}

@JsonSerializable()
class ChangePasswordCodeResponse extends BaseResponse {
  ChangePasswordCodeResponse();
  factory ChangePasswordCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordCodeResponseFromJson(json);

}

@JsonSerializable()
class ForgetPasswordResponse extends BaseResponse {
  ForgetPasswordResponse();
  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);

}

