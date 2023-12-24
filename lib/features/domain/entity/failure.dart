import '../../../core/export/export.dart';


final class Failure extends Equatable implements Exception {
  final int code;
  final String message;
  const Failure(
      {this.code = ResponseCode.unknownError,
      this.message = ResponseMessage.unknownError});

  @override
  List<Object?> get props => [code, message];
}
