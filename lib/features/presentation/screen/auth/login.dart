

import 'package:flutter/material.dart';

import '../../../../core/export/export.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => instance<LoginCubit>(),
        child: const MainHomeWidget(
          child: LoginView(),
        ));
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.flowStateApp == FlowStateApp.error) {
          instance<IShowAlertMessage>()
              .showErrorPopUpOk(context, state.failure.message);
        } else if (state.flowStateApp == FlowStateApp.loading) {
          instance<IShowAlertMessage>().showModalLoading(context);
        } else if (state.flowStateApp == FlowStateApp.normal) {
          instance<IShowAlertMessage>().dismissDialog(context);
        } else if (state.flowStateApp == FlowStateApp.successLoggedIn) {
          instance<IShowAlertMessage>().dismissDialog(context);
          context.read<SettingsAppCubit>().getSettingsApp();
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorManager.whiteColor,
            appBar: const CustomAuthAppBar(),
            body: const ContentLogin()
                .paddingSymmetric(horizontal: AppPadding.appPadding16));
      },
    );
  }
}

class ContentLogin extends StatelessWidget {
  const ContentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSize.appSize30.heightSizedBox,
            const Lable(lable: AppStrings.titleLogin),
            AppSize.appSize16.heightSizedBox,
            AppStrings.login.toText(
              context,
              color: ColorManager.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: FontSize.fontSize24,
            ),
            AppSize.appSize16.heightSizedBox,
            const Divider(
              color: ColorManager.primaryColor,
              thickness: 1,
            ),
            AppSize.appSize16.heightSizedBox,
            const LabelText(text: AppStrings.emailLogin),
            const EmailLogin(),
            const LabelText(text: AppStrings.passwordLogin),
            const PasswordLogin(),
            AppSize.appSize20.heightSizedBox,
            const LoginButton(),
            AppSize.appSize40.heightSizedBox,
            const ForgetPassword(),
            AppSize.appSize50.heightSizedBox,
            const RegisterNow(),
          ]),
    );
  }
}



class EmailLogin extends StatelessWidget {
  const EmailLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return EmailInputView(
        hintText: AppStrings.hintEmailLogin,
        error: state.form.email.isValid || state.form.email.isPure
            ? null
            : state.form.email.error.getErrorInput(),
        onChanged: (value) {
          context.read<LoginCubit>().changeEmail(value);
        },
        // error: state.email.invalid ? AppStrings.emailError : null,
      );
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class PasswordLogin extends StatelessWidget {
  const PasswordLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return PasswordInputView(
        visiable: state.hidePassword,
        hidePassword: () {
          context.read<LoginCubit>().changeHidePassword();
        },
        hintText: AppStrings.passwordLogin,
        error: state.form.password.isValid || state.form.password.isPure
            ? null
            : state.form.password.error.getErrorInput(),
        onChanged: (value) {
          context.read<LoginCubit>().changePassword(value);
        },
        // error: state.email.invalid ? AppStrings.emailError : null,
      );
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return AppStrings.login.toEelevatedButton(
            context,
            textAlign: TextAlign.center,
            colortext: ColorManager.whiteColor,
            fontSize: FontSize.fontSize18,
            fontWeight: FontWeight.w700,
            width: context.width,
            state.form.isNotValid
                ? null
                : () {
                    context.read<LoginCubit>().login();
                  });
      },
    );
  }
}

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStrings.doForgertPasswordLogin
        .toText(
      context,
      color: ColorManager.primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: FontSize.fontSize20,
    )
        .toButton(() {
      //   context.pushNamed(Routes.resetPasswordSendCode);
      context.read<SettingsAppCubit>().cashSettingsApp(
          context.read<SettingsAppCubit>().state.settingsApp.copyWith(
                authenticationSettings: context
                    .read<SettingsAppCubit>()
                    .state
                    .settingsApp
                    .authenticationSettings
                    .copyWith(
                        appAuthenticationLevel: AppAuthenticationLevel.draft),
              ));
    });
  }
}

class RegisterNow extends StatelessWidget {
  const RegisterNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppStrings.doRegisterWithUsLogin.toText(
          context,
          color: ColorManager.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: FontSize.fontSize20,
        ),
        AppSize.appSize2.widthSizedBox,
        AppStrings.register
            .toText(
          context,
          color: ColorManager.primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: FontSize.fontSize20,
        )
            .toButton(() {
          context.pushNamed(Routes.register);
        }),
      ],
    );
  }
}
