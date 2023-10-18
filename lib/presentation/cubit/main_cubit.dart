import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/data/local_storage/app_database.dart';
import 'package:news/domain/enums/enuma.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  void justDoIt() {
    emit(_firstTime());
  }

  MainState _firstTime() => state.copyWith(
    status: BlocStatus.loaded,
    isFirstLaunch: true,
  );

  Future<void> init() async {
    _loadingState();
      try {
        bool isFirstLaunch = await AppDatabase.instance.isFirstLaunch();
        emit(
          MainState(
            status: BlocStatus.loaded,
            isFirstLaunch: isFirstLaunch,
          ),
        );
      } catch (e) {
        _onError(e);
      }
  }

  MainState _loadingState() => state.copyWith(status: BlocStatus.loading);

  MainState _onError(Object error) {
    return MainState(
      status: BlocStatus.error,
      error: error,
      isFirstLaunch: state.isFirstLaunch,
    );
  }
}