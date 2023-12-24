import 'package:flutter/material.dart';
import 'package:functional/core/export/export.dart';


final class AppAuthenticationLevelRequest {
  AppAuthenticationLevel appAuthenticationLevel;
  AppAuthenticationLevelRequest(this.appAuthenticationLevel);
}

final class ThemeModeAppReuest {
  final ThemeMode themeMode;
  ThemeModeAppReuest(this.themeMode);
}

final class TokenRequest {
  final String value;
  TokenRequest(this.value);
}

final class LocalAppRequest {
  final Locale value;
  LocalAppRequest(this.value);
}

final class IncreaseViewRequest {
  final String id;
  IncreaseViewRequest(this.id);
}

final class LoginRequest {
  final String email;
  final String password;
  LoginRequest(this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

final class RegisterRequest {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;
  RegisterRequest(
      this.email, this.password, this.firstName, this.lastName, this.phone);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
    };
  }
}

final class ForgetPasswordRequest {
  final String email;
  ForgetPasswordRequest(this.email);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

final class ConfirmEmailRequest {
  final String code;
  ConfirmEmailRequest(this.code);

  Map<String, dynamic> toJson() {
    return {
      'hash': code,
    };
  }
}

final class DeviceTokenRequest {
  final String token;
  DeviceTokenRequest(this.token);
  


  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}

final class ChangePasswordCodeRequest {
  final String password;
  final String code;
  ChangePasswordCodeRequest(this.password, this.code);

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'hash': code,
    };
  }
}

final class ResetPasswordCreatePasswordRequest {
  final String email;
  final String password;
  final String confirmPassword;
  ResetPasswordCreatePasswordRequest(
      this.email, this.password, this.confirmPassword);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}

final class PaginationRequest {
  final int page;
  final int limit;

  PaginationRequest(this.page, {this.limit = 10});

  PaginationRequest copyWith({
    int? page,
    int? limit,
  }) {
    return PaginationRequest(
      page ?? this.page,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
    };
  }
}

final class RequestWithId {
  final String id;

  RequestWithId(this.id);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}

/*
  "price": 120,
  "quantity": 4,
  "userDescription": "Description..."
*/
final class UpdateShippmentRequestWithId {
  final String id;
  final double price;
  final int quantity;
  final String userDescription;

  UpdateShippmentRequestWithId(
      this.id, this.price, this.quantity, this.userDescription);

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'quantity': quantity,
      'userDescription': userDescription,
    };
  }
}

final class ShippmentRequest {
  final bool shipped;
  final String shipmentMethod;

  ShippmentRequest(this.shipped, this.shipmentMethod);

  Map<String, dynamic> toJson() {
    return {
      'shipped': shipped,
      'shipmentMethod': shipmentMethod,
    };
  }
}

final class ShippmentRequestConfirmAndSaveData {
  final String city;
  final String address;
  final String phone;
  final bool payWithWallet;
  final List<String> shipmentsIds;
  final List<String> extraIds;

  ShippmentRequestConfirmAndSaveData(this.city, this.address, this.phone,
      this.payWithWallet, this.shipmentsIds, this.extraIds);

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'address': address,
      'shippingPhone': phone,
      'payWithWallet': payWithWallet,
      'shipmentsIds': shipmentsIds,
      'extraIds': extraIds,
    };
  }
}
final class RefershTokenRequest {
  final String token;

  RefershTokenRequest(this.token);

  Map<String, dynamic> toJson() {
    return {
      'Authorization': token.toBearerTokenStyle,
    };
  }
}