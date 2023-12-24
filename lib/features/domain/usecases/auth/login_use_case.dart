import '../../../../core/export/export.dart';

final class LoginUseCase implements BaseUseCase<LoginRequest, UserData> {
  final IRepository _repository;

  LoginUseCase({required IRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, UserData>> call(LoginRequest input) async {
    return await _repository.login(input);
  }
}
