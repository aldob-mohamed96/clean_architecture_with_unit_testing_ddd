import '../../../../../core/export/export.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;
  RegisterCubit({
    required RegisterUseCase registerUseCase,
  })  : _registerUseCase = registerUseCase,
        super(const RegisterState());

  void changeEmail(String value) {
    final email = EmailInput.dirty(value);
    emit(state.copyWith(
      failure: const Failure(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        email: email,
      ),
    ));
  }

  void changeFristName(String value) {
    final firstName = NameInput.dirty(value);
    emit(state.copyWith(
      failure: const Failure(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        firstName: firstName,
      ),
    ));
  }

  void changeNickName(String value) {
    final nickName = NameInput.dirty(value);
    emit(state.copyWith(
      failure: const Failure(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        lastName: nickName,
      ),
    ));
  }

  void changePassword(String value) {
    final password = PasswordInput.dirty(value);
    emit(state.copyWith(
      failure: const Failure(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        password: password,
      ),
    ));
  }

  void changeConfirmPassword(String value) {
    final confirmPassword =
        ConfirmPassword.dirty([value, state.form.password.value]);
    emit(state.copyWith(
      failure: const Failure(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        confirmPassword: confirmPassword,
      ),
    ));
  }

  void changePhone(String value) {
    final phone = PhoneInput.dirty(value);
    emit(state.copyWith(
      failure: const Failure(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        phone: phone,
      ),
    ));
  }

  void changeAgreePrivacyOrDisAgree() {
    emit(state.copyWith(
      failure: const Failure(),
      flowStateApp: FlowStateApp.normal,
      isAgree: !state.isAgree,
    ));
  }

  void changeHidePassword() {
    emit(state.copyWith(
      failure: const Failure(),
      flowStateApp: FlowStateApp.normal,
      hidePassword: !state.hidePassword,
    ));
  }

  void changeHideConfirmPassword() {
    emit(state.copyWith(
      failure: const Failure(),
      flowStateApp: FlowStateApp.normal,
      hideConfirmPassword: !state.hideConfirmPassword,
    ));
  }

  Future<void> register() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));

    final result = await _registerUseCase(
      RegisterRequest(
        state.form.email.value,
        state.form.password.value,
        state.form.firstName.value,
        state.form.lastName.value,
        state.form.phone.value,
      ),
    );
    await delayForCreateNewStatus();
    result.fold(
      (failure) {
        emit(state.copyWith(
          failure: failure,
          flowStateApp: FlowStateApp.error,
        ));
      },
      (success) {
        emit(state.copyWith(
          failure: const Failure(),
          flowStateApp: FlowStateApp.successRegisted,
        ));
      },
    );
  }
}
