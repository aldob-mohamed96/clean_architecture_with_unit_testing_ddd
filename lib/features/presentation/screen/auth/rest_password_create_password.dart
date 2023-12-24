
import 'package:flutter/material.dart';


import '../../../../core/export/export.dart';

class ResetPasswordCreatePasswordLevelView extends StatelessWidget {
  const ResetPasswordCreatePasswordLevelView({
    super.key,
  });

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
                ResetPasswordStateLevel.successCreateNewPassword) {
          instance<IShowAlertMessage>().showSnakeBarSuccess(
              context, AppStrings.passwordChangedSuccessfully);
          context.goNamed(Routes.login.getNamedLocation());
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorManager.whiteColor,
            appBar: const CustomAuthResetPasswordAppBar(),
            body: const ContentRestPasswordCreate()
                .paddingSymmetric(horizontal: AppPadding.appPadding16));
      },
    );
  }
}

class ContentRestPasswordCreate extends StatelessWidget {
  const ContentRestPasswordCreate({
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
            AppStrings.password.toText(
              context,
              color: const Color(0xff313131),
              fontWeight: FontWeight.w500,
              fontSize: FontSize.fontSize24,
            ),
            AppSize.appSize16.heightSizedBox,
            AppStrings.confirmPassword.toText(
              context,
              color: const Color(0xff6C6C6C),
              fontWeight: FontWeight.w400,
              fontSize: FontSize.fontSize14,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LabelText(text: AppStrings.passwordLogin),
              ],
            ),
            const PasswordChangedInput(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LabelText(text: AppStrings.confirmPassword),
              ],
            ),
            const ConfirmPasswordChangedInput(),
            AppSize.appSize16.heightSizedBox,
            const ResetPasswordButton(),
            AppSize.appSize40.heightSizedBox,
          ]),
    );
  }
}


class PasswordChangedInput extends StatelessWidget {
  const PasswordChangedInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
      return PasswordInputView(
        visiable: state.hidePassword,
        hidePassword: () {
          context.read<ResetPasswordCubit>().changeHidePassword();
        },
        hintText: '••••••••',
        onChanged: (value) {
          context.read<ResetPasswordCubit>().changePassword(value);
        },
        error: state.form.password.isValid || state.form.password.isPure
            ? null
            : state.form.password.error.getErrorInput(),
        // error: state.email.invalid ? AppStrings.emailError : null,
      );
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class ConfirmPasswordChangedInput extends StatelessWidget {
  const ConfirmPasswordChangedInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
      return PasswordInputView(
        visiable: state.hidePasswordConfirm,
        hidePassword: () {
          context.read<ResetPasswordCubit>().changeHidePasswordConfirm();
        },
        hintText: '••••••••',
        onChanged: (value) {
          context.read<ResetPasswordCubit>().changeConfirmPassword(value);
        },
        error: state.form.confirmPassword.isValid ||
                state.form.confirmPassword.isPure
            ? null
            : state.form.confirmPassword.error.getErrorInput(),
        // error: state.email.invalid ? AppStrings.emailError : null,
      );
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return AppStrings.confirm.toEelevatedButton(
            context,
            textAlign: TextAlign.center,
            colortext: ColorManager.whiteColor,
            fontSize: FontSize.fontSize18,
            fontWeight: FontWeight.w700,
            width: context.width,
            state.form.password.isValid &&
                    state.form.confirmPassword.isValid &&
                    !state.form.password.isPure &&
                    !state.form.confirmPassword.isPure
                ? () {
                    context.read<ResetPasswordCubit>().resetPassword();
                  }
                : null);
      },
    );
  }
}
