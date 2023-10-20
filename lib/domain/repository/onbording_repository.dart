import 'package:news/domain/models/onboarding/onboarding_model.dart';

abstract interface class IOnboardingRepository {
  Future<({bool isSuccess, List<OnboardingModel>? onboarding, String? error})>
      getOnboardingEntities();
} //TODO не хватает i в названии файла
