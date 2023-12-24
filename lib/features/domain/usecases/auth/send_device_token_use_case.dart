import '../../../../core/export/export.dart';


final class SendDeviceTokenUseCase
    implements BaseUseCase<DeviceTokenRequest, SuccessOperation> {
  final IRepository _repository;

  SendDeviceTokenUseCase({required IRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(
      DeviceTokenRequest input) async {
    return await _repository.sendDeviceToken();
  }
}
