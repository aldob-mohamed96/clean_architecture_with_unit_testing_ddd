import 'package:flutter/material.dart';

import '../../../../core/export/export.dart';


class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainHomeWidget(
      child: BlocProvider<NotificationCubit>(
        create: (context) => instance<NotificationCubit>()..getNotifications(),
        child: const ContentNotificationView(),
      ),
    );
  }
}

class ContentNotificationView extends StatelessWidget {
  const ContentNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        appBar: const CustomAppBar(
          isCloseButton: false,
          showNotificationIconOnAppBar: true,
        ),
        body: const ContentNotification()
            .paddingSymmetric(horizontal: AppPadding.appPadding16));
  }
}

class ContentNotification extends StatelessWidget {
  const ContentNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
      if (state.flowStateApp == FlowStateApp.loading &&
          state.notificationData.notifications.isEmpty) {
        return const Center(
          child: LoadinContent(),
        );
      } else if (state.flowStateApp == FlowStateApp.error &&
          state.notificationData.notifications.isEmpty) {
        return Center(
          child: ErrorContent(
            message: state.failure.message,
            onRefresh: () =>
                context.read<NotificationCubit>().getNotifications(),
          ),
        );
      } else if (state.notificationData.notifications.isEmpty &&
          state.page == 1) {
        return Center(
          child: EmptyContent(
            onRefresh: () =>
                context.read<NotificationCubit>().getNotifications(),
          ),
        );
      } else {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSize.appSize30.heightSizedBox,
              AppStrings.notification.toText(context,
                  fontSize: FontSize.fontSize20,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.blackColor),
              AppSize.appSize30.heightSizedBox,
              NotificationsContent(state: state),
              AppSize.appSize30.heightSizedBox,
            ]);
      }
    }).paddingOnly(top: AppPadding.appPadding16);
  }
}

class NotificationsContent extends StatefulWidget {
  final NotificationState state;
  const NotificationsContent({super.key, required this.state});

  @override
  State<NotificationsContent> createState() => _NotificationsContentState();
}

class _NotificationsContentState extends State<NotificationsContent> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<NotificationCubit>().getNotifications();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.90);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width,
        height: context.height - AppSize.appSize250,
        child: ListView.separated(
          controller: _scrollController,  
          separatorBuilder: (context, index) => const Divider(
            color: Color(0xFF7F7F7F),
            height: AppSize.appSize1,
          ),
          itemCount: widget.state.notificationData.notifications.isEmpty
              ? 1
              : widget.state.notificationData.hasNextPage
                  ? widget.state.notificationData.notifications.length + 1
                  : widget.state.notificationData.notifications.length,
          itemBuilder: (context, index) {
            return index >= widget.state.notificationData.notifications.length
                ? const BottomLoader()
                    .paddingSymmetric(vertical: AppPadding.appPadding16)
                : NotificationItemContent(
                    item: widget.state.notificationData.notifications[index],
                  );
          },
        ));
  }
}

class NotificationItemContent extends StatelessWidget {
  final NotificationItem item;
  const NotificationItemContent({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 95,
        padding: const EdgeInsets.all(AppPadding.appPadding16),
        decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            //bottom border
            border: Border(
              bottom: BorderSide(
                style: BorderStyle.none,
                strokeAlign: -2,
                color: Color.fromARGB(255, 252, 243, 243),
                width: AppSize.appSize0,
              ),
            )),
        child: ListTile(
          // onTap: () {
          //   context.pushNamed(Routes.notificationDetails,
          //       extra: {'notification': item});
          // },
          titleAlignment: ListTileTitleAlignment.titleHeight,
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: AppSize.appSize24,
            backgroundColor: const Color(0xFF0CAC4B).withOpacity(0.12),
            child: Assets.assetsImgNotificationItem.toSvgAssetImage(
              height: 24,
              width: 24,
            ),
          ),
          title: item.title.toText(context,
              fontSize: FontSize.fontSize16,
              fontWeight: FontWeight.w500,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              color: ColorManager.blackColor),
          subtitle: item.content.toText(context,
              fontSize: FontSize.fontSize14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF7F7F7F)),
        ));
  }
}
