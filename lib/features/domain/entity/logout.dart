import '../../../core/export/export.dart';

final class Logout extends Equatable {
  final bool value;
  const Logout(this.value);

  @override
  List<Object?> get props => [value];
}
