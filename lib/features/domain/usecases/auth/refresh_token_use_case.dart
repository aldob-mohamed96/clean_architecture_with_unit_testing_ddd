import '../../../../core/export/export.dart';




final class GetRefershTokenUseCase
    implements BaseUseCase<RefershTokenRequest, TokenData> {
  final IRepository _repository;

  GetRefershTokenUseCase({required IRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, TokenData>> call(RefershTokenRequest input) async {
    return await _repository.refreshToken(input);
  }
}