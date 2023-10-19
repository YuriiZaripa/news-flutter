part of 'main_cubit.dart';

class MainState extends Equatable {
  final BlocStatus status;
  final bool isFirstLaunch;
  final dynamic nextPage; //TODO ты его нигде не используешь - зачем тут это поле? 
  final Object? error;
  
  const MainState({
    this.status = BlocStatus.loading,
    this.isFirstLaunch = false,
    this.nextPage,
    this.error,
  });

//TODO где эрор???
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

//TODO почему не все поля в пропсах??
  @override
  List<Object> get props => [
      status, 
      isFirstLaunch,
    ];
}
