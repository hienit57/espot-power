import 'package:bas_clean_architecture/common/global/index.dart';
import 'package:bas_clean_architecture/theme/app_colors.dart';
import 'package:bas_clean_architecture/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:bas_clean_architecture/index.dart';

class GlobalPage extends StatefulWidget {
  final Widget child;
  const GlobalPage({super.key, required this.child});

  @override
  State<GlobalPage> createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  bool _isHovered = false;

  late GlobalCubit _globalCubit;

  @override
  void initState() {
    _globalCubit = BlocProvider.of<GlobalCubit>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorF3EFEA,
      body: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.h),
                      child: widget.child,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _globalCubit.checkSidebarZoomOut(
                              state.isSidebarZoomOut ?? false),
                          child: Container(
                            width: 30.h,
                            height: 30.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.vividTangerine,
                            ),
                            child: Center(
                              child: Icon(
                                state.isSidebarZoomOut == true
                                    ? Icons.arrow_forward_ios
                                    : Icons.arrow_back_ios_new,
                                color: AppColors.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
