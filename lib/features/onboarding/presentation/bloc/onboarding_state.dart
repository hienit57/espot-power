part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  final OnboardingListPage? selectedOnboardingPage;
  const OnboardingState({
    this.selectedOnboardingPage,
  });

  OnboardingState copyWith({
    OnboardingListPage? selectedOnboardingPage,
  }) {
    return OnboardingState(
      selectedOnboardingPage:
          selectedOnboardingPage ?? this.selectedOnboardingPage,
    );
  }

  @override
  List<Object?> get props => [
        selectedOnboardingPage,
      ];
}
