import '../export/export.dart';

abstract interface class IFirebaseSettings {
  Future<void> firebaseInitizalize();

  // listen notification
  void listenNotification();
  // listen notification background
  void listenNotificationBackground();
}

class FirebaseSettingsImpl implements IFirebaseSettings {
  FirebaseSettingsImpl();

  @override
  Future<void> firebaseInitizalize() async {
    if (Platform.isIOS) {
      await Firebase.initializeApp(
        name: DefaultFirebaseOptions.currentPlatform.projectId,
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // request permission android
      await FirebaseMessaging.instance.requestPermission(
          sound: true, badge: true, alert: true, provisional: false);

      instance.registerLazySingleton<LocalNotification>(
          () => LocalNotificationImpl()..initializeLocalNotificationSetting());
    }
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // request permission android
      await FirebaseMessaging.instance.requestPermission(
          sound: true, badge: true, alert: true, provisional: false);

      instance.registerLazySingleton<LocalNotification>(
          () => LocalNotificationImpl()..initializeLocalNotificationSetting());
    }
  }

  @override
  void listenNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) =>
        instance<NotificationCubit>().showNotification);
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) =>
        instance<NotificationCubit>().showNotification);
  }

  @override
  void listenNotificationBackground() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _firebaseMessagingBackgroundHandler(
          RemoteMessage message) async =>
      instance<NotificationCubit>().showNotification;
}

Future<void> listenForbackgroundNotificationModule() async {
  instance<IFirebaseSettings>().listenNotificationBackground();
}
