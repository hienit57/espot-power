import 'dart:ui';

import 'package:bas_clean_architecture/common/ui_components/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:bas_clean_architecture/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:bas_clean_architecture/index.dart';

class BackgroundAuth extends StatefulWidget {
  final Widget child;
  final String? imgPathBg;
  final String? slogan;
  final String? author;
  final double? fontSize;
  const BackgroundAuth({
    super.key,
    required this.child,
    this.imgPathBg,
    this.slogan,
    this.author,
    this.fontSize,
  });

  @override
  State<BackgroundAuth> createState() => _BackgroundAuthState();
}

class _BackgroundAuthState extends State<BackgroundAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Row(
            children: [
              Responsive.isLarge(context) || Responsive.isNormal(context)
                  ? Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 18, 0, 19),
                        child: Stack(
                          children: [
                            CImage(
                              assetsPath: widget.imgPathBg,
                              width: 911.w,
                              height: 1046.h,
                              radius: 40,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 40.h,
                                left: 38.w,
                              ),
                              child: CImage(
                                assetsPath: AppAssets.icAppFreya,
                                width: 41.w,
                                height: 58.h,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 50.w,
                                  bottom: 66.h,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.h),
                                  child: SizedBox(
                                    width: 648.w,
                                    height: 437.h,
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 50,
                                        sigmaY: 50,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 35.h,
                                            left: 56.w,
                                            right: 57.w,
                                          ),
                                          child: ScrollConfiguration(
                                            behavior:
                                                ScrollConfiguration.of(context)
                                                    .copyWith(
                                                        scrollbars: false),
                                            child: ListView(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              children: [
                                                Column(
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: CText(
                                                            text: LocaleKeys
                                                                .quotes_left
                                                                .tr(),
                                                            textColor:
                                                                AppColors.white,
                                                            fontSize: 120.sp,
                                                            fontFamily: AppFonts
                                                                .dMSerifDisplayRegular,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 96.h,
                                                          ),
                                                          child: CText(
                                                            text: widget.slogan,
                                                            textColor:
                                                                AppColors.white,
                                                            fontSize:
                                                                widget.fontSize,
                                                            fontFamily: AppFonts
                                                                .dMSerifDisplayRegular,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 258.h,
                                                          ),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: CText(
                                                              text: LocaleKeys
                                                                  .quotes_right
                                                                  .tr(),
                                                              textColor:
                                                                  AppColors
                                                                      .white,
                                                              fontSize: 120.sp,
                                                              fontFamily: AppFonts
                                                                  .dMSerifDisplayRegular,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 340.h,
                                                          ),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: CText(
                                                              text:
                                                                  widget.author,
                                                              textColor: AppColors
                                                                  .brick
                                                                  .withOpacity(
                                                                      0.8),
                                                              fontSize: 24.sp,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
              Expanded(
                flex: 1,
                child: Center(
                  child: widget.child,
                ),
              ),
            ],
          ),
        ));
  }
}
