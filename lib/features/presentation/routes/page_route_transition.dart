
import 'package:flutter/material.dart';

import '../../../../core/export/export.dart';



class CustomPageRouteTransition extends CustomTransitionPage {
  final Widget screen;
  CustomPageRouteTransition({required this.screen})
      : super(
          child: screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: const Offset(0, 0),
              ).animate(
                CurvedAnimation(
                  curve: const Interval(0, 0.5, curve: Curves.easeOut),
                  parent: animation,
                ),
              ),
              child: child,
            );
          },
        );
}

/*---------------- pages -------------------*/

CustomTransitionPage onBoardingRouteBuilder(
        BuildContext context, GoRouterState state) =>
    CustomPageRouteTransition(screen: const OnBoardingScreen());

CustomTransitionPage splashRouteBuilder(
        BuildContext context, GoRouterState state) =>
    CustomPageRouteTransition(screen: const SplashScreen());

CustomTransitionPage userBlcokedRouteBuilder(
        BuildContext context, GoRouterState state) =>
    CustomPageRouteTransition(screen: const BlockedUserScreen());

//auth
CustomTransitionPage loginRouteBuilder(
    BuildContext context, GoRouterState state) {
  loginModule();
  return CustomPageRouteTransition(screen: const LoginScreen());
}

CustomTransitionPage resetPasswordRouteBuilder(
    BuildContext context, GoRouterState state) {
  resetPasswordModule();
  return CustomPageRouteTransition(screen: const ResetPasswordScreen());
}

CustomTransitionPage registerRouteBuilder(
    BuildContext context, GoRouterState state) {
  registerModule();
  return CustomPageRouteTransition(screen: const RegisterScreen());
}

//notification
CustomTransitionPage notificationRouteBuilder(
    BuildContext context, GoRouterState state) {
  return CustomPageRouteTransition(screen: const NotificationsScreen());
}

CustomTransitionPage notificationDetailsRouteBuilder(
    BuildContext context, GoRouterState state) {
  Map<String, dynamic> args = state.extra as Map<String, dynamic>;
  return CustomPageRouteTransition(
      screen: NotificationsDetailsScreen(
    notificationItem: args['notification'] as NotificationItem,
  ));
}
