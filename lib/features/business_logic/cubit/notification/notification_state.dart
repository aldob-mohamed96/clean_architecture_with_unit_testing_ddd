part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final NotificationData notificationData;
  final int countNotification;
  final NotificationItem currentNotification;
  final int page;

  const NotificationState({
    this.flowStateApp = FlowStateApp.draft,
    this.failure = const Failure(),
    this.countNotification = AppConstants.defaultEmptyInteger,
    this.notificationData = const NotificationData(),
    this.currentNotification = const NotificationItem(),
    this.page = AppConstants.defaultEmptyInteger,
  });

  NotificationState copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    NotificationData? notificationData,
    int? countNotification,
    NotificationItem? currentNotification,
    int? page,
  }) {
    return NotificationState(
      countNotification: countNotification ?? this.countNotification,
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      notificationData: notificationData ?? this.notificationData,
      currentNotification: currentNotification ?? this.currentNotification,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
        flowStateApp,
        failure,
        countNotification,
        notificationData,
        currentNotification,
        page,
      ];
}
