import 'package:flutter/material.dart';
import '../../../../core/export/export.dart';

class CustomBackButton extends StatelessWidget {
  final Function()? onPressed;
  const CustomBackButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.appSize40,
      width: AppSize.appSize40,
      padding: const EdgeInsets.all(AppSize.appSize0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorManager.greyColor,
          borderRadius: BorderRadius.circular(AppSize.appSize4),
          shape: BoxShape.rectangle),
      child: IconButton(
          onPressed: onPressed ??
              () {
                if (context.canPop()) {
                  context.pop();
                }
              },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: AppSize.appSize20,
            color: ColorManager.primaryColor,
          )),
    );
  }
}

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu,
          size: AppSize.appSize35,
          color: ColorManager.primaryColor,
        ));
  }
}

class CustomCloseButton extends StatelessWidget {
  final Function()? onPressed;
  const CustomCloseButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.appSize40,
      width: AppSize.appSize40,
      padding: const EdgeInsets.all(AppSize.appSize0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorManager.greyColor,
        borderRadius: BorderRadius.circular(AppSize.appSize4),
      ),
      child: Center(
        child: IconButton(
            alignment: Alignment.center,
            onPressed: onPressed ??
                () {
                  if (context.canPop()) {
                    context.pop();
                  }
                },
            icon: const Icon(
              Icons.close,
              size: AppSize.appSize16,
              color: ColorManager.primaryColor,
            )),
      ),
    );
  }
}

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.pushNamed(Routes.notification.getNamedLocation());
          },
          child: Badge(
            alignment: Alignment.topRight,
            backgroundColor: ColorManager.greyColor,
            isLabelVisible: state.countNotification > 0,
            label: Text(
              state.countNotification.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppSize.appSize10,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Icon(
              size: AppSize.appSize35,
              Icons.notifications,
              color: ColorManager.primaryColor,
            ),
          ),
        );
      },
    );
  }
}
