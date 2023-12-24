
import 'package:flutter/material.dart';

import '../../../../core/export/export.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => instance<ResetPasswordCubit>(),
        child: MainHomeWidget(
          child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
            builder: (context, state) {
              if (state.resetPasswordStateLevel ==
                  ResetPasswordStateLevel.darft) {
                return const ResetPasswordLevelEnterdEmailView();
              } else if (state.resetPasswordStateLevel ==
                  ResetPasswordStateLevel.enterCode) {
                return const ResetPasswordCodeEnderedLevel();
              } else if (state.resetPasswordStateLevel ==
                  ResetPasswordStateLevel.enterNewPassword) {
                return const ResetPasswordCreatePasswordLevelView();
              }
              return const ResetPasswordLevelEnterdEmailView();
            },
          ),
        ));
  }
}

class ResetPasswordLevelEnterdEmailView extends StatelessWidget {
  const ResetPasswordLevelEnterdEmailView({super.key});

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
                ResetPasswordStateLevel.enterCode) {
          instance<IShowAlertMessage>().dismissDialog(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorManager.whiteColor,
            appBar: const CustomAuthResetPasswordAppBar(),
            body: const ContentRestPasswordView()
                .paddingSymmetric(horizontal: AppPadding.appPadding16));
      },
    );
  }
}

class ContentRestPasswordView extends StatelessWidget {
  const ContentRestPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (context.height * AppSize.appSize0_20).heightSizedBox,
            AppStrings.forgetPassword.toText(
              context,
              color: const Color(0xff313131),
              fontWeight: FontWeight.w500,
              fontSize: FontSize.fontSize24,
            ),
            AppSize.appSize16.heightSizedBox,
            AppStrings.email.toText(
              context,
              color: const Color(0xff6C6C6C),
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              fontSize: FontSize.fontSize14,
            ),
            AppSize.appSize30.heightSizedBox,
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LabelText(text: AppStrings.emailLogin),
              ],
            ),
            const EmailResetPassword(),
            AppSize.appSize20.heightSizedBox,
            const SendCodePasswordButton(),
            AppSize.appSize40.heightSizedBox,
          ]),
    );
  }
}


class EmailResetPassword extends StatelessWidget {
  const EmailResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
      return EmailInputView(
        hintText: AppStrings.email,
        onChanged: (value) {
          context.read<ResetPasswordCubit>().changeEmail(value);
        },
        error: state.form.email.isValid || state.form.email.isPure
            ? null
            : state.form.email.error.getErrorInput(),
        // error: state.email.invalid ? AppStrings.emailError : null,
      );
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class SendCodePasswordButton extends StatelessWidget {
  const SendCodePasswordButton({super.key});

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
            state.form.email.isValid && !state.form.email.isPure
                ? () {
                    context.read<ResetPasswordCubit>().sendCode();
                  }
                : null);
      },
    );
  }
}
