import 'package:bas_clean_architecture/common/index.dart';
import 'package:bas_clean_architecture/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:bas_clean_architecture/index.dart';

class CCustomDropdownMenuItem extends StatefulWidget {
  final List<String> listItem;
  final double? width;
  final double? height;
  final double? paddingLeft;

  final Function(String value)? onTap;

  const CCustomDropdownMenuItem({
    super.key,
    required this.listItem,
    this.onTap,
    this.width,
    this.height,
    this.paddingLeft,
  });

  @override
  State<CCustomDropdownMenuItem> createState() =>
      _CCustomDropdownMenuItemState();
}

class _CCustomDropdownMenuItemState extends State<CCustomDropdownMenuItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height ?? widget.listItem.length * 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          itemCount: widget.listItem.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 40.h,
              width: double.infinity,
              child: TextButton(
                onPressed: () => widget.onTap?.call(widget.listItem[index]),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: widget.listItem[index] == widget.listItem.last
                        ? BorderRadius.only(
                            bottomLeft: Radius.circular(6.r),
                            bottomRight: Radius.circular(6.r),
                          )
                        : BorderRadius.circular(0),
                    side: BorderSide(
                      color: Colors.transparent,
                      width: 1.w,
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: widget.paddingLeft ?? 10.w),
                    child: CText(
                      text: widget.listItem[index],
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.left,
                      textColor: AppColors.charcoal.withOpacity(0.6),
                      tappedText: () =>
                          widget.onTap?.call(widget.listItem[index]),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
