import 'package:flutter/material.dart';
import '../../../../core/export/export.dart';


class EmptyContent extends StatelessWidget {
  final String message;
  final String subtitleMessage;
  final VoidCallback? onRefresh;
  const EmptyContent(
      {super.key,
      this.onRefresh,
      this.message = AppStrings.noData,
      this.subtitleMessage = AppStrings.subtitleNoData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.assetsImgEmpty.toSvgAssetImage(
            height: AppSize.appSize200,
            width: AppSize.appSize200,
          ),
          AppSize.appSize40.heightSizedBox,
          message.toText(context,
              fontSize: AppSize.appSize28,
              fontWeight: FontWeight.w700,
              color: ColorManager.blackColor),
          AppSize.appSize10.heightSizedBox,
          subtitleMessage.toText(context,
              fontSize: AppSize.appSize16,
              fontWeight: FontWeight.w500,
              color: ColorManager.greyColor),
          AppSize.appSize10.heightSizedBox,
            () 
            {
              context.goNamed(Routes.home.getNamedLocation());

            }.toElevetatedButton(
              context,
              text: AppStrings.homePage,
            )
        ],
      ),
    );
  }
}

class EmptyNotificationContent extends StatelessWidget {
  final String message;
  final String subtitleMessage;
  final VoidCallback? onRefresh;
  const EmptyNotificationContent(
      {super.key,
      this.onRefresh,
      this.message = AppStrings.notificationNoData,
      this.subtitleMessage = AppStrings.notificationNoDataSubtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.assetsImgEmptyNotification.toSvgAssetImage(
            height: AppSize.appSize245,
            width: AppSize.appSize235,
          ),
          AppSize.appSize40.heightSizedBox,
          message.toText(context,
              fontSize: AppSize.appSize28,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w700,
              color: ColorManager.blackColor),
          AppSize.appSize10.heightSizedBox,
          subtitleMessage.toText(context,
              fontSize: AppSize.appSize16,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
              color: ColorManager.greyColor),
          AppSize.appSize10.heightSizedBox,
          onRefresh.toElevetatedButton(
            context,
            text: AppStrings.refresh,
          )
        ],
      ),
    );
  }
}
