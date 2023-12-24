import '../../../../../core/export/export.dart';

abstract interface class RunTimeCashed {
  //cash data in map with key and value with time
  Future<SuccessOperation> cashData(
      {required String key, required String value, required int time});
}

class RunTimeCashedImpl implements RunTimeCashed {
  final Map<String, dynamic> _map = {};

  @override
  Future<SuccessOperation> cashData(
      {required String key, required String value, required int time}) async {
    _map[key] = value;
    await Future.delayed(Duration(seconds: time));
    _map.remove(key);
    return const SuccessOperation(true);
  }
}
