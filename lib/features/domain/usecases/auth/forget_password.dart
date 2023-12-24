import '../../../../core/export/export.dart';


final class ForgetPasswordUseCase
    implements BaseUseCase<ForgetPasswordRequest, SuccessOperation> {
  final IRepository _repository;

  ForgetPasswordUseCase({required IRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(
      ForgetPasswordRequest input) async {
    return await _repository.forgetPassword(input);
  }
}

final class ChangePasswordUseCase
    implements BaseUseCase<ChangePasswordCodeRequest, SuccessOperation> {
  final IRepository _repository;

  ChangePasswordUseCase({required IRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(
      ChangePasswordCodeRequest input) async {
    return await _repository.changePassword(input);
  }
}
