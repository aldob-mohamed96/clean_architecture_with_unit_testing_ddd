// ignore: depend_on_referenced_packages


import '../../../../core/export/export.dart';

part 'response.g.dart';

@JsonSerializable(createToJson: false)
class BaseResponse {
  
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;
 
  @JsonKey(name: 'errors')
  dynamic errors;

  BaseResponse({
    this.status,
    this.message,
    this.errors,
  });

  BaseResponse fromData(
    int? status,
    String? message,
    dynamic data,
    dynamic errors,
  ) =>
      BaseResponse(
        status: status,
        message: message,
        errors: errors,
      );

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

}
