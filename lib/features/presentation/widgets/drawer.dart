import 'package:flutter/material.dart';
import '../../../../core/export/export.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(AppSize.appSize0),
        )),
        backgroundColor: ColorManager.whiteColor,
        width: context.width * AppSize.appSize0_75,
        elevation: AppSize.appSize10,
        child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppSize.appSize45, horizontal: AppMargin.appMargin16),
            decoration: BoxDecoration(
                color: ColorManager.whiteColor,
                borderRadius: BorderRadius.circular(0)),
            height: context.height,
            child:const SizedBox()));
  }
}
