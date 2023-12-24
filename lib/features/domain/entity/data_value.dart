import 'package:flutter/material.dart';
import '../../../core/export/export.dart';




final class TokenData extends Equatable {
  final String token;
  final String refreshToken;
  final int tokenExpires;

  const TokenData(
     this.token,
     this.refreshToken,
     this.tokenExpires,
  );

  @override
  List<Object?> get props => [token, refreshToken, tokenExpires];
}

final class AppAuthenticationLevelData extends Equatable {
  final AppAuthenticationLevel value;
  const AppAuthenticationLevelData(this.value);

  @override
  List<Object?> get props => [value];
}

final class LocalAppData extends Equatable {
  final Locale value;
  const LocalAppData(this.value);

  @override
  List<Object?> get props => [value];
}

final class ThemeModeData extends Equatable {
  final ThemeMode value;
  const ThemeModeData(this.value);

  @override
  List<Object?> get props => [value];
}
