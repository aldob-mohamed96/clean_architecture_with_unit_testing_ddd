import '../../../../../core/export/export.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;
  final ForgetPasswordUseCase _forgetPasswordUseCase;

  ResetPasswordCubit({
    required ChangePasswordUseCase changePasswordUseCase,
    required ForgetPasswordUseCase forgetPasswordUseCase,
  })  : _changePasswordUseCase = changePasswordUseCase,
        _forgetPasswordUseCase = forgetPasswordUseCase,
        super(const ResetPasswordState());

  void changeEmail(String email) {
    final emailInput = EmailInput.dirty(email);
    emit(state.copyWith(
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        email: emailInput,
      ),
    ));
  }

  void returnToEnterEmail() {
    emit(state.copyWith(
      flowStateApp: FlowStateApp.normal,
      resetPasswordStateLevel: ResetPasswordStateLevel.darft,
    ));
  }

  Future<void> resendCode() async {
    emit(state.copyWith(
      flowStateApp: FlowStateApp.loading,
    ));

    await _forgetPasswordUseCase(ForgetPasswordRequest(state.form.email.value))
        .then((value) {
      value.fold(
        (failure) {
          emit(state.copyWith(
            flowStateApp: FlowStateApp.error,
            failure: failure,
          ));
        },
        (success) {
          emit(state.copyWith(
            flowStateApp: FlowStateApp.success,
            resetPasswordStateLevel: ResetPasswordStateLevel.enterCode,
          ));
        },
      );
    });
  }

  void verifyCode() {
    if (state.form.code.length != 6) {
      return;
    }
    emit(state.copyWith(
      flowStateApp: FlowStateApp.loading,
    ));
    delayForCreateNewStatus(second: 1);
    emit(state.copyWith(
      flowStateApp: FlowStateApp.success,
      resetPasswordStateLevel: ResetPasswordStateLevel.enterNewPassword,
    ));
  }

  Future<void> sendCode() async {
    emit(state.copyWith(
      flowStateApp: FlowStateApp.loading,
    ));

    await _forgetPasswordUseCase(ForgetPasswordRequest(state.form.email.value))
        .then((value) {
      value.fold(
        (failure) {
          emit(state.copyWith(
            flowStateApp: FlowStateApp.error,
            failure: failure,
          ));
        },
        (success) {
          emit(state.copyWith(
            flowStateApp: FlowStateApp.success,
            resetPasswordStateLevel: ResetPasswordStateLevel.enterCode,
          ));
        },
      );
    });
  }

  void changeHidePassword() {
    emit(state.copyWith(
      flowStateApp: FlowStateApp.normal,
      hidePassword: !state.hidePassword,
    ));
  }

  void changeHidePasswordConfirm() {
    emit(state.copyWith(
      flowStateApp: FlowStateApp.normal,
      hidePasswordConfirm: !state.hidePasswordConfirm,
    ));
  }

  void changeCode(String code) {
    emit(state.copyWith(
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        code: code,
      ),
    ));
  }

  void changePassword(String password) {
    final passwordInput = PasswordInput.dirty(password);
    emit(state.copyWith(
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        password: passwordInput,
      ),
    ));
  }

  void changeConfirmPassword(String confirmPassword) {
    final confirmPasswordInput =
        ConfirmPassword.dirty([confirmPassword, state.form.password.value]);
    emit(state.copyWith(
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        confirmPassword: confirmPasswordInput,
      ),
    ));
  }

  Future<void> resetPassword() async {
    emit(state.copyWith(
      flowStateApp: FlowStateApp.loading,
    ));

    await _changePasswordUseCase(ChangePasswordCodeRequest(
      state.form.password.value,
      state.form.code,
    )).then((value) {
      value.fold(
        (failure) {
          emit(state.copyWith(
            flowStateApp: FlowStateApp.error,
            failure: failure,
          ));
        },
        (success) {
          emit(state.copyWith(
            flowStateApp: FlowStateApp.success,
            resetPasswordStateLevel:
                ResetPasswordStateLevel.successCreateNewPassword,
          ));
        },
      );
    });
  }
}
