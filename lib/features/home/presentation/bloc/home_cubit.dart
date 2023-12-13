import 'package:espot_power/features/index.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with LoadingMixin, ToastMixin {
  HomeCubit() : super(const HomeState());

  void emitIndexTabSelect(int value, {AllScreenHome? screenForHome}) {
    emit(state.copyWith(
      indexSelectTab: value,
      screenForHome: screenForHome,
    ));
  }

  void emitScreenForHome(AllScreenHome value) {
    emit(state.copyWith(screenForHome: value));
  }
}
