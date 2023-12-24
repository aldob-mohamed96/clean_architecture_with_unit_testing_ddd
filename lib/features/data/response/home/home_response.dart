
import '../../../../core/export/export.dart';

part 'home_response.g.dart';

@JsonSerializable()
class NotificationItemResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'content')
  String? content;
  @JsonKey(name: 'isRead')
  bool? isRead;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  NotificationItemResponse(
    this.id,
    this.title,
    this.content,
    this.isRead,
    this.createdAt,
    this.updatedAt,
  );

  factory NotificationItemResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemResponseFromJson(json);
}

@JsonSerializable()
class NotificationsDataResponses extends BaseResponse {
  @JsonKey(name: 'data')
  List<NotificationItemResponse>? notifications;
  @JsonKey(name: 'hasNextPage')
  bool? hasNextPage;
  @JsonKey(name: 'hasPreviousPage')
  bool? hasPreviousPage;
  @JsonKey(name: 'totalDocs')
  int? totalDocs;
  @JsonKey(name: 'totalPages')
  int? totalPages;
  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'limit')
  int? limit;

  NotificationsDataResponses(
    this.notifications,
    this.hasNextPage,
    this.hasPreviousPage,
    this.totalDocs,
    this.totalPages,
    this.page,
    this.limit,
  );

  factory NotificationsDataResponses.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDataResponsesFromJson(json);
}

@JsonSerializable()
class ReadingNotificationResponse extends BaseResponse {
  ReadingNotificationResponse();

  factory ReadingNotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$ReadingNotificationResponseFromJson(json);
}
