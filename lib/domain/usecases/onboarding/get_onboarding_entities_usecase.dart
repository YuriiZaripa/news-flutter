import 'package:news/domain/models/onboarding/onboarding_model.dart';
import 'package:news/domain/repository/onbording_repository.dart';

abstract interface class IGetOnboardingEntitiesUsecase {
  Future<({bool isSuccess, List<OnboardingModel>? onboarding, String? error})>
      call();
}

final class GetOnboardingEntitiesUsecase extends IGetOnboardingEntitiesUsecase {
  final IOnboardingRepository _repository;

  GetOnboardingEntitiesUsecase(this._repository);

  @override
  Future<({bool isSuccess, List<OnboardingModel>? onboarding, String? error})>
      call() {
    return _repository.getOnboardingEntities();
  }
}
