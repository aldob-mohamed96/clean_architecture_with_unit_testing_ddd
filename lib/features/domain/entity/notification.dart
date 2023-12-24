import '../../../core/export/export.dart';


class NotificationItem extends Equatable {
  final int id;
  final String title;
  final String content;
  final bool isRead;
  final String createdAt;
  final String updatedAt;

  const NotificationItem({
    this.id = AppConstants.defaultEmptyInteger,
    this.title = AppConstants.defaultEmptyString,
    this.content = AppConstants.defaultEmptyString,
    this.isRead = AppConstants.defaultEmptyBoolFalse,
    this.createdAt = AppConstants.defaultEmptyString,
    this.updatedAt = AppConstants.defaultEmptyString,
  });

  NotificationItem copyWith({
    int? id,
    String? title,
    String? content,
    bool? isRead,
    String? createdAt,
    String? updatedAt,
  }) {
    return NotificationItem(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, title, content, isRead, createdAt, updatedAt];
}

class NotificationData extends Equatable {
  final List<NotificationItem> notifications;

  final bool hasNextPage;
  final bool hasPreviousPage;
  final int totalDocs;
  final int totalPages;
  final int page;
  final int limit;

  const NotificationData({
    this.notifications = const [],
    this.hasNextPage = AppConstants.defaultEmptyBoolTrue,
    this.hasPreviousPage = AppConstants.defaultEmptyBoolTrue,
    this.totalDocs = AppConstants.defaultEmptyInteger,
    this.totalPages = AppConstants.defaultEmptyInteger,
    this.page = AppConstants.defaultEmptyInteger,
    this.limit = AppConstants.defaultEmptyInteger,
  });

  NotificationData copyWith({
    List<NotificationItem>? notifications,
    bool? hasNextPage,
    bool? hasPreviousPage,
    int? totalDocs,
    int? totalPages,
    int? page,
    int? limit,
  }) {
    return NotificationData(
      notifications: notifications ?? this.notifications,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
      totalDocs: totalDocs ?? this.totalDocs,
      totalPages: totalPages ?? this.totalPages,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }

  @override
  List<Object?> get props => [
        notifications,
        hasNextPage,
        hasPreviousPage,
        totalDocs,
        totalPages,
        page,
        limit
      ];
}
