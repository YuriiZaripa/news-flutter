import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/dependency_injection.dart' as di;
import 'package:news/domain/enums/enum.dart';
import 'package:news/presentation/page/auth/onboarding_page/cubit/onboarding_cubit.dart';
import 'package:news/presentation/page/auth/onboarding_page/widget/one_onbording_widget.dart';
import 'package:news/presentation/routes/router.dart';
import 'package:news/presentation/theme/app_colors.dart';
import 'package:news/presentation/theme/app_fonts.dart';
import 'package:news/presentation/widgets/custom_button.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final OnboardingCubit onboardingCubit = di.getIt.get();
  late final PageController _controller;
  int _selectedPage = 0;

  @override
  void initState() {
    onboardingCubit.getOnboarding();
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      bloc: onboardingCubit,
      listener: (context, state) {
        if (state.status == BlocStatus.error) {
          context.replaceRoute(const BlogRoute());
        } else if (state.status == BlocStatus.loaded &&
            state.onboardingEntities.isEmpty) {
          context.replaceRoute(const BlogRoute());
        }
      },
      builder: (context, state) {
        if (state.status == BlocStatus.loading &&
            state.onboardingEntities.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                ),
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            _selectedPage = value;
                          });
                        },
                        controller: _controller,
                        itemCount: state.onboardingEntities.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(24),
                              ),
                              child: OneOnboardingWidget(
                                onboarding: state.onboardingEntities[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0;
                            i < state.onboardingEntities.length;
                            i++) ...[
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _selectedPage == i
                                  ? AppColors.darkGray
                                  : AppColors.lightGray,
                            ),
                          ),
                          if (i != state.onboardingEntities.length)
                            const SizedBox(
                              width: 8,
                            )
                        ]
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomButton(
                        color:
                            _selectedPage == state.onboardingEntities.length - 1
                                ? AppColors.darkGray
                                : AppColors.lightGray,
                        onPressed: () {
                          if (_selectedPage !=
                              state.onboardingEntities.length - 1) {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          } else {
                            context.replaceRoute(const BlogRoute());
                          }
                        },
                        child: Text(
                          _selectedPage == state.onboardingEntities.length - 1
                              ? 'Got it'
                                  ''
                              : 'Next'
                                  '',
                          style: AppFonts.kTextStyleParagraph16R.copyWith(
                              fontWeight: FontWeight.w700,
                              color: _selectedPage ==
                                      state.onboardingEntities.length - 1
                                  ? AppColors.white
                                  : null),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
