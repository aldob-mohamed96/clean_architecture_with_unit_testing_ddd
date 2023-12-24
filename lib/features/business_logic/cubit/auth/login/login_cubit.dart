

import '../../../../../core/export/export.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginCubit({
    required LoginUseCase loginUseCase,
  })  : _loginUseCase = loginUseCase,
        super(const LoginState());

  Future<void> login() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _loginUseCase(
        LoginRequest(state.form.email.value, state.form.password.value));
    await delayForCreateNewStatus();
    result.fold((failure) {
      emit(state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
    }, (userData) {
      emit(state.copyWith(
          flowStateApp: FlowStateApp.successLoggedIn, userData: userData));
    });
  }

  void changeEmail(String email) {
    final emailInput = EmailInput.dirty(email);
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal,
        form: state.form.copyWith(
          email: emailInput,
        )));
  }

  void changePassword(String password) {
    final passwordInput = PasswordInput.dirty(password);
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal,
        form: state.form.copyWith(
          password: passwordInput,
        )));
  }

  void changeHidePassword() {
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal, hidePassword: !state.hidePassword));
  }
}
