

import 'package:flutter/material.dart';

import '../export/export.dart';


abstract class LoadFileAsset {
  Future<Either<Unit, Map<String, String>>> loadJsonFileFromAsset(String path);
}

class LoadFileAssetImpl implements LoadFileAsset {
  @override
  Future<Either<Unit, Map<String, String>>> loadJsonFileFromAsset(
      String path) async {
    try {
      final data = await _loadJsonFileAsString(path);
      final map = _convertToMap(data);
      return Right(map);
    } catch (error) {
      return const Left(unit);
    }
  }

  Map<String, String> _convertToMap(String content) =>
      json.decode(content).map<String, String>(
          (key, value) => MapEntry(key.toString(), value.toString()));

  Future<String> _loadJsonFileAsString(String path) async =>
      await rootBundle.loadString(path);
}

String trans(BuildContext context, String key) {
  return AppLocalizationsImpl.of(context).translate(key);
}

final logger = instance<LoggerData>();

String convertDigitsToLatin(String value) {
  var sb = StringBuffer();
  for (var i = 0; i < value.length; i++) {
    switch (value[i]) {
      //Persian digits
      case '\u06f0':
        sb.write('0');
        break;
      case '\u06f1':
        sb.write('1');
        break;
      case '\u06f2':
        sb.write('2');
        break;
      case '\u06f3':
        sb.write('3');
        break;
      case '\u06f4':
        sb.write('4');
        break;
      case '\u06f5':
        sb.write('5');
        break;
      case '\u06f6':
        sb.write('6');
        break;
      case '\u06f7':
        sb.write('7');
        break;
      case '\u06f8':
        sb.write('8');
        break;
      case '\u06f9':
        sb.write('9');
        break;

      //Arabic digits
      case '\u0660':
        sb.write('0');
        break;
      case '\u0661':
        sb.write('1');
        break;
      case '\u0662':
        sb.write('2');
        break;
      case '\u0663':
        sb.write('3');
        break;
      case '\u0664':
        sb.write('4');
        break;
      case '\u0665':
        sb.write('5');
        break;
      case '\u0666':
        sb.write('6');
        break;
      case '\u0667':
        sb.write('7');
        break;
      case '\u0668':
        sb.write('8');
        break;
      case '\u0669':
        sb.write('9');
        break;
      default:
        sb.write(value[i]);
        break;
    }
  }
  return sb.toString();
}

//
//typedef Future waitSconeds () = await Future.delayed(Duration.zero);
//
Future<void> delayForCreateNewStatus({int second = AppValue.appValue0}) async =>
    await Future.delayed(Duration(seconds: second));

String getWhatsAppOrLink(String value) {
  if (Platform.isAndroid && value.startsWith('09') && value.length == 10) {
    return "whatsapp://send?phone=+218${value.substring(1)}&text=''";
  } else if (Platform.isIOS && value.startsWith('09') && value.length == 10) {
    return "https://wa.me/+218${value.substring(1)}?text=''";
  }
  return value;
}

Duration duration(int second) => Duration(milliseconds: second);
