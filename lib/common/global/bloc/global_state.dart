part of 'global_cubit.dart';

class GlobalState extends Equatable {
  final bool? isOpenAllTab;
  final bool? isCheckColor;
  final bool? isSidebarZoomOut;

  const GlobalState({
    this.isOpenAllTab,
    this.isCheckColor,
    this.isSidebarZoomOut,
  });

  GlobalState copyWith({
    bool? isOpenAllTab,
    bool? isCheckColor,
    bool? isSidebarZoomOut,
  }) {
    return GlobalState(
      isOpenAllTab: isOpenAllTab ?? this.isOpenAllTab,
      isCheckColor: isCheckColor ?? this.isCheckColor,
      isSidebarZoomOut: isSidebarZoomOut ?? this.isSidebarZoomOut,
    );
  }

  @override
  List<Object?> get props => [
        isOpenAllTab,
        isCheckColor,
        isSidebarZoomOut,
      ];
}
