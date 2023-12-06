part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  final OnboardingListPage? selectedOnboardingPage;
  final bool? isLogin;

  const OnboardingState({
    this.selectedOnboardingPage,
    this.isLogin,
  });

  OnboardingState copyWith({
    OnboardingListPage? selectedOnboardingPage,
    bool? isLogin,
  }) {
    return OnboardingState(
      selectedOnboardingPage:
          selectedOnboardingPage ?? this.selectedOnboardingPage,
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  List<Object?> get props => [
        selectedOnboardingPage,
        isLogin,
      ];
}
