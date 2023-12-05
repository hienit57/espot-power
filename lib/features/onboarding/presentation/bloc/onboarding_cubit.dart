import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/extensions/app_context.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/utils/index.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState>
    with LoadingMixin, ToastMixin {
  OnboardingCubit() : super(const OnboardingState());

  Future<bool> emitShowOnboarding() async {
    return await SharedPrefsHelper.getViewOnboarding();
  }

  void emitOnboadingPage(OnboardingListPage value) {
    emit(state.copyWith(selectedOnboardingPage: value));
  }

  void onPushInApp() async {
    await SharedPrefsHelper.saveViewOnboarding(true);
    Navigator.pushNamed(
        AppContext.navigatorKey.currentContext!, AppRoutes.login);
  }
}
