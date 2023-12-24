import 'dart:developer';

import 'package:functional/features/domain/entity/data_value.dart';

import '../../../core/resources_manager/constant.dart';
import '../../domain/entity/notification.dart';
import '../../domain/entity/user.dart';
import '../response/auth/auth_responses.dart';
import '../response/home/home_response.dart';

extension LoginResponseMapper on LoginResponse? {
  UserData toDomain() {
    return UserData(
      token: this?.token ?? AppConstants.defaultEmptyString,
      refreshToken: this?.refreshToken ?? AppConstants.defaultEmptyString,
      tokenExpires: this?.tokenExpires ?? AppConstants.defaultEmptyInteger,
    );
  }
}

//notification
extension NotificationResponseMapper on NotificationItemResponse? {
  NotificationItem toDomain() {
    return NotificationItem(
      id: this?.id ?? AppConstants.defaultEmptyInteger,
      title: this?.title ?? AppConstants.defaultEmptyString,
      content: this?.content ?? AppConstants.defaultEmptyString,
      createdAt: this?.createdAt ?? AppConstants.defaultEmptyString,
      updatedAt: this?.updatedAt ?? AppConstants.defaultEmptyString,
    );
  }
}

extension NotificationsResponseMapper on NotificationsDataResponses? {
  NotificationData toDomain() {
    log(this!.notifications.toString());
    return NotificationData(
      notifications: this?.notifications?.map((e) => e.toDomain()).toList() ??
          const Iterable<NotificationItem>.empty().toList(),
      hasNextPage: this?.hasNextPage ?? AppConstants.defaultEmptyBoolFalse,
      hasPreviousPage:
          this?.hasPreviousPage ?? AppConstants.defaultEmptyBoolFalse,
      totalDocs: this?.totalDocs ?? AppConstants.defaultEmptyInteger,
      totalPages: this?.totalPages ?? AppConstants.defaultEmptyInteger,
      page: this?.page ?? AppConstants.defaultEmptyInteger,
      limit: this?.limit ?? AppConstants.defaultEmptyInteger,
    );
  }
}

extension RefreshTokenResponseMapper on RefreshTokenResponse? {
  TokenData toDomain() {
    return TokenData(
      this?.token ?? AppConstants.defaultEmptyString,
      this?.refreshToken ?? AppConstants.defaultEmptyString,
      this?.tokenExpires ?? AppConstants.defaultEmptyInteger,
    );
  }
}
