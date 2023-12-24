import '../export/export.dart';

abstract interface class LoggerData {
  void logData(String data, {LogLevel level = LogLevel.error});
}

// Compare this snippet from lib/features/domain/usecases/usecases.dart:
// import 'package:dartz/dartz.dart';
class LoggerDataImpl implements LoggerData {
  LoggerDataImpl({required});
  @override
  void logData(String data, {LogLevel level = LogLevel.error}) {
    String datetime='${DateTime.now().day.toString()}-${DateTime.now().month.toString()}-${DateTime.now().year.toString()} ${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}:${DateTime.now().second.toString()}'; 
    ''''
    =========$datetime ============ Type is  ${level.toString()}  ========== =====================
    #                                                                                            #
    #        $data                                                                               #
    #                                                                                            #
    =-=-=-=-=-=-=-=-=-= End LOG DATA =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   
     ''';
  }
}

