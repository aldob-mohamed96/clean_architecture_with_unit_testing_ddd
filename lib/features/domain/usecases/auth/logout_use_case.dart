import '../../../../core/export/export.dart';


final class LogoutUseCase
    implements BaseUseCase<SettingsApp, SuccessOperation> {
  final IRepository _repository;

  LogoutUseCase({required IRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(SettingsApp input) async {
    return await _repository.logout(input);
  }
}
