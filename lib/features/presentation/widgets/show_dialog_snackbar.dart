import 'package:flutter/material.dart';
import '../../../../core/export/export.dart';

abstract interface class IShowAlertMessage {
  void showErrorPopUpOk(BuildContext context, String message);
  void showSuccessPopUpOk(BuildContext context, String message);
  void showSuccessPopUpOkWithoutClose(BuildContext context, String message);
  void showLoadingPopUp(BuildContext context);
  void showErrorPopupRetry(
      BuildContext context, String message, Function retryActionFunction);
  void showAskContinuePopup(
      BuildContext context, String message, Function retryActionFunction,
      {String ok = AppStrings.ok, String cancelText = AppStrings.dismiss});
  void showSnakeBar(BuildContext context, String message);
  void showSnakeBarLoading(BuildContext context, String message);
  void showSnakeBarSuccess(BuildContext context, String message);
  void showSnakeBarError(BuildContext context, String message);

  void showSnakeBarWithoutClose(BuildContext context, String message);
  void showAskContinueSettingPopup(BuildContext context, String message);
  void showModalLoading(BuildContext context);
  void dismissDialog(BuildContext context);
}

class ShowAlertMessageImpl implements IShowAlertMessage {
  @override
  void showErrorPopUpOk(BuildContext context, String message) {
    dismissDialog(context);
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppPadding.appPadding10),
              child: _getPopUpDialog(context, [
                _getAnimatedImage(Assets.assetsJsonError),
                _getMessage(context, message),
                _getPopUpButton(context)
              ]),
            ));
  }

  @override
  void showAskContinueSettingPopup(BuildContext context, String message) {
    dismissDialog(context);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppPadding.appPadding10),
              child: _getPopUpDialog(context, [
                _getAnimatedImage(Assets.assetsJsonError),
                _getMessage(context, message),
                _getDialogContentButton(context, [
                  _getPopUpDismissButton(context),
                  _getSettingButton(context),
                ])
              ]),
            ));
  }

  Widget _getSettingButton(
    BuildContext context,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding12),
        child: SizedBox(
            child: ElevatedButton(
          onPressed: () async {
            //await openAppSettings();
          },
          child: const Text('الاعدادات'),
        )),
      ),
    );
  }

  @override
  void showSuccessPopUpOk(BuildContext context, String message) {
    dismissDialog(context);
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppPadding.appPadding18),
              child: _getPopUpDialog(context, [
                AppSize.appSize20.heightSizedBox,
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                AppSize.appSize10.heightSizedBox,
                _getMessage(context, message),
                AppSize.appSize10.heightSizedBox,
                _getPopUpButton(context)
              ]),
            ));
  }

  @override
  void showSuccessPopUpOkWithoutClose(BuildContext context, String message) {
    dismissDialog(context);
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppPadding.appPadding18),
              child: _getPopUpDialog(context, [
                AppSize.appSize20.heightSizedBox,
                _getAnimatedImage(Assets.assetsJsonSuccess),
                AppSize.appSize10.heightSizedBox,
                _getMessage(context, message),
                AppSize.appSize10.heightSizedBox,
                _getPopUpButton(context)
              ]),
            ));
  }

  @override
  void showLoadingPopUp(BuildContext context) {
    dismissDialog(context);
    Navigator.of(context).push(FullScreenModal());
  }

  void showLoadingPopUpr(BuildContext context) {
    dismissDialog(context);
    showDialog(
        barrierDismissible: false,
        useRootNavigator: true,
        useSafeArea: true,
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppPadding.appPadding18),
              child: _getPopUpDialog(context, [
                AppSize.appSize20.heightSizedBox,
                const CircularLoadingIndicator(),
                _getMessage(context, AppStrings.loading),
                AppSize.appSize20.heightSizedBox,
              ]),
            ));
  }

  @override
  void showErrorPopupRetry(
      BuildContext context, String message, Function retryActionFunction) {
    dismissDialog(context);
    showDialog(
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppPadding.appPadding10),
              child: _getPopUpDialog(context, [
                _getAnimatedImage(Assets.assetsJsonError),
                _getMessage(context, message),
                _getRetryButton(context, retryActionFunction)
              ]),
            ));
  }

  @override
  void showAskContinuePopup(
      BuildContext context, String message, Function retryActionFunction,
      {String ok = AppStrings.ok, String cancelText = AppStrings.dismiss}) {
    dismissDialog(context);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(AppPadding.appPadding10),
              child: _getPopUpDialog(context, [
                _getAnimatedImage(Assets.assetsJsonSuccess),
                _getMessage(context, message),
                _getDialogContentButton(context, [
                  _getPopUpDismissButton(context),
                  _getExitButton(context, retryActionFunction),
                ])
              ]),
            ));
  }

  _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;
  @override
  void dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.appSize14)),
      elevation: AppSizeMin.appSizeMin1_4,
      backgroundColor: ColorManager.transparentColor,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.appSize14),
            boxShadow: const [BoxShadow(color: ColorManager.primaryColor)]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getDialogContentButton(BuildContext context, List<Widget> children) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return Center(
      child: SizedBox(
        height: AppSize.appSize100,
        width: AppSize.appSize100,
        child: animationName.toAssetLottie(
          height: AppSize.appSize100,
          width: AppSize.appSize100,
        ),
      ),
    );
  }

  Widget _getMessage(BuildContext context, String message) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(AppPadding.appPadding8),
          child: message.toText(context,
              color: ColorManager.primaryColor,
              textAlign: TextAlign.center,
              fontSize: FontSize.fontSize16,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _getPopUpButton(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding12),
        child: SizedBox(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSize.appSize10))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: AppStrings.ok.toText(context,
                    color: ColorManager.whiteColor,
                    fontSize: FontSize.fontSize16,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  Widget _getPopUpDismissButton(BuildContext context,
      {String cancelText = AppStrings.dismiss}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding12),
        child: SizedBox(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSize.appSize10))),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: cancelText.toText(context,
                    color: ColorManager.whiteColor,
                    fontSize: FontSize.fontSize16,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  Widget _getRetryButton(BuildContext context, Function retryActionFunction) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding12),
        child: SizedBox(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSize.appSize10))),
                onPressed: () {
                  retryActionFunction.call();
                },
                child: AppStrings.ok.toText(context,
                    color: ColorManager.whiteColor,
                    fontSize: FontSize.fontSize16,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  Widget _getExitButton(BuildContext context, Function retryActionFunction,
      {String ok = AppStrings.ok}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.appPadding12),
        child: SizedBox(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSize.appSize10))),
                onPressed: () {
                  retryActionFunction.call();
                },
                child: ok.toText(context,
                    color: ColorManager.whiteColor,
                    fontSize: FontSize.fontSize16,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }

  @override
  void showModalLoading(BuildContext context) {
    dismissDialog(context);
    Navigator.of(context).push(FullScreenModal());
  }

  @override
  void showSnakeBar(BuildContext context, String message) {
    dismissDialog(context);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: message.toText(context),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: trans(context, AppStrings.dismiss),
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }

  @override
  void showSnakeBarLoading(BuildContext context, String message) {
    dismissDialog(context);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorManager.primaryColor,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [message.toText(context), const CircularLoadingIndicator()],
      ),
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.appSize10),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(AppPadding.appPadding10),
    ));
  }

  @override
  void showSnakeBarSuccess(BuildContext context, String message) {
    dismissDialog(context);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorManager.primaryColor,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          message.toText(context, color: Colors.white),
          const Icon(
            Icons.check_circle,
            color: Colors.green,
          )
        ],
      ),
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.appSize10),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(AppPadding.appPadding10),
    ));
  }

  @override
  void showSnakeBarError(BuildContext context, String message) {
    dismissDialog(context);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorManager.primaryColor,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          message.toText(context),
          const Icon(
            Icons.error,
            color: Colors.red,
          )
        ],
      ),
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.appSize10),
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(AppPadding.appPadding10),
    ));
  }

  @override
  void showSnakeBarWithoutClose(BuildContext context, String message) {
    dismissDialog(context);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: message.toText(context),
      duration: const Duration(seconds: 3),
    ));
  }
}

class FullScreenModal extends ModalRoute {
  // constructor
  FullScreenModal();

  @override
  Duration get transitionDuration => const Duration(milliseconds: 50);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.6);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  static const colorizeColors = [
    Colors.white,
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularLoadingIndicator(),
            AppSize.appSize30.heightSizedBox,
            AppStrings.loading.toText(context),
          ],
        )),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(animation),
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      ),
    );
  }
}
