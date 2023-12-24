import 'package:flutter/material.dart';
import '../../../../core/export/export.dart';

class MainWidget extends StatelessWidget {
  const MainWidget(
      {super.key, required this.child, this.isCloseButton = false});
  final Widget child;
  final bool isCloseButton;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final constrainedTextScaleFactor =
        mediaQueryData.textScaler.clamp(minScaleFactor: 0.5, maxScaleFactor: 1);

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: MediaQuery(
          data: mediaQueryData.copyWith(textScaler: constrainedTextScaleFactor),
          child: SafeArea(
              bottom: true,
              top: true,
              child: Scaffold(
                  backgroundColor: ColorManager.whiteColor,
                  appBar: CustomAppBar(
                    isCloseButton: isCloseButton,
                  ),
                  body: child)),
        ));
  }
}

class MainHomeWidget extends StatelessWidget {
  const MainHomeWidget({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final constrainedTextScaleFactor =
        mediaQueryData.textScaler.clamp(minScaleFactor: 0.5, maxScaleFactor: 1);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: MediaQuery(
          data: mediaQueryData.copyWith(textScaler: constrainedTextScaleFactor),
          child: SafeArea(bottom: true, top: true, child: child),
        ));
  }
}
