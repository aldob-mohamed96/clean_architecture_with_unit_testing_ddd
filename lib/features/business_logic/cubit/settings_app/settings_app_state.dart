part of 'settings_app_cubit.dart';

final class SettingsAppState extends Equatable {
  final SettingsApp settingsApp;
  final FlowStateApp flowStateApp;
  final Failure failure;
  const SettingsAppState({
    this.failure = const Failure(),
    this.flowStateApp = FlowStateApp.draft,
    this.settingsApp = const SettingsApp(),
  });

  SettingsAppState copyWith({
    SettingsApp? settingsApp,
    FlowStateApp? flowStateApp,
    Failure? failure,
  }) =>
      SettingsAppState(
        settingsApp: settingsApp ?? this.settingsApp,
        flowStateApp: flowStateApp ?? this.flowStateApp,
        failure: failure ?? this.failure,
      );

  @override
  List<Object> get props => [
        settingsApp,
        flowStateApp,
        failure,
      ];
}
