import 'package:flutter/material.dart';
import '../../../../core/export/export.dart';

class ErrorContent extends StatelessWidget {
  final String message;
  final String subtitle;

  final VoidCallback? onRefresh;
  const ErrorContent(
      {super.key,
      this.onRefresh,
      this.message = AppStrings.generalError,
      this.subtitle = AppStrings.unknownError});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.assetsImgNoInternet.toSvgAssetImage(
            height: AppSize.appSize245,
            width: AppSize.appSize235,
          ),
          AppSize.appSize20.heightSizedBox,
          message.toText(context,
              fontSize: AppSize.appSize28,
              fontWeight: FontWeight.w700,
              color: ColorManager.blackColor),
          AppSize.appSize10.heightSizedBox,
          subtitle.toText(context,
              fontSize: AppSize.appSize16,
              fontWeight: FontWeight.w500,
              color: ColorManager.greyColor),
          AppSize.appSize10.heightSizedBox,
          onRefresh.toElevetatedButton(
            context,
            text: AppStrings.retryAgain,
          )
        ],
      ),
    );
  }
}
