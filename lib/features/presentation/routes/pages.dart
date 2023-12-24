import 'package:flutter/material.dart';

import '../../../../core/export/export.dart';


abstract interface class AppRouter {
  GoRouter get router;
}

class AppRouterImpl implements AppRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  GoRouter get router => GoRouter(
        debugLogDiagnostics: true,
        navigatorKey: _rootNavigatorKey,
        
        errorPageBuilder: _errorPageWidget,
        initialLocation: Routes.splash,
        routes: <RouteBase>[
          GoRoute(
              path: Routes.splash,
              name: Routes.splash.getNamedLocation(),
              pageBuilder: splashRouteBuilder),
          GoRoute(
              path: Routes.blocked,
              name: Routes.blocked.getNamedLocation(),
              pageBuilder: userBlcokedRouteBuilder),
          GoRoute(
            path: Routes.onBoarding,
            name: Routes.onBoarding.getNamedLocation(),
            pageBuilder: onBoardingRouteBuilder,
          ),
         
            
// auth
          GoRoute(
              path: Routes.login,
              name: Routes.login.getNamedLocation(),
              pageBuilder: loginRouteBuilder,
              routes: [
                GoRoute(
                  path: Routes.resetPasswordSendCode,
                  name: Routes.resetPasswordSendCode.getNamedLocation(),
                  pageBuilder: resetPasswordRouteBuilder,
                ),
                GoRoute(
                  path: Routes.register,
                  name: Routes.register.getNamedLocation(),
                  pageBuilder: registerRouteBuilder,
                ),
              ]),
        
          // ),
          GoRoute(
            path: Routes.notification,
            name: Routes.notification.getNamedLocation(),
            pageBuilder: notificationRouteBuilder,
            routes: [
              GoRoute(
                path: Routes.notificationDetails,
                name: Routes.notificationDetails.getNamedLocation(),
                pageBuilder: notificationDetailsRouteBuilder,
              ),
            ],
          ),
        ],
        redirect: _redirectionPage,
        refreshListenable:
            GoRouterRefreshStream(instance<SettingsAppCubit>().stream),
      );
//////////////////////////------helper function------//////////////////////////
  FutureOr<String?> _redirectionPage(
          BuildContext context, GoRouterState state) async =>
      _redirectToPage(
        context,
        state,
      );
  MaterialPage _errorPageWidget(BuildContext context, GoRouterState state) =>
      const MaterialPage(child: UndefinedRouteScreen());

  String current = '';
  String? _redirectToPage(BuildContext context, GoRouterState state) {
    final appAuthenticationLevel = context
        .read<SettingsAppCubit>()
        .state
        .settingsApp
        .authenticationSettings
        .appAuthenticationLevel
        .name;

    final isHomeRoute = state.fullPath == Routes.home;
    final isLoginRoute = state.fullPath == Routes.login;
    final isOnBoardingRoute = state.fullPath == Routes.onBoarding;
    final isSplashRoute = state.fullPath == Routes.splash;
    final isBlockedRoute = state.fullPath == Routes.blocked;

    final isAuthenticated =
        appAuthenticationLevel == AppAuthenticationLevel.authenticated.name;
    final isUnAuthenticated =
        appAuthenticationLevel == AppAuthenticationLevel.unAuthenticated.name;
    final isDraft = appAuthenticationLevel == AppAuthenticationLevel.draft.name;
    final isBlockedLevel =
        appAuthenticationLevel == AppAuthenticationLevel.blocked.name;
    final isInitial =
        appAuthenticationLevel == AppAuthenticationLevel.initial.name;

    if (isAuthenticated && !isHomeRoute && current != Routes.home) {
      current = Routes.home;
      return Routes.home;
    } else if (isUnAuthenticated && !isLoginRoute && current != Routes.login) {
      current = Routes.login;
      return Routes.login;
    } else if (isDraft && !isOnBoardingRoute && current != Routes.onBoarding) {
      current = Routes.onBoarding;
      return Routes.onBoarding;
    } else if (isInitial && !isSplashRoute && current != Routes.splash) {
      current = Routes.splash;
      return Routes.splash;
    } else if (isBlockedLevel && !isBlockedRoute && current != Routes.blocked) {
      current = Routes.blocked;
      return Routes.blocked;
    }

    return null;
  }
}
