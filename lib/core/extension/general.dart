import 'package:flutter/material.dart';

import '../export/export.dart';




import 'package:flutter/material.dart';
import 'package:functional/core/export/export.dart';

extension OrientationExtension on Orientation {
  Orientation get toLandScape => Orientation.landscape;
  Orientation get toPortrait => Orientation.portrait;
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

extension FlutterSecureStorageEx on FlutterSecureStorage {
  Future<SuccessOperation> deleteAll() async =>
      await deleteAll().then((final value) => const SuccessOperation(true));

  Future<SuccessOperation> cash(
          {required final String key, required final String value}) async =>
      await write(key: key, value: value)
          .then((value) => const SuccessOperation(true));

  Future<SuccessOperation> delete({required String key}) async =>
      await delete(key: key).then((value) => const SuccessOperation(true));

  Future<String> get({required String key}) async =>
      await read(key: key) ?? AppConstants.defaultEmptyString;

  Future<SuccessOperation> cashSettings(
      SettingsApp settingsApp, String key) async {
    return await cash(key: key, value: settingsApp.convertToStorageData)
        .then((value) => const SuccessOperation(true))
        .catchError((error) {
      return const SuccessOperation(false);
    });
  }

  Future<SettingsApp> getSettings(String key) async {
    String value = await get(key: key);

    return value.isEmpty
        ? const SettingsApp().copyWith(
            authenticationSettings: const AuthenticationSettings(
            appAuthenticationLevel: AppAuthenticationLevel.draft,
          ))
        : SettingsApp.fromJson(jsonDecode(value));
  }

  Future<SuccessOperation> logout(SettingsApp setting, String key) async {
    return await cashSettings(setting, key);
  }
}

extension SharePrefEx on SharedPreferences {
  Future<SuccessOperation> cash(
          {required final String key, required final String value}) async =>
      await setString(key, value)
          .then((final value) => const SuccessOperation(true));

  Future<SuccessOperation> delete({required final String key}) async =>
      await remove(key).then((final value) => const SuccessOperation(true));

  String get({required final String key}) =>
      getString(key) ?? AppConstants.defaultEmptyString;
}

extension BlocLisensersEx on BlocListenerBase {}


// check network connection
extension NetworkInfoEx on Object {


  // check network connection
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
    on SocketException
    catch (_) {
      return false;
    }
  }
}
