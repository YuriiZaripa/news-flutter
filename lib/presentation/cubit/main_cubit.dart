import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news/data/local_storage/app_database.dart';
import 'package:news/domain/enums/enum.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());

  Future<void> init() async {
    _loadingState();
    bool isFirstLaunch = await AppDatabase.instance.isFirstLaunch();
    emit(
      MainState(
        status: BlocStatus.loaded,
        isFirstLaunch: isFirstLaunch,
      ),
    );
  }

  MainState _loadingState() => state.copyWith(status: BlocStatus.loading);
}
