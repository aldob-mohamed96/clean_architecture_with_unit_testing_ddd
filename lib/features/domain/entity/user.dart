import '../../../core/export/export.dart';


class UserData extends Equatable {
  final String token;
  final int tokenExpires;
  final String refreshToken;
  final UserInfo userInfo;

  const UserData({
    this.token = AppConstants.defaultEmptyString,
    this.tokenExpires = AppConstants.defaultEmptyInteger,
    this.refreshToken = AppConstants.defaultEmptyString,
    this.userInfo = const UserInfo(),
  });

  UserData copyWith({
    String? token,
    int? tokenExpires,
    String? refreshToken,
    UserInfo? userInfo,
  }) {
    return UserData(
      token: token ?? this.token,
      tokenExpires: tokenExpires ?? this.tokenExpires,
      refreshToken: refreshToken ?? this.refreshToken,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  //isempty
  bool get isEmpty => this == const UserData();
  bool get isNotEmpty => this != const UserData();

  bool get isTokenEmpty => token.isEmpty;
  bool get isTokenNotEmpty => token.isNotEmpty;

  bool get isTokenExpired =>
      tokenExpires <= DateTime.now().millisecondsSinceEpoch;
  bool get isTokenNotExpired =>
      tokenExpires > DateTime.now().millisecondsSinceEpoch;

  bool get isTokenExpiresEmpty =>
      tokenExpires == AppConstants.defaultEmptyInteger;
  bool get isTokenExpiresNotEmpty =>
      tokenExpires != AppConstants.defaultEmptyInteger;

  bool get isRefreshTokenEmpty => refreshToken.isEmpty;
  bool get isRefreshTokenNotEmpty => refreshToken.isNotEmpty;

  bool get isUserInfoEmpty => userInfo == const UserInfo();

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json['token'] as String,
      tokenExpires: json['tokenExpires'] as int,
      refreshToken: json['refreshToken'] as String,
      userInfo: UserInfo.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'tokenExpires': tokenExpires,
      'refreshToken': refreshToken,
      'user': userInfo.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        token,
        tokenExpires,
        refreshToken,
        userInfo,
      ];
}

class UserInfo extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final double blanace;
  final bool emailIsConfirmed;
  final String address;
  final String descriptionAddress;
  final String photo;
  final String about;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;
  final Role role;
  final Status status;

  const UserInfo({
    this.id = AppConstants.defaultEmptyInteger,
    this.emailIsConfirmed = AppConstants.defaultEmptyBoolFalse,
    this.phone = '+218 91-2345678',
    this.firstName = 'مثال :  عبد الله',
    this.lastName = 'احمد',
    this.email = 'info@example.com',
    this.password = AppConstants.defaultEmptyString,
    this.blanace = AppConstants.defaultEmptyDouble,
    this.address = AppConstants.defaultEmptyString,
    this.descriptionAddress = AppConstants.defaultEmptyString,
    this.photo = AppConstants.defaultEmptyString,
    this.about = AppConstants.defaultEmptyString,
    this.createdAt = AppConstants.defaultEmptyString,
    this.updatedAt = AppConstants.defaultEmptyString,
    this.deletedAt = AppConstants.defaultEmptyString,
    this.role = const Role(),
    this.status = const Status(),
  });

  UserInfo copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    double? blanace,
    String? phone,
    bool? emailIsConfirmed,
    String? address,
    String? descriptionAddress,
    String? photo,
    String? about,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    Role? role,
    Status? status,
  }) {
    return UserInfo(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      blanace: blanace ?? this.blanace,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      emailIsConfirmed: emailIsConfirmed ?? this.emailIsConfirmed,
      address: address ?? this.address,
      descriptionAddress: descriptionAddress ?? this.descriptionAddress,
      photo: photo ?? this.photo,
      about: about ?? this.about,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      role: role ?? this.role,
      status: status ?? this.status,
    );
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      blanace: json['blanace'] as double,
      phone: json['phone'] as String,
      emailIsConfirmed: json['emailIsConfirmed'] as bool,
      address: json['address'] as String,
      descriptionAddress: json['descriptionAddress'] as String,
      photo: json['photo'] as String,
      about: json['about'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String,
      role: Role.fromJson(json['role'] as Map<String, dynamic>),
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'blanace': blanace,
      'phone': phone,
      'emailIsConfirmed': emailIsConfirmed,
      'address': address,
      'descriptionAddress': descriptionAddress,
      'photo': photo,
      'about': about,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'role': role.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        password,
        phone,
        emailIsConfirmed,
        blanace,
        address,
        descriptionAddress,
        photo,
        about,
        createdAt,
        updatedAt,
        deletedAt,
        role,
        status,
      ];
}

class Role extends Equatable {
  final int id;
  final String name;

  const Role({
    this.id = AppConstants.defaultEmptyInteger,
    this.name = AppConstants.defaultEmptyString,
  });

  Role copyWith({
    int? id,
    String? name,
  }) {
    return Role(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class Status extends Equatable {
  final int id;
  final String name;

  const Status({
    this.id = AppConstants.defaultEmptyInteger,
    this.name = AppConstants.defaultEmptyString,
  });

  Status copyWith({
    int? id,
    String? name,
  }) {
    return Status(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
