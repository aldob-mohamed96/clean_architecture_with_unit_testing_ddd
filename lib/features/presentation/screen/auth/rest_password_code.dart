
import 'package:flutter/material.dart';



import '../../../../core/export/export.dart';

class ResetPasswordCodeEnderedLevel extends StatelessWidget {
  const ResetPasswordCodeEnderedLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state.flowStateApp == FlowStateApp.loading) {
          instance<IShowAlertMessage>().showModalLoading(context);
        } else if (state.flowStateApp == FlowStateApp.normal) {
          instance<IShowAlertMessage>().dismissDialog(context);
        } else if (state.flowStateApp == FlowStateApp.error) {
          instance<IShowAlertMessage>()
              .showErrorPopUpOk(context, state.failure.message);
        } else if (state.flowStateApp == FlowStateApp.success &&
            state.resetPasswordStateLevel ==
                ResetPasswordStateLevel.enterNewPassword) {
          instance<IShowAlertMessage>().dismissDialog(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorManager.whiteColor,
            appBar: const CustomAuthResetPasswordAppBar(),
            body: const ContentRestPasswordCode()
                .paddingSymmetric(horizontal: AppPadding.appPadding16));
      },
    );
  }
}

class ContentRestPasswordCode extends StatelessWidget {
  const ContentRestPasswordCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (context.height * AppSize.appSize0_20).heightSizedBox,
            AppSize.appSize16.heightSizedBox,
            AppStrings.confirmEmail.toText(
              context,
              color: const Color(0xff313131),
              fontWeight: FontWeight.w500,
              fontSize: FontSize.fontSize24,
            ),
            AppSize.appSize16.heightSizedBox,
          
            AppSize.appSize30.heightSizedBox,
            const CodeResetPassword(),
            AppSize.appSize16.heightSizedBox,
            const ResendCodePasswordButton(),
            AppSize.appSize20.heightSizedBox,
            const NextPasswordButton(),
            AppSize.appSize40.heightSizedBox,
          ]),
    );
  }
}



class CodeResetPassword extends StatelessWidget {
  const CodeResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
      return Directionality(
          textDirection: TextDirection.ltr,
          child: OtpTextField(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            numberOfFields: 6,
            crossAxisAlignment: CrossAxisAlignment.center,

            showCursor: true,

            textStyle: const TextStyle(
                fontSize: FontSize.fontSize34,
                fontWeight: FontWeight.w400,
                color: Color(0xff372E1D)),

            borderColor: const Color(0xFFA0B9E1),
            autoFocus: true,
            borderRadius: BorderRadius.circular(8.27),
            fieldWidth: context.width * 0.12,

            filled: true,
            cursorColor: const Color(0xFF00522E),
            borderWidth: 1.02,
            mainAxisAlignment: MainAxisAlignment.center,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
            fillColor: const Color(0xFFffffff),

            keyboardType: const TextInputType.numberWithOptions(
              signed: false,
              decimal: false,
            ),
            showFieldAsBox: true,

            onSubmit: (String verificationCode) {
              context.read<ResetPasswordCubit>().changeCode(verificationCode);
            },

            //runs when every textfield is filled
            // end onSubmit
          ));
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class NextPasswordButton extends StatelessWidget {
  const NextPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
      return AppStrings.next.toEelevatedButton(
          context,
          textAlign: TextAlign.center,
          colortext: ColorManager.whiteColor,
          fontSize: FontSize.fontSize18,
          fontWeight: FontWeight.w700,
          width: context.width,
          state.form.code.length != 6
              ? null
              : () {
                  context.read<ResetPasswordCubit>().verifyCode();
                });
    });
  }
}

class ResendCodePasswordButton extends StatelessWidget {
  const ResendCodePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.refresh,
              size: 16,
              color: ColorManager.primaryColor,
            ),
            AppSize.appSize8.widthSizedBox,
            AppStrings.resendCode.toText(
              context,
              textAlign: TextAlign.center,
              fontSize: FontSize.fontSize14,
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.w400,
            ),
          ],
        ).toButton(() {
          context.read<ResetPasswordCubit>().resendCode();
        });
      },
    );
  }
}
