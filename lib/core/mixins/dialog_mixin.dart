import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:go_router/go_router.dart';

mixin DialogMixin {
  cShowGeneralDialog({
    required BuildContext context,
    required Widget widget,
    required double width,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',

      transitionDuration: const Duration(
        milliseconds: 200,
      ), // adjust the duration as needed
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: width.w,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: widget,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 53.h),
                    child: GestureDetector(
                      onTap: () => context.pop(context),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.brick,
                        ),
                        child: const Center(
                          child: Icon(Icons.close, color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
