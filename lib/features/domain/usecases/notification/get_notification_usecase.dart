import '../../../../core/export/export.dart';

final class GetNotificationsUseCase
    implements BaseUseCase<PaginationRequest, NotificationData> {
  final IRepository _repository;

  GetNotificationsUseCase({required IRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, NotificationData>> call(
      PaginationRequest paginationRequest) async {
    return await _repository.getNotifications(paginationRequest);
  }
}
