part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  final FlowStateApp flowStateApp;
  final ResetPasswordStateLevel resetPasswordStateLevel;
  final Failure failure;
  final FormResetPassword form;
  final bool hidePassword;
  final bool hidePasswordConfirm;
  final bool isSendCode;

  const ResetPasswordState({
    this.flowStateApp = FlowStateApp.draft,
    this.resetPasswordStateLevel = ResetPasswordStateLevel.darft,
    this.form = const FormResetPassword(),
    this.failure = const Failure(),
    this.hidePassword = AppConstants.defaultEmptyBoolFalse,
    this.hidePasswordConfirm = AppConstants.defaultEmptyBoolFalse,
    this.isSendCode = AppConstants.defaultEmptyBoolFalse,
  });

  ResetPasswordState copyWith({
    FlowStateApp? flowStateApp,
    ResetPasswordStateLevel? resetPasswordStateLevel,
    Failure? failure,
    FormResetPassword? form,
    bool? hidePassword,
    bool? hidePasswordConfirm,
    bool? isSendCode,
  }) {
    return ResetPasswordState(
      flowStateApp: flowStateApp ?? this.flowStateApp,
      resetPasswordStateLevel:
          resetPasswordStateLevel ?? this.resetPasswordStateLevel,
      failure: failure ?? this.failure,
      form: form ?? this.form,
      hidePassword: hidePassword ?? this.hidePassword,
      hidePasswordConfirm: hidePasswordConfirm ?? this.hidePasswordConfirm,
      isSendCode: isSendCode ?? this.isSendCode,
    );
  }

  @override
  List<Object> get props => [
        flowStateApp,
        resetPasswordStateLevel,
        failure,
        form,
        hidePassword,
        hidePasswordConfirm,
        isSendCode,
      ];
}

class FormResetPassword extends Equatable with FormzMixin {
  final EmailInput email;
  final String code;
  final PasswordInput password;
  final ConfirmPassword confirmPassword;
  final FormzSubmissionStatus status;

  const FormResetPassword({
    this.status = FormzSubmissionStatus.initial,
    this.email = const EmailInput.pure(),
    this.code = AppConstants.defaultEmptyString,
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
  });

  FormResetPassword copyWith({
    FormzSubmissionStatus? status,
    EmailInput? email,
    String? code,
    PasswordInput? password,
    ConfirmPassword? confirmPassword,
  }) {
    return FormResetPassword(
      status: status ?? this.status,
      email: email ?? this.email,
      code: code ?? this.code,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        code,
        password,
        confirmPassword,
      ];

  @override
  List<FormzInput> get inputs => [
        email,
        password,
        confirmPassword,
      ];
}
