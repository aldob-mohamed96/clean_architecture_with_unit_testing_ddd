import 'package:flutter/material.dart';
import '../export/export.dart';

sealed class AppConstants {
  AppConstants._();
  static const String assetTranslationsJson = 'assets/translations/';
  static const String envFileName = '.env';
  static const String version = 'V 1.0.0';
  static const String privacyUrl = 'https://www.google.com';

  //code verification
  static const int verificationCodeLength = 4;
  //loading widget parameter
  static const double strokeWidth = 4;
  static const Color backgroundCircularLoading = ColorManager.primaryColor;
  static const Color valueCircularLoading = ColorManager.whiteColor;

  //failure
  static const Failure unknownfailure = Failure(
      code: ResponseCode.unknownError, message: ResponseMessage.unknownError);
  // default value of primitive
  static const String defaultEmptyString = '';
  static const int defaultEmptyInteger = 0;
  static const double defaultEmptyDouble = 0;
  static const double defaultEmptyDoubleWithTwoDigit = 0;
  static const bool defaultEmptyBoolFalse = false;
  static const bool defaultEmptyBoolTrue = true;
  static const List<String> defaultEmptyListString = [];
  static const List defaultEmptyGenericList = [];
  static const Map defaultEmptyMap = {};

  //onBoarding screen
  static const int timeDelayOnBoardingScreen = 4;
  static const Duration timerDurationTick = Duration(seconds: 1);
  static const int timerDuration = 300;

//default core Setting theme ...
  static const String defaultThemeModeApp = 'light';
  static const String lightTheme = 'light';
  static const String darkTheme = 'dark';
  static const String systemTheme = 'system';
  static const ThemeMode defaultTheme = ThemeMode.light;
  static const ThemeMode theme = ThemeMode.light;

  //default core Setting language
  static const String defaultLanguageAppCode = 'ar';
  static const String arabicLanguageCode = 'ar';
  static const String englishLanguageCode = 'en';
  static const Locale englishLocal = Locale('en', '');
  static const Locale defaultLocal = Locale('ar', '');
  static const Locale arabicLocal = Locale('ar', '');
  static const Iterable<Locale> supportedLocales = [englishLocal, arabicLocal];

//default core Setting version
  static const String appVersion = '1.0.0';
  static const String iosVersion = '1.0.0';
  static const bool forceUpdateVersion = true;
  static const String enableVersion = '1';
  static const String appName = AppStrings.appName;

//scheme url launcher
  static const String androidAppUrlLauncher = 'market://details?id=';
  static const String iosAppUrlLauncher = 'https://apps.apple.com/us/app/';
  static const String telSchemeUrlLauncher = 'tel://';
  static const String mailSchemeUrlLauncher = 'mailto:';
  static const String linkSchemeUrlLauncher = 'https';

// link google map
  static const String googleMapUrl1 =
      'https://www.google.com/maps/search/?api=1&query=';
  static const String appleMapUrl = 'https://maps.apple.com/?sll=';

// image size camera and gallery picker
  static const double maxWidthImgPickerCamera = 1800;
  static const double maxWidthImgPickerGallery = 1800;
  static const int qualityImgPickerGallery =
      60; //quality in Percentage 0....100 %
  static const double maxHeightImgPickerCamera = 1800;
  static const double maxHeightImgPickerGallery = 1800;
  static const int qualityImgPickerCamera = 60;

// local Notification
  static const String appLocalNotificationAndroidIcon =
      '@mipmap/ic_launcher.png'; //app icon
  static const String appLocalNotificationAndroidSoundName = 'sound';
  static const String appLocalNotificationIosSoundName = 'sound.aiff';
  static const String appLocalNotificationAndroidTicker = 'ticker';
  static const String appLocalNotificationAndroidChannelId =
      'high_importance_channel';
  static const String appLocalNotificationAndroidChannelName = 'channel_name';
  static const String appLocalNotificationAndroidChannelDescription =
      'description';
  static const bool appLocalNotificationIosRequestAlertPermission = true;
  static const bool appLocalNotificationIosRequestBadgePermission = true;
  static const bool appLocalNotificationIosRequestSoundPermission = true;
  static const bool appLocalNotificationIosRequestVibrationPermission = true;

//location Setting
  //android Setting location
  static const String notificationTextForegroundAndroidLocation =
      AppStrings.notificationTextForegroundAndroidLocation;
  static const String notificationTitleForegroundAndroidLocation =
      AppStrings.notificationTitleForegroundAndroidLocation;
  static const bool enableWakeLockForegroundAndroidLocation = false;
  static const bool enableWifiLockForegroundAndroidLocation = false;
  static const String notificationIconForegroundAndroidLocation =
      '@mipmap/ic_launcher.png';
  static const bool enableForceLocationManagerAndroid = true;
  static const Duration intervalDurationLocationAndroid = Duration(seconds: 1);
  static const Duration timeLimitLocationAndroid = Duration(seconds: 1);
  static const int distanceFilterLocationAndroid = 100;

  //asset path json images sound

  static const String assetImagesPath = 'assets/img';
  static const String assetJsonPath = 'assets/json';

  static const String assetTranslationPath = 'assets/translations';

  //network data

  // ---------------------auth api extension urls---------------------
  static const String loginUrl = '/api/v1/auth/user/login';

  static const String sendDeviceToken = '/api/v1/auth/user/device-token';
  static const String registerUrl = '/api/v1/auth/user/register';
  static const String confirmEmailUrl = '/api/v1/auth/user/email/confirm';
  static const String forgetPasswordUrl = '/api/v1/auth/forgot/password';
  static const String changePasswordUrl = '/api/v1/auth/reset/password';
  static const String refreshTokenUrl = '/api/v1/auth/refresh';
  static const String logoutUrl = '/api/v1/auth/logout';

  static const List<String> urlwithoutAuthentication = [
    loginUrl,
    registerUrl,
    forgetPasswordUrl,
    changePasswordUrl,
    confirmEmailUrl,
  ];

  // ---------------------notification api extension urls---------------------
  static const String userNotificationUrl = '/api/v1/user-notification';
  static const String userNotificationReadingNotificationByIdUrlFirstExtension =
      '/api/v1/user-notification/';
  static const String
      userNotificationReadingNotificationByIdUrlSecondExtension = '/read';

  // ---------------------faqs api extension urls---------------------

  static const String faqsUrl = '/api/v1/faqs';
  static const String faqItemByIdUrl = '/api/v1/faqs/{id}';

  // ---------------------home us api extension urls---------------------
  static const String homeUrl = '/';

  // ---------------------wallets api extension urls---------------------
  static const String walletsUrl = '/api/v1/wallets/my-wallet';
  static const String walletDetailsUrls = '/api/v1/wallets/user/';

  // ---------------------Shipping Address api extension urls---------------------

  static const String shippingAddressUrl = '/api/v1/shipping-addresses';
  static const String shippingAddressItemByIdUrl =
      '/api/v1/shipping-addresses/';

  static const String myShippment = '/api/v1/shipments/my-shipments?';
  static const String shippingExteraPackageShippmentUrl =
      '/api/v1/shipping-extras';
  static const String updateShippmentRequestUrl =
      '/api/v1/shipments/user/shipment/';
  static const String confirmRequestAndSaveDataUrl = '/api/v1/shipping-request';

  // ---------------------Shipping Address api extension urls---------------------
}
