// custom Appbar() widget),

import 'package:flutter/material.dart';
import '../../../../core/export/export.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isCloseButton;
  final bool showNotificationIconOnAppBar;

  const CustomAppBar(
      {super.key,
      this.isCloseButton = false,
      this.showNotificationIconOnAppBar = true});

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.appSize85);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: preferredSize.height,
      child: Row(
        mainAxisAlignment: isCloseButton
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isCloseButton)
            const CustomCloseButton()
          else
            const CustomBackButton(),
           Assets.assetsImgFacebook.toSvgAssetImage(
            height: AppSize.appSize44,
            width: AppSize.appSize130,
          ),
          if (showNotificationIconOnAppBar) const NotificationIcon(),
        ],
      ).paddingSymmetric(
          vertical: AppMargin.appMargin10, horizontal: AppSize.appSize16),
    );
  }
}

class CustomAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isCloseButton;
  final bool showNotificationIconOnAppBar;

  const CustomAuthAppBar(
      {super.key,
      this.isCloseButton = false,
      this.showNotificationIconOnAppBar = true});

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.appSize85);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomCloseButton(),
          Assets.assetsImgFacebook.toSvgAssetImage(
            height: AppSize.appSize44,
            width: AppSize.appSize130,
          ),
          AppSize.appSize0.heightSizedBox
        ],
      ).paddingSymmetric(horizontal: AppSize.appSize16),
    );
  }
}

class CustomAuthResetPasswordAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isCloseButton;
  final bool showNotificationIconOnAppBar;

  const CustomAuthResetPasswordAppBar(
      {super.key,
      this.isCloseButton = false,
      this.showNotificationIconOnAppBar = true});

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.appSize85);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
            builder: (context, state) {
              if (state.resetPasswordStateLevel ==
                  ResetPasswordStateLevel.darft) {
                return CustomCloseButton(
                  onPressed: () {
                    context.canPop()
                        ? context.pop()
                        : context.pushNamed(Routes.login.getNamedLocation());
                  },
                );
              } else if (state.resetPasswordStateLevel ==
                  ResetPasswordStateLevel.enterCode) {
                return CustomBackButton(onPressed: () {
                  context.read<ResetPasswordCubit>().returnToEnterEmail();
                });
              } else if (state.resetPasswordStateLevel ==
                  ResetPasswordStateLevel.enterNewPassword) {
                return CustomCloseButton(
                  onPressed: () {
                    context.read<ResetPasswordCubit>().returnToEnterEmail();
                  },
                );
              } else {
                return CustomCloseButton(
                  onPressed: () {
                    context.read<SettingsAppCubit>().changeAuthSettingsApp(
                        AppAuthenticationLevel.unAuthenticated);
                  },
                );
              }
            },
          ),
           Assets.assetsImgFacebook.toSvgAssetImage(
            height: AppSize.appSize44,
            width: AppSize.appSize130,
          ),
          AppSize.appSize0.heightSizedBox
        ],
      ).paddingSymmetric(horizontal: AppSize.appSize16),
    );
  }
}
// PreferredSizeWidget

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.appSize85);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.appSize8),
      width: context.width,
      height: preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomDrawerButton(),
           Assets.assetsImgFacebook.toSvgAssetImage(
            height: AppSize.appSize44,
            width: AppSize.appSize130,
          ),
          const NotificationIcon(),
        ],
      ).paddingSymmetric(horizontal: AppSize.appSize0),
    );
  }
}

class CustomOnBoradingAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomOnBoradingAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.appSize120);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSize.appSize16),
      padding: const EdgeInsets.symmetric(horizontal: AppSize.appSize16),
      width: context.width,
      height: preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomDrawerButton(),
           Assets.assetsImgFacebook.toSvgAssetImage(
            height: AppSize.appSize44,
            width: AppSize.appSize130,
          ),
          AppStrings.login.toEelevatedButton(context,
              height: AppSize.appSize40,
              width: AppSize.appSize120,
              colortext: ColorManager.whiteColor, () {
            context
                .read<SettingsAppCubit>()
                .changeAuthSettingsApp(AppAuthenticationLevel.unAuthenticated);
          })
        ],
      ).paddingSymmetric(horizontal: AppSize.appSize0),
    );
  }
}
// PreferredSizeWidget
