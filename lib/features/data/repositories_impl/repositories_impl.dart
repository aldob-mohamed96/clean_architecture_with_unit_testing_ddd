
import '/core/export/export.dart';



class RepositoryImpl implements IRepository {
  // ignore: unused_field
  final IRemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  RepositoryImpl(
      {required IRemoteDataSource remoteDataSource,
      required LocalDataSource localDataSource})
      : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;
  @override
  Future<Either<Failure, T>> getRemoteBaseFunction<T>(
      Future<Either<Failure, T>> Function() function) async {
    if (await isConnected) {
      try {
        return function.call();
      } catch (error) {
        return Left(ExceptionHandling.handleError(error).failure);
      }
    } else {
      return Left(DataSourceNetworkError.noInternetConnection.getFailure());
    }
  }
  @override
  Future<Either<Failure, T>> getLocalBaseFunction<T>(
      Future<Either<Failure, T>> Function() function) async {
    try {
      return function.call();
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> cashAppSttings(
      SettingsApp settingsApp) async {
    return getLocalBaseFunction(() async {
      return Right(await _localDataSource.cashAppSttings(settingsApp));
    });
  }

  @override
  Future<Either<Failure, SettingsApp>> getAppSettings() async {
    return getLocalBaseFunction(() async {
      return Right(await _localDataSource.getAppSettings());
    });
  }

  @override
  Future<Either<Failure, SuccessOperation>> logout(SettingsApp setting) async {
    return await getRemoteBaseFunction(() async {
      final response = await _remoteDataSource.logout();

      if (response.status.operationSucceeded()) {
        await _localDataSource.logout(setting);
        return const Right(SuccessOperation(true));
      } else {
        return Left(ApiException.handleApiError(response.errors).failure);
      }
    });
  }

  //notification

  @override
  Future<Either<Failure, NotificationData>> getNotifications(
      PaginationRequest paginationRequest) async {
    return getRemoteBaseFunction(() async {
      final response =
          await _remoteDataSource.getNotifications(paginationRequest);
      if (response.status.operationSucceeded()) {
        return Right(response.toDomain());
      } else {
        return Left(ApiException.handleApiError(response.errors).failure);
      }
    });
  }

  @override
  Future<Either<Failure, UserData>> login(LoginRequest loginRequest) async {
    return getRemoteBaseFunction(() async {
      final response = await _remoteDataSource.login(loginRequest);

      if (response.status.operationSucceeded()) {
        await sendDeviceToken();

        final userData = response.toDomain();

        await _localDataSource.cashUserAppSttings(userData);

        return Right(userData);
      } else {
        return Left(ApiException.handleApiError(response.errors).failure);
      }
    });
  }

  @override
  Future<Either<Failure, SuccessOperation>> register(
      RegisterRequest registerRequest) async {
    return getRemoteBaseFunction(() async {
      final response = await _remoteDataSource.register(registerRequest);
      if (response.status.operationSucceeded()) {
        return const Right(SuccessOperation(true));
      } else {
        return Left(ApiException.handleApiError(response.errors).failure);
      }
    });
  }

  @override
  Future<Either<Failure, SuccessOperation>> confirmEmail(
      ConfirmEmailRequest confirmEmailRequest) async {
    return getRemoteBaseFunction(() async {
       final response =
            await _remoteDataSource.confirmEmail(confirmEmailRequest);
        if (response.status.operationSucceeded()) {
          return const Right(SuccessOperation(true));
        } else {
          return Left(ApiException.handleApiError(response.errors).failure);
        }
    });
  }

  @override
  Future<Either<Failure, TokenData>> refreshToken(RefershTokenRequest refershTokenRequest) async {
    return getRemoteBaseFunction(() async {
     final response = await _remoteDataSource.refreshToken(refershTokenRequest);
        if (response.status.operationSucceeded()) {
          return  Right(response.toDomain());
        } else {
          return Left(ApiException.handleApiError(response.errors).failure);
        }
    });
  }

  @override
  Future<Either<Failure, SuccessOperation>> sendDeviceToken() async {
    return getRemoteBaseFunction(() async {
        final token = await _getTokenFirbase();
        final response =
            await _remoteDataSource.sendDeviceToken(DeviceTokenRequest(token));
        if (response.status.operationSucceeded()) {
          return const Right(SuccessOperation(true));
        } else {
          return Left(ApiException.handleApiError(response.errors).failure);
        }
    });
  }

  @override
  Future<Either<Failure, SuccessOperation>> changePassword(
      ChangePasswordCodeRequest resetPasswordCodeRequest) async {
    return getRemoteBaseFunction(() async {
        final response =
            await _remoteDataSource.changePassword(resetPasswordCodeRequest);
        if (response.status.operationSucceeded()) {
          return const Right(SuccessOperation(true));
        } else {
          return Left(ApiException.handleApiError(response.errors).failure);
        }
    });
  }

  @override
  Future<Either<Failure, SuccessOperation>> forgetPassword(
      ForgetPasswordRequest resetPasswordRequest) async {
    return getRemoteBaseFunction(() async {
        final response =
            await _remoteDataSource.forgetPassword(resetPasswordRequest);
        if (response.status.operationSucceeded()) {
          return const Right(SuccessOperation(true));
        } else {
          return Left(ApiException.handleApiError(response.errors).failure);
        }
    });
  }

  Future<String> _getTokenFirbase() async {
    if (Platform.isIOS ) {
      String? apnToken = await FirebaseMessaging.instance.getAPNSToken();
      if (apnToken != null) {
        return await FirebaseMessaging.instance.getToken() ??
            AppConstants.defaultEmptyString;
      }
    } else if (Platform.isAndroid) {
      String? token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        return token;
      }
    }

    return AppConstants.defaultEmptyString;
  }
}
