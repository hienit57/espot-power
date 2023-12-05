import 'package:bas_clean_architecture/common/ui_components/index.dart';
import 'package:bas_clean_architecture/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CConfirmDialog extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final TextAlign? textAlign;
  final VoidCallback? onPressLastButton;
  final VoidCallback? onPressFirstButton;
  final String? firstButtonTitle;
  final String? lastButtonTitle;
  const CConfirmDialog({
    super.key,
    this.title,
    this.subTitle,
    this.textAlign,
    this.onPressLastButton,
    this.onPressFirstButton,
    this.firstButtonTitle,
    this.lastButtonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          color: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CText(
                  text: title ?? 'Confirm dialog',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  subTitle ?? '',
                  textAlign: textAlign ?? TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: CButton(
                          title: firstButtonTitle ?? 'Cancel',
                          onPressed: onPressFirstButton ??
                              () {
                                Navigator.of(context).pop();
                              },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: CButton(
                          title: lastButtonTitle ?? 'Confirm',
                          onPressed: onPressLastButton ??
                              () {
                                Navigator.of(context).pop();
                              },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
