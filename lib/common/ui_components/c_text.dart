import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';

class CText extends StatefulWidget {
  final double? width;
  final double? height;
  final GestureTapCallback? tappedText;
  final String? text;
  final EdgeInsets? pin;
  final EdgeInsets? margin;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? backgrounColor;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  final double? lineSpacing;
  final TextOverflow? textOverflow;
  final FontStyle? fontStyle;
  final int? maxLine;

  const CText({
    Key? key,
    this.textOverflow,
    this.text,
    this.height,
    this.pin,
    this.margin,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.textAlign,
    this.backgrounColor,
    this.textDecoration,
    this.tappedText,
    this.width,
    this.fontFamily,
    this.lineSpacing,
    this.maxLine,
    this.fontStyle,
  }) : super(key: key);

  @override
  State<CText> createState() => _CTextState();
}

class _CTextState extends State<CText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tappedText,
      child: Text(
        (widget.text ?? ''),
        textAlign: widget.textAlign ?? TextAlign.left,
        style: TextStyle(
          fontFamily: widget.fontFamily ?? AppFonts.plusJakartaSans,
          height: widget.lineSpacing,
          decoration: widget.textDecoration ?? TextDecoration.none,
          backgroundColor: widget.backgrounColor ?? Colors.transparent,
          fontWeight: widget.fontWeight ?? FontWeight.w400,
          color: widget.textColor ?? AppColors.charcoal.withOpacity(0.8),
          fontSize: (widget.fontSize ?? 15.sp) /
              MediaQuery.of(context).textScaleFactor,
          fontStyle: widget.fontStyle,
        ),
        overflow: widget.textOverflow,
        maxLines: widget.maxLine,
      ),
    );
  }
}
