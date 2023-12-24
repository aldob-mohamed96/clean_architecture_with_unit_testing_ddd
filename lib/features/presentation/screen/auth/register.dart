
import 'package:flutter/material.dart';


import '../../../../core/export/export.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => instance<RegisterCubit>(),
        child: const MainHomeWidget(
          child: RegisterView(),
        ));
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.flowStateApp == FlowStateApp.loading) {
          instance<IShowAlertMessage>().showModalLoading(context);
        } else if (state.flowStateApp == FlowStateApp.normal) {
          instance<IShowAlertMessage>().dismissDialog(context);
        } else if (state.flowStateApp == FlowStateApp.successRegisted) {
          instance<IShowAlertMessage>().showSnakeBarSuccess(
              context, AppStrings.accountCreatedSuccessfully);

          context.pop();
        } else if (state.flowStateApp == FlowStateApp.error) {
          instance<IShowAlertMessage>()
              .showErrorPopUpOk(context, state.failure.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorManager.whiteColor,
            appBar: const CustomAuthAppBar(),
            body: const ContentRegister()
                .paddingSymmetric(horizontal: AppPadding.appPadding16));
      },
    );
  }
}

class ContentRegister extends StatelessWidget {
  const ContentRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSize.appSize30.heightSizedBox,
         
            AppSize.appSize16.heightSizedBox,
            const Divider(
              color: ColorManager.primaryColor,
              thickness: 1,
            ),
           
            AppSize.appSize16.heightSizedBox,
            const LabelText(text: AppStrings.name),
            const NameRegister(),
            const LabelText(text: AppStrings.nkNameRegister),
            const NkNameRegister(),
            const LabelText(text: AppStrings.emailLogin),
            const EmailRegister(),
            const LabelText(text: AppStrings.phoneRegister),
            const PhoneRegister(),
            const LabelText(text: AppStrings.passwordLogin),
            const PasswordRegister(),
            const LabelText(text: AppStrings.confirmPasswordRegister),
            const ConfirmPasswordRegister(),
            AppSize.appSize16.heightSizedBox,
            const CheckBoxAgreeForConditionsAndPrivacy(),
            AppSize.appSize16.heightSizedBox,
            const RegisterButton(),
            AppSize.appSize16.heightSizedBox,
          ]),
    );
  }
}



class EmailRegister extends StatelessWidget {
  const EmailRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return EmailInputView(
          hintText: AppStrings.hintEmailLogin,
          onChanged: (value) {
            context.read<RegisterCubit>().changeEmail(value);
          },
          error: state.form.email.isValid || state.form.email.isPure
              ? null
              : state.form.email.error.getErrorInput()
          // error: state.email.invalid ? AppStrings.emailError : null,
          );
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class PhoneRegister extends StatelessWidget {
  const PhoneRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return PhoneInputView(
          hintText: AppStrings.hintPhoneRegister,
          onChanged: (value) {
            context.read<RegisterCubit>().changePhone(value);
          },
          error: state.form.phone.isValid || state.form.phone.isPure
              ? null
              : state.form.phone.error.getErrorInput()
          // error: state.email.invalid ? AppStrings.emailError : null,
          );
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class NameRegister extends StatelessWidget {
  const NameRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return GenericInputView(
          hintText: AppStrings.name,
          onChanged: (value) {
            context.read<RegisterCubit>().changeFristName(value);
          },
          error: state.form.firstName.isValid || state.form.firstName.isPure
              ? null
              : state.form.firstName.error.getErrorInput()
          // error: state.email.invalid ? AppStrings.emailError : null,
          );
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class NkNameRegister extends StatelessWidget {
  const NkNameRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return GenericInputView(
          hintText: AppStrings.hintWhtsNkNameRegister,
          onChanged: (value) {
            context.read<RegisterCubit>().changeNickName(value);
          },
          error: state.form.lastName.isValid || state.form.lastName.isPure
              ? null
              : state.form.lastName.error.getErrorInput()
          // error: state.email.invalid ? AppStrings.emailError : null,
          );
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class PasswordRegister extends StatelessWidget {
  const PasswordRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return PasswordInputView(
          hintText: AppStrings.passwordLogin,
          hidePassword: () =>
              context.read<RegisterCubit>().changeHidePassword(),
          visiable: state.hidePassword,
          onChanged: (value) {
            context.read<RegisterCubit>().changePassword(value);
          },
          error: state.form.password.isValid || state.form.password.isPure
              ? null
              : state.form.password.error.getErrorInput());
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class ConfirmPasswordRegister extends StatelessWidget {
  const ConfirmPasswordRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return PasswordInputView(
        hintText: AppStrings.hintConfirmPasswordRegister,
        hidePassword: () =>
            context.read<RegisterCubit>().changeHideConfirmPassword(),
        visiable: state.hideConfirmPassword,
        onChanged: (value) {
          context.read<RegisterCubit>().changeConfirmPassword(value);
        },
        error: state.form.confirmPassword.isValid ||
                state.form.confirmPassword.isPure
            ? null
            : state.form.confirmPassword.error.getErrorInput(),
      );
    }).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return AppStrings.registerButtonRegister.toEelevatedButton(
            context,
            textAlign: TextAlign.center,
            colortext: ColorManager.whiteColor,
            fontSize: FontSize.fontSize18,
            fontWeight: FontWeight.w700,
            width: context.width,
            state.form.isValid && state.isAgree && !state.form.isPure
                ? () {
                    context.read<RegisterCubit>().register();
                  }
                : null);
      },
    );
  }
}

class CheckBoxAgreeForConditionsAndPrivacy extends StatelessWidget {
  const CheckBoxAgreeForConditionsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return SizedBox(
              width: AppSize.appSize20,
              child: Checkbox(
                  checkColor: ColorManager.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                        width: 2, color: ColorManager.primaryColor),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: state.isAgree,
                  onChanged: (value) => context
                      .read<RegisterCubit>()
                      .changeAgreePrivacyOrDisAgree(),
                  activeColor: ColorManager.primaryColor,
                  overlayColor: MaterialStateProperty.all(
                    ColorManager.primaryColor.withOpacity(0.1),
                  )),
            );
          },
        ),
        AppSize.appSize10.widthSizedBox,
        AppStrings.readPrivacyPolicyRegister.toText(
          context,
          fontSize: FontSize.fontSize14,
          fontWeight: FontWeight.w500,
          color: ColorManager.blackColor,
        ),
        GestureDetector(
          onTap: () async {
            try {
              if (await canLaunchUrlString(AppConstants.privacyUrl)) {
                await launchUrlString(AppConstants.privacyUrl,
                    mode: LaunchMode.externalApplication);
              } else {
                if (context.mounted) {
                  instance<IShowAlertMessage>().showSnakeBarError(
                      context, AppStrings.unKnownLauncherError);
                }
              }
            } catch (e) {
              if (context.mounted) {
                instance<IShowAlertMessage>().showSnakeBarError(
                    context, AppStrings.unKnownLauncherError);
              }
            }
          },
          child: AppStrings.condtionsRegister.toText(
            context,
            fontSize: FontSize.fontSize14,
            fontWeight: FontWeight.w500,
            color: ColorManager.primaryColor,
          ),
        ),
      ],
    );
  }
}
