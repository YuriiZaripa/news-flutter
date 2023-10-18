import 'package:dio/dio.dart';
import 'package:news/constants/url_constants.dart';
import 'package:news/data/network_service/api_service.dart';
import 'package:news/domain/models/onboarding/onboarding_model.dart';

final class OnboardingService {
  Future<({bool isSuccess, List<OnboardingModel>? onboarding, String? error})>
      getOnboardingEntities() async {
    try {
      Response? response = await get(
        UrlConstants.apiOnboarding,
      );

      final map = response!.data as Map<String, dynamic>;
      final data = map["data"] as List;
      return (
        isSuccess: true,
        onboarding: data
            .map((e) => OnboardingModel.fromMap(e as Map<String, dynamic>))
            .toList(),
        error: null,
      );
    } on DioException catch (e) {
      final result = e.response!.data as Map<String, dynamic>;
      return (
        isSuccess: false,
        onboarding: null,
        error: result['error']['message'].toString(),
      );
    }
  }
}
