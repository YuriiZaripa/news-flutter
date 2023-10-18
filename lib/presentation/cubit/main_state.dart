part of 'main_cubit.dart';

class MainState extends Equatable {
  final BlocStatus status;
  final bool isFirstLaunch;
  final dynamic nextPage;
  final Object? error;
  
  const MainState({
    this.status = BlocStatus.loading,
    this.isFirstLaunch = false,
    this.nextPage,
    this.error,
  });

  MainState copyWith({
    BlocStatus? status,
    bool? isFirstLaunch,
    dynamic nextPage,
  }) {
    return MainState(
      status: status ?? this.status,
      isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
      nextPage: nextPage ?? this.nextPage,
      error: null,
    );
  }

  @override
  List<Object> get props => [
      status, 
      isFirstLaunch,
    ];
}
