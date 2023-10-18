import 'package:flutter/material.dart';
import 'package:news/domain/models/onboarding/onboarding_model.dart';
import 'package:news/presentation/theme/app_colors.dart';
import 'package:news/presentation/theme/app_fonts.dart';

class OneOnboardingPage extends StatelessWidget {
  const OneOnboardingPage({
    super.key,
    required this.onboarding,
  });

  final OnboardingModel onboarding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          onboarding.image == null
              ? const SizedBox()
              : Image(
                  image: NetworkImage(
                    onboarding.image!.link,
                  ),
                  fit: BoxFit.cover,
                ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onboarding.title,
                  style: AppFonts.head1.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  onboarding.description,
                  style: AppFonts.kTextStyleParagraph16R.copyWith(
                    color: AppColors.white,
                  ),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}