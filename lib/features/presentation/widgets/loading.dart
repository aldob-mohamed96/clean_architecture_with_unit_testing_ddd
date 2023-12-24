import 'package:flutter/material.dart';
import '../../../../core/export/export.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          height: AppSize.appSize24,
          width: AppSize.appSize24,
          child: ListLoading()),
    );
  }
}

class CircularLoadingIndicator extends StatelessWidget {
  const CircularLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        
        backgroundColor: AppConstants.backgroundCircularLoading,
        strokeWidth: AppSize.appSize5,
        semanticsLabel: 'Loading',
        valueColor:
            AlwaysStoppedAnimation<Color>(AppConstants.valueCircularLoading),
        semanticsValue: 'Loading',
        strokeCap: StrokeCap.round,
      ),
    );
  }
}

//shimmer loadin list
class ListLoading extends StatelessWidget {
  const ListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularLoadingIndicator(),
    );
  }
}

class LoadinContent extends StatelessWidget {
  final String message;
  const LoadinContent({super.key, this.message = AppStrings.loading});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: context.height/2,
        width: context.width,
      
      ) ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          const CircularLoadingIndicator(),
          AppSize.appSize20.heightSizedBox,
          message.toText(context,
          color: ColorManager.whiteColor,
          fontSize: AppSize.appSize16,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,


          ),
        
          
        ],
      ),
    );
  }
}

