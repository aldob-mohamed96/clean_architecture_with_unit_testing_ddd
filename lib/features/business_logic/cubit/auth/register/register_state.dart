part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final RegisterForm form;
  final bool hidePassword;
  final bool hideConfirmPassword;
  final bool isAgree;

  const RegisterState({
    this.flowStateApp = FlowStateApp.draft,
    this.form = const RegisterForm(),
    this.failure = const Failure(),
    this.isAgree = AppConstants.defaultEmptyBoolFalse,
    this.hideConfirmPassword = AppConstants.defaultEmptyBoolFalse,
    this.hidePassword = AppConstants.defaultEmptyBoolFalse,
  });

  RegisterState copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    RegisterForm? form,
    bool? hidePassword,
    bool? hideConfirmPassword,
    bool? isAgree,
  }) {
    return RegisterState(
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      form: form ?? this.form,
      hidePassword: hidePassword ?? this.hidePassword,
      hideConfirmPassword: hideConfirmPassword ?? this.hideConfirmPassword,
      isAgree: isAgree ?? this.isAgree,
    );
  }

  @override
  List<Object> get props => [
        flowStateApp,
        failure,
        form,
        isAgree,
        hideConfirmPassword,
        hidePassword,
      ];
}

class RegisterForm extends Equatable with FormzMixin {
  final EmailInput email;
  final PasswordInput password;
  final ConfirmPassword confirmPassword;
  final NameInput firstName;
  final NameInput lastName;
  final PhoneInput phone;
  final FormzSubmissionStatus status;

  const RegisterForm({
    this.status = FormzSubmissionStatus.initial,
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.firstName = const NameInput.pure(),
    this.lastName = const NameInput.pure(),
    this.phone = const PhoneInput.pure(),
  });

  RegisterForm copyWith({
    FormzSubmissionStatus? status,
    EmailInput? email,
    PasswordInput? password,
    ConfirmPassword? confirmPassword,
    NameInput? firstName,
    NameInput? lastName,
    PhoneInput? phone,
  }) {
    return RegisterForm(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        password,
        confirmPassword,
        firstName,
        lastName,
        phone,
      ];

  @override
  List<FormzInput> get inputs => [
        email,
        password,
        confirmPassword,
        firstName,
        lastName,
        phone,
      ];
}
