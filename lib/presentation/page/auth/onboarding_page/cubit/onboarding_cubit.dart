import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/enums/enum.dart';

import 'package:news/domain/usecases/onboarding/get_onboarding_entities_usecase.dart';
import '../../../../../domain/models/onboarding/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final IGetOnboardingEntitiesUsecase _getOnboardingEntitiesUsecase;

  OnboardingCubit(
    this._getOnboardingEntitiesUsecase,
  ) : super(const OnboardingState());

  Future getOnboarding() async {
    emit(_loadingState());
    final result = await _getOnboardingEntitiesUsecase();

    if (result.isSuccess) {
      emit(
        OnboardingState(
          onboardingEntities: result.onboarding ?? result.onboarding!,
          status: BlocStatus.loaded,
        ),
      );
    } else {
      emit(
        OnboardingState(
          status: BlocStatus.error,
          error: result.error,
        ),
      );
    }
  }

  OnboardingState _loadingState() => state.copyWith(
        status: BlocStatus.loading,
      );
}
