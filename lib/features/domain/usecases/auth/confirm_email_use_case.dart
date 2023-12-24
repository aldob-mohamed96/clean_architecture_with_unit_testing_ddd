


import '../../../../core/export/export.dart';

final class ConfirmEmailUseCase
    implements BaseUseCase<ConfirmEmailRequest, SuccessOperation> {
  final IRepository _repository;

  ConfirmEmailUseCase({required IRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(
      ConfirmEmailRequest input) async {
    return await _repository.confirmEmail(input);
  }
}
