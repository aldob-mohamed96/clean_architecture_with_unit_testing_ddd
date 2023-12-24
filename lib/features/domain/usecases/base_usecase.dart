import '../../../../core/export/export.dart';


abstract interface class BaseUseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input input);
}
