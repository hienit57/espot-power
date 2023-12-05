import 'package:bas_clean_architecture/common/index.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';

class CDropDown extends StatefulWidget {
  final String? title;
  final List<String> listTitle;
  final String? selectTitle;
  final Function(String?)? onChanged;
  final String? icon;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? menuMaxHeight;
  final double? paddingLeft;

  const CDropDown({
    super.key,
    required this.listTitle,
    this.title,
    this.onChanged,
    this.selectTitle,
    this.icon,
    this.borderRadius,
    this.height,
    this.width,
    this.menuMaxHeight,
    this.paddingLeft,
  });

  @override
  State<CDropDown> createState() => _CDropDownState();
}

class _CDropDownState extends State<CDropDown> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null) ...[
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: CText(
              text: widget.title,
              fontSize: 18.h,
              fontWeight: FontWeight.bold,
              textColor: AppColors.charcoal,
            ),
          ),
        ],
        MouseRegion(
          onEnter: (_) {
            setState(() {
              _isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              _isHovered = false;
            });
          },
          child: Container(
            width: widget.width ?? double.infinity,
            height: widget.height ?? 50,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: _isHovered
                  ? const Color.fromARGB(255, 161, 202, 238).withOpacity(0.1)
                  : Colors.transparent,
              border: Border.all(
                color: AppColors.charcoal.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
            ),
            child: Padding(
              padding: EdgeInsets.only(right: 11.w),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (widget.icon != null) ...[
                        Row(
                          children: [
                            SizedBox(width: widget.paddingLeft),
                            CImage(
                              assetsPath: widget.icon,
                              height: 16.h,
                              width: 19.w,
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ] else ...[
                        SizedBox(width: widget.paddingLeft),
                      ],
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: CText(
                            text: widget.selectTitle,
                            textColor: AppColors.charcoal,
                            fontSize: 14.sp,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      menuMaxHeight: widget.menuMaxHeight,
                      items: widget.listTitle
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: CText(
                                  text: e,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.start,
                                  fontFamily: AppFonts.plusJakartaSans,
                                  textColor:
                                      AppColors.charcoal.withOpacity(0.6),
                                ),
                              ))
                          .toList(),
                      onChanged: widget.onChanged,
                      isExpanded: true,
                      icon: CImage(
                        assetsPath: AppAssets.icArrowDown,
                        height: 7.h,
                        width: 12.w,
                        color: AppColors.charcoal.withOpacity(0.4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
