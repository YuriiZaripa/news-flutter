import 'package:news/data/remote_storage/onboarding_service.dart';
import 'package:news/domain/models/onboarding/onboarding_model.dart';
import 'package:news/domain/repository/onbording_repository.dart';

final class OnboardingRepository implements IOnboardingRepository {
  final OnboardingService _service;

  OnboardingRepository(
    this._service,
  );

  @override
  Future<({bool isSuccess, List<OnboardingModel>? onboarding, String? error})>
      getOnboardingEntities() async {
    return await _service.getOnboardingEntities();
  }
}
