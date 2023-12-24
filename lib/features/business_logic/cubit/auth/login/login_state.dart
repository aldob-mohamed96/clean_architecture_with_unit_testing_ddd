part of 'login_cubit.dart';

class LoginState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final UserData userData;
  final LoginForm form;
  final bool hidePassword;

  const LoginState({
    this.flowStateApp = FlowStateApp.draft,
    this.form = const LoginForm(),
    this.failure = const Failure(),
    this.userData = const UserData(),
    this.hidePassword = AppConstants.defaultEmptyBoolFalse,
  });

  LoginState copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    UserData? userData,
    LoginForm? form,
    bool? hidePassword,
  }) {
    return LoginState(
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      userData: userData ?? this.userData,
      form: form ?? this.form,
      hidePassword: hidePassword ?? this.hidePassword,
    );
  }

  @override
  List<Object> get props => [
        flowStateApp,
        failure,
        form,
        userData,
        hidePassword,
      ];
}

class LoginForm extends Equatable with FormzMixin {
  final EmailInput email;
  final PasswordInput password;
  final FormzSubmissionStatus status;

  const LoginForm({
    this.status = FormzSubmissionStatus.initial,
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  LoginForm copyWith({
    FormzSubmissionStatus? status,
    EmailInput? email,
    PasswordInput? password,
  }) {
    return LoginForm(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, email, password];

  @override
  List<FormzInput> get inputs => [email, password];
}
