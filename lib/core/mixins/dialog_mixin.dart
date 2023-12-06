import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:espot_power/index.dart';
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
              width: width,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: widget,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 53),
                    child: GestureDetector(
                      onTap: () => context.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.color212121,
                        ),
                        child: Center(
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
