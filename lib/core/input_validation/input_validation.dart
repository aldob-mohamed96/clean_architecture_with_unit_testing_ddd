
import '../export/export.dart';


class PasswordInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const PasswordInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const PasswordInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validatePassword(value!);
  }
}

class LinkInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const LinkInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const LinkInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateLink(value!);
  }
}

class NameInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const NameInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const NameInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateName(value!);
  }
}

/////////////////////////////////////////////////

class CounterInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const CounterInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const CounterInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateCounter(value!);
  }
}
class PriceInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const PriceInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const PriceInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validatePrice(value!);
  }
}


class ConfirmPassword
    extends FormzInput<List<String>, DataSourceValidationInput>
    with ValidationImpl {
  const ConfirmPassword.pure()
      : super.pure(const [
          AppConstants.defaultEmptyString,
          AppConstants.defaultEmptyString
        ]);
  const ConfirmPassword.dirty(
      [super.value = const [
        AppConstants.defaultEmptyString,
        AppConstants.defaultEmptyString
      ]])
      : super.dirty();

  @override
  DataSourceValidationInput? validator(List<String>? value) {
    return validateConfirmPassword(value!);
  }
}

class PhoneInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const PhoneInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const PhoneInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validatePhone(value!);
  }
}

class ImageInput extends FormzInput<File?, DataSourceValidationInput>
    with ValidationImpl {
  const ImageInput.pure() : super.pure(null);
  const ImageInput.dirty([value]) : super.dirty(value);

  @override
  DataSourceValidationInput? validator(File? value) {
    return null;
  }
}

class EmailInput extends FormzInput<String, DataSourceValidationInput>
    with ValidationImpl {
  const EmailInput.pure() : super.pure(AppConstants.defaultEmptyString);
  const EmailInput.dirty([value = AppConstants.defaultEmptyString])
      : super.dirty(value);

  @override
  DataSourceValidationInput? validator(String? value) {
    return validateEmail(value!);
  }
}
