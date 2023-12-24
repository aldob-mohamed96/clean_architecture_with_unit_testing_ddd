import 'package:flutter/material.dart';
import 'package:functional/core/export/export.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            context
                .read<SettingsAppCubit>()
                .changeAuthSettingsApp(AppAuthenticationLevel.unAuthenticated);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('OnBoardingScreen'),
              BottomSheet(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  final GlobalKey secondComponentKey = GlobalKey();

  BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: secondComponentKey,
      child: IconButton(
        icon: const Icon(Icons.info),
        onPressed: () => showCustomBottomSheet(context, secondComponentKey),
      ),
    );
  }

  void showCustomBottomSheet(BuildContext context, GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final componentPosition = renderBox.localToGlobal(Offset.zero);

    double sheetHeight =
        MediaQuery.of(context).size.height - componentPosition.dy;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: sheetHeight,
          color: Colors.white,
          child: const Center(
            child: Text('This is a custom BottomSheet'),
          ),
        );
      },
    );
  }
}
