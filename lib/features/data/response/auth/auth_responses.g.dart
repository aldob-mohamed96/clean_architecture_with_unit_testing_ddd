// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      json['token'] as String?,
      json['refreshToken'] as String?,
      json['tokenExpires'] as int?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..errors = json['errors'];

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'tokenExpires': instance.tokenExpires,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse()
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..errors = json['errors'];

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) =>
    LogoutResponse()
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..errors = json['errors'];

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

RefreshTokenResponse _$RefreshTokenResponseFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenResponse(
      json['token'] as String?,
      json['refreshToken'] as String?,
      json['tokenExpires'] as int?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..errors = json['errors'];

Map<String, dynamic> _$RefreshTokenResponseToJson(
        RefreshTokenResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'tokenExpires': instance.tokenExpires,
    };

SendDeviceTokenResponse _$SendDeviceTokenResponseFromJson(
        Map<String, dynamic> json) =>
    SendDeviceTokenResponse()
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..errors = json['errors'];

Map<String, dynamic> _$SendDeviceTokenResponseToJson(
        SendDeviceTokenResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

ConfirmEmailResponse _$ConfirmEmailResponseFromJson(
        Map<String, dynamic> json) =>
    ConfirmEmailResponse()
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..errors = json['errors'];

Map<String, dynamic> _$ConfirmEmailResponseToJson(
        ConfirmEmailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

ChangePasswordCodeResponse _$ChangePasswordCodeResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordCodeResponse()
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..errors = json['errors'];

Map<String, dynamic> _$ChangePasswordCodeResponseToJson(
        ChangePasswordCodeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };

ForgetPasswordResponse _$ForgetPasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponse()
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..errors = json['errors'];

Map<String, dynamic> _$ForgetPasswordResponseToJson(
        ForgetPasswordResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };
