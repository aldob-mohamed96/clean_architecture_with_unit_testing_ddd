import '../../../../core/export/export.dart';


final class GetSettingsApp implements BaseUseCase<NoParam, SettingsApp> {
  GetSettingsApp({required IRepository repository}) : _repository = repository;
  final IRepository _repository;

  @override
  Future<Either<Failure, SettingsApp>> call(NoParam input) async {
    return await _repository.getAppSettings();
  }
}

final class CashSettingApp
    implements BaseUseCase<SettingsApp, SuccessOperation> {
  CashSettingApp({required IRepository repository}) : _repository = repository;
  final IRepository _repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(SettingsApp input) async {
    return await _repository.cashAppSttings(input);
  }
}

final class Logout implements BaseUseCase<SettingsApp, SuccessOperation> {
  Logout({required IRepository repository}) : _repository = repository;
  final IRepository _repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(SettingsApp input) async {
    return await _repository.logout(input);
  }
}
