part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  const OnboardingState({
    this.status = BlocStatus.loading,
    this.onboardingEntities = const [],
    this.error,
  });

  final BlocStatus status;
  final List<OnboardingModel> onboardingEntities;
  final String? error;

  OnboardingState copyWith({
    BlocStatus? status,
    List<OnboardingModel>? onboardingEntities,
    String? error,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      onboardingEntities: onboardingEntities ?? this.onboardingEntities,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        onboardingEntities,
        error,
      ];
}