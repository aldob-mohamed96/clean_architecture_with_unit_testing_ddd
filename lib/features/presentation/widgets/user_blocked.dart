import 'package:flutter/material.dart';
import '../../../../core/export/export.dart';

class UserBlockedContent extends StatelessWidget {
  const UserBlockedContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.assetsJsonBlocked.toAssetLottie(),
          AppSize.appSize10.heightSizedBox,
          AppStrings.userBlocked.toText(context),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
