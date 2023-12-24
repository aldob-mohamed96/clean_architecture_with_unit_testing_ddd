import '../../../../core/export/export.dart';


final class RegisterUseCase
    implements BaseUseCase<RegisterRequest, SuccessOperation> {
  final IRepository _repository;

  RegisterUseCase({required IRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(RegisterRequest input) async {
    return await _repository.register(input);
  }
}
