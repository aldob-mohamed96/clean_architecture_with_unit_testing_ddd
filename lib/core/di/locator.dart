
import '../export/export.dart';

final instance = GetIt.instance;
Future<void> initAppServicesGetIt() async {
  //------------------------- logger---------------------------------//

  await loggerAppData();

  //********************************  end logger ***************************//
  //------------------------- env---------------------------------//
  final networkEnv = await getNetWorkEnvMetaData();
  //********************************  end env ***************************//

  //------------------------- firebase---------------------------------//

  await firebaseModule(networkEnv);

  //********************************  end firebase ***************************//

  //------------------------- local storage---------------------------------//

  await localStorage(networkEnv);
  await secureStrage();
  //********************************  end local storage ***************************//

  //------------------------- network factory---------------------------------//
  final dio = await getDio(networkEnv);

  //********************************  end network factory ***************************//

  //-------------------------AppServiceApiClient---------------------------------
  await apiServiceClient(dio, networkEnv);
  //********************************  end AppServiceApiClient ***************************//
  //-------------------------ShowMessage---------------------------------

  await showDialogAndSnackbar();

  //********************************  end ShowMessage ***************************//

  //-------------------------DataSources---------------------------------//

  await dataSources();

  //********************************  end DataSources ***************************//

  //-------------------------Repository---------------------------------

  await repository();

  //********************************  end Repository ***************************//

  //-------------------------SettingApp---------------------------------

  await settingApp();

  //********************************  end SettingApp ***************************//

  //-------------------------Notification---------------------------------

  await notifications();

  //********************************  end Notification ***************************//

  //-------------------------Router---------------------------------

  await getRouter();

  //********************************  end Router ***************************//
}

Future<void> showDialogAndSnackbar() async {
  instance.registerLazySingleton<IShowAlertMessage>(ShowAlertMessageImpl.new);
}

Future<void> loggerAppData() async {
  instance.registerLazySingleton<LoggerData>(() => LoggerDataImpl());
}

Future<void> settingApp() async {
  instance.registerLazySingleton<GetSettingsApp>(
      () => GetSettingsApp(repository: instance()));
  instance.registerLazySingleton<CashSettingApp>(
      () => CashSettingApp(repository: instance()));
  instance.registerLazySingleton<Logout>(() => Logout(repository: instance()));
  instance.registerLazySingleton<ThemeManager>(ThemeManagerImpl.new);
//AppLocalizationsImpl

  instance.registerLazySingleton<SettingsAppCubit>(() => SettingsAppCubit(
      getSettingsApp: instance(),
      cashSettingApp: instance(),
      logout: instance(),
      themeManager: instance()));
}

Future<void> localStorage(NetWorkEnvMetaData netWorkEnvMetaData) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton(() => sharedPreferences);
  instance.registerLazySingleton<LocalStroagePreferances>(() =>
      LocalStroagePreferancesImpl(
          netWorkEnvMetaData: netWorkEnvMetaData,
          sharedPreferences: instance(),
          secureStorage: instance()));
}

Future<Dio> getDio(NetWorkEnvMetaData netWorkEnvMetaData) async {
  instance.registerLazySingleton<IDioFactory>(() => DioFactoryImpl(
      netWorkEnvMetaData: netWorkEnvMetaData, appPreferences: instance()));
  return await instance<IDioFactory>().getDio();
}

Future<void> apiServiceClient(
    Dio dio, NetWorkEnvMetaData netWorkEnvMetaData) async {
  instance.registerLazySingleton<IAppServiceApiClient>(
      () => IAppServiceApiClient(dio, baseUrl: netWorkEnvMetaData.baseUrls));
}

Future<void> dataSources() async {
  instance.registerLazySingleton<IRemoteDataSource>(
      () => RemoteDataSourceImpl(appServiceApiClient: instance()));
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(appPreferences: instance()));
}

Future<void> repository() async {
  instance.registerLazySingleton<IRepository>(() => RepositoryImpl(
      localDataSource: instance(), remoteDataSource: instance()));
}

Future<void> secureStrage() async {
  AndroidOptions getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
      keyCipherAlgorithm:
          KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_CBC_PKCS7Padding);
  IOSOptions getIOSOptions() => const IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
      synchronizable: true);
  instance.registerLazySingleton<FlutterSecureStorage>(() =>
      FlutterSecureStorage(
          iOptions: getIOSOptions(), aOptions: getAndroidOptions()));
}

Future<NetWorkEnvMetaData> getNetWorkEnvMetaData() async {
  instance.registerLazySingleton<EnvMetaData>(EnvMetaDataImpl.new);

  final netWorkEnvMetaData = await instance<EnvMetaData>().getNetworkMetaData();

  instance.registerLazySingleton<NetWorkEnvMetaData>(() => netWorkEnvMetaData);
  return netWorkEnvMetaData;
}

Future<void> notifications() async {
  instance.registerLazySingleton<GetNotificationsUseCase>(
      () => GetNotificationsUseCase(repository: instance()));
  instance.registerLazySingleton<NotificationCubit>(
      () => NotificationCubit(getNotificationsUseCase: instance()));
}

// router
Future<void> getRouter() async {
  instance.registerLazySingleton<AppRouter>(AppRouterImpl.new);
}

Future<void> loginModule() async {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(repository: instance()));
  }
  if (!GetIt.I.isRegistered<LoginCubit>()) {
    instance.registerFactory<LoginCubit>(() => LoginCubit(
          loginUseCase: instance(),
        ));
  }
}

Future<void> registerModule() async {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(
        () => RegisterUseCase(repository: instance()));
  }
  if (!GetIt.I.isRegistered<RegisterCubit>()) {
    instance.registerFactory<RegisterCubit>(() => RegisterCubit(
          registerUseCase: instance(),
        ));
  }
}

Future<void> resetPasswordModule() async {
  if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
    instance.registerFactory<ForgetPasswordUseCase>(
        () => ForgetPasswordUseCase(repository: instance()));
  }
  if (!GetIt.I.isRegistered<ChangePasswordUseCase>()) {
    instance.registerFactory<ChangePasswordUseCase>(
        () => ChangePasswordUseCase(repository: instance()));
  }

  if (!GetIt.I.isRegistered<ResetPasswordCubit>()) {
    instance.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(
          forgetPasswordUseCase: instance(),
          changePasswordUseCase: instance(),
        ));
  }
}

// firebase
Future<void> firebaseModule(NetWorkEnvMetaData netWorkEnvMetaData) async {
  instance.registerLazySingleton<IFirebaseSettings>(() => FirebaseSettingsImpl()
        ..firebaseInitizalize()
        ..listenNotification()
        ..listenNotificationBackground());
}


Future<GetRefershTokenUseCase> refreshTokenModule() async {
  if (!GetIt.I.isRegistered<GetRefershTokenUseCase>()) {
    instance.registerFactory<GetRefershTokenUseCase>(() => GetRefershTokenUseCase(repository: instance()));
  }

  return instance();
}