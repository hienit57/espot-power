import 'package:bas_clean_architecture/core/mixins/index.dart';
import 'package:equatable/equatable.dart';
import 'package:bas_clean_architecture/index.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> with LoadingMixin {
  GlobalCubit() : super(const GlobalState());

  void isOpenAllTab({required bool value}) {
    emit(state.copyWith(isOpenAllTab: value));
  }

  void isCheckColor({required bool value}) {
    emit(state.copyWith(isCheckColor: value));
  }

  void checkSidebarZoomOut(bool index) {
    emit(state.copyWith(isSidebarZoomOut: !index));
  }
}
