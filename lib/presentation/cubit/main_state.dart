part of 'main_cubit.dart';

class MainState extends Equatable {
  final BlocStatus status;
  final bool isFirstLaunch;
  final String? error;

  const MainState({
    this.status = BlocStatus.loading,
    this.isFirstLaunch = false,
    this.error,
  });

  MainState copyWith({
    BlocStatus? status,
    bool? isFirstLaunch,
    String? error,
  }) {
    return MainState(
      status: status ?? this.status,
      isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
      error: null,
    );
  }

  @override
  List<Object?> get props => [
        status,
        isFirstLaunch,
        error,
      ];
}
