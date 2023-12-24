
import '../export/export.dart';



mixin ValidationImpl {
  DataSourceValidationInput? validatePhone(String? phone) {
      RegExp regExp = RegExp(r'^(91|92|94|95)\d{7}$');
    if (phone == null || phone.isEmpty) {
      return DataSourceValidationInput.empty;
    } else if (!regExp.hasMatch(phone)) 
    {
      return DataSourceValidationInput.usernameStyle;
    }
    return null;
  }
}

DataSourceValidationInput? validateImage(File? imagePath) {
  if (imagePath == null) {
    return DataSourceValidationInput.inValidImg;
  } else if (imagePath.path.isEmpty) {
    return DataSourceValidationInput.inValidImg;
  }
  //end with image ext ios ext img

  else if (!imagePath.path.endsWith('.jpg') &&
      !imagePath.path.endsWith('.png') &&
      !imagePath.path.endsWith('.jpeg') &&
      !imagePath.path.endsWith('.gif') &&
      !imagePath.path.endsWith('.bmp')) {
    return DataSourceValidationInput.inValidImg;
  }

  return null;
}

DataSourceValidationInput? validateName(String? name) {
  if (name == null || name.length < 3) {
    return DataSourceValidationInput.length;
  }
  return null;
}

DataSourceValidationInput? validateLink(String? value) {
  var urlPattern =
      r'(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?';
  var match = RegExp(urlPattern, caseSensitive: false);
  if (value == null) {
    return DataSourceValidationInput.inValidFormat;
  } else if (!match.hasMatch(value)) {
    return DataSourceValidationInput.inValidFormat;
  }
  return null;
}

DataSourceValidationInput? validateCounter(String? counter) {
  if (counter == null || counter.isEmpty) {
    return DataSourceValidationInput.empty;
  } else if (int.tryParse(counter) == null) {
    return DataSourceValidationInput.inValidFormat;
  }

  return null;
}
DataSourceValidationInput? validatePrice(String? counter) {
  if (counter == null || counter.isEmpty) {
    return DataSourceValidationInput.empty;
  } else if (double.tryParse(counter) == null) {
    return DataSourceValidationInput.inValidFormat;
  }

  return null;
}


DataSourceValidationInput? validateConfirmPassword(List<String>? list) {
  if (list == null || list.isEmpty) {
    return DataSourceValidationInput.notIdenticalPassword;
  }
  if (list.length == 2) {
    if (list[0] != list[1]) {
      return DataSourceValidationInput.notIdenticalPassword;
    }
  }

  return null;
}


DataSourceValidationInput? validateEmail(String? email) {
  final exp = RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (email == null || email.isEmpty) {
    return DataSourceValidationInput.empty;
  }
  if (!exp.hasMatch(email)) {
    return DataSourceValidationInput.notEmail;
  }
  return null;
}

DataSourceValidationInput? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return DataSourceValidationInput.empty;
  }
  if (password.length < 5) {
    return DataSourceValidationInput.shortPassword;
  }
  if (password.length > 25) {
    return DataSourceValidationInput.veryLong;
  }
  return null;
}
