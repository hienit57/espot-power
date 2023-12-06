import 'package:espot_power/common/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';
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
              padding: EdgeInsets.only(right: 70, bottom: 40),
              child: Container(
                width: width ?? 418,
                height: 89,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 26),
                  child: Center(
                    child: Row(
                      children: [
                        Container(
                          width: 29,
                          height: 29,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: AppColors.color212121,
                              ),
                              color: AppColors.color212121),
                          child: Icon(
                            Icons.check,
                            size: 13,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(width: 16),
                        CText(
                          text: message,
                          textColor: AppColors.color212121,
                          fontSize: fontSizeMessage ?? 22,
                          fontFamily: AppFonts.svnGotham,
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
