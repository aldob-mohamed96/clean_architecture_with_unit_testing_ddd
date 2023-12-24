import 'package:flutter/material.dart';
import 'package:functional/core/export/export.dart';

 

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: AppSize.appSize0_40.heightSizedBox),
            Assets.assetsImgLogo
                .toSvgAssetImage(width: AppSize.appSize200)
                .towidthSizedBox(AppSize.appSize200),
            const Expanded(child: SizedBox()),
            AppConstants.version.toText(context,
                fontSize: AppSize.appSize12, color: ColorManager.greyColor)
          ],
        ));
  }
}
