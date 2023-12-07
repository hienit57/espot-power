import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

mixin DialogMixin {
  cShowGeneralDialog(
    BuildContext context, {
    Widget? widget,
    double? width,
    bool? isTapOutSide,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: isTapOutSide ?? true,
      barrierLabel: '',
      transitionDuration: const Duration(
        milliseconds: 200,
      ),
      // adjust the duration as needed
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return Align(
          alignment: Alignment.center,
          child: widget ??
              SizedBox(
                width: width,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: widget,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 53),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(
                            AppContext.navigatorKey.currentContext!),
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
        );
      },
    );
  }
}
