import 'dart:math';

import '../../../../../core/export/export.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  NotificationCubit({required GetNotificationsUseCase getNotificationsUseCase})
      : _getNotificationsUseCase = getNotificationsUseCase,
        super(const NotificationState());

  void increaseNotification(int value) =>
      emit(state.copyWith(countNotification: state.countNotification + value));

  void clearCountNotification() {
    emit(state.copyWith(
        flowStateApp: FlowStateApp.success, countNotification: 0));
  }

  Future<void> getNotifications() async {
    if (state.notificationData.hasNextPage == false) return;
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));

    int page = state.notificationData.page + 1;

    final result = await _getNotificationsUseCase(PaginationRequest(page));

    await delayForCreateNewStatus();

    result.fold(
      (failure) => emit(state.copyWith(
          flowStateApp: FlowStateApp.normal, failure: failure, page: page)),
      (notificationData) => emit(state.copyWith(
        flowStateApp: FlowStateApp.normal,
        notificationData: state.notificationData.copyWith(
          notifications: <NotificationItem>{
            ...state.notificationData.notifications,
            ...notificationData.notifications
          }.toList(),
          hasNextPage: notificationData.hasNextPage,
          hasPreviousPage: notificationData.hasPreviousPage,
          limit: notificationData.limit,
          page: notificationData.page,
          totalPages: notificationData.totalPages,
          totalDocs: notificationData.totalDocs,
        ),
        page: page,
      )),
    );
  }

  void showNotification(RemoteMessage message) {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    increaseNotification(1);
    final notification = NotificationItem(
      id: Random().nextInt(AppValue.appValue100),
      title: message.notification!.title!,
      content: message.notification!.body!,
      createdAt: DateTime.now().toString(),
    );
    emit(state.copyWith(
        flowStateApp: FlowStateApp.newNotification,
        currentNotification: notification));
  }
}
