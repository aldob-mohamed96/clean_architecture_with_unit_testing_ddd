// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationItemResponse _$NotificationItemResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationItemResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['content'] as String?,
      json['isRead'] as bool?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$NotificationItemResponseToJson(
        NotificationItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

NotificationsDataResponses _$NotificationsDataResponsesFromJson(
        Map<String, dynamic> json) =>
    NotificationsDataResponses(
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              NotificationItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['hasNextPage'] as bool?,
      json['hasPreviousPage'] as bool?,
      json['totalDocs'] as int?,
      json['totalPages'] as int?,
      json['page'] as int?,
      json['limit'] as int?,
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..errors = json['errors'];

Map<String, dynamic> _$NotificationsDataResponsesToJson(
        NotificationsDataResponses instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
      'data': instance.notifications,
      'hasNextPage': instance.hasNextPage,
      'hasPreviousPage': instance.hasPreviousPage,
      'totalDocs': instance.totalDocs,
      'totalPages': instance.totalPages,
      'page': instance.page,
      'limit': instance.limit,
    };

ReadingNotificationResponse _$ReadingNotificationResponseFromJson(
        Map<String, dynamic> json) =>
    ReadingNotificationResponse()
      ..status = json['status'] as int?
      ..message = json['message'] as String?
      ..errors = json['errors'];

Map<String, dynamic> _$ReadingNotificationResponseToJson(
        ReadingNotificationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errors': instance.errors,
    };
