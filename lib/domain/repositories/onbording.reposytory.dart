import 'package:news/domain/models/onboarding/onboarding_model.dart';

//TODO а что с названием файла происходит?
abstract interface class IOnboardingRepository {
  Future<({bool isSuccess, List<OnboardingModel>? onboarding, String? error})>
      getOnboardingEntities();
}
