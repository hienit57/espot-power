import 'package:bas_clean_architecture/common/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin ToastMixin {
  showToast({String? message, ToastGravity? toastGravity, Toast? toastLenght}) {
    Fluttertoast.showToast(
      toastLength: toastLenght ?? Toast.LENGTH_SHORT,
      msg: message.toString(),
      backgroundColor: Colors.black38,
      fontSize: 16,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
    );
  }

  void showToasSuccessBottomRight(
    BuildContext context, {
    double? width,
    double? fontSizeMessage,
    String? message,
  }) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned.fill(
        child: IgnorePointer(
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 70.w, bottom: 40.h),
              child: Container(
                width: width ?? 418.w,
                height: 89.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          width: 29.h,
                          height: 29.h,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: AppColors.brick,
                              ),
                              color: AppColors.brick),
                          child: const Icon(
                            Icons.check,
                            size: 13,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        CText(
                          text: message,
                          textColor: AppColors.brick,
                          fontSize: fontSizeMessage ?? 22.sp,
                          fontFamily: AppFonts.dMSerifDisplayRegular,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
