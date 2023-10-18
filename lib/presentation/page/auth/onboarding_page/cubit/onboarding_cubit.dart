import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/enums/enuma.dart';

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
    try {
      final result = await _getOnboardingEntitiesUsecase();
      emit(OnboardingState(
        onboardingEntities: result.onboarding!,
        status: BlocStatus.loaded,
      ));
    } catch (error) {
      emit(_onError(error));
    }
  }

  OnboardingState _loadingState() => state.copyWith(
        status: BlocStatus.loading,
      );

  OnboardingState _onError(Object error) {
    debugPrint(error.toString());
    return state.copyWith(
      status: BlocStatus.error,
      error: error,
    );
  }
}