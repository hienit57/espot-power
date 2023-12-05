import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.placeholder,
    this.minLine,
    this.focusNode,
    this.readOnly,
    this.controller,
    //this.textFieldStyle,
    this.obscureText = false,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.suffix,
    this.validator,
    this.enabled,
    this.onChanged,
    this.inputFormatters,
    this.prefix,
    this.initialValue,
    this.maxLines = 1,
    this.borderRadius,
    this.contentPadding,
    this.autovalidateMode,
    this.borderColor,
    this.textInputAction,
    this.onTap,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.inpuDecoration,
    this.onFieldSubmitted,
  }) : super(key: key);

  final String? placeholder;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final EdgeInsets? contentPadding;
  final bool? readOnly;
  final Function()? onTap;
  //final TextFieldStyle? textFieldStyle;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final Widget? suffix;
  final int? minLine;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final bool? enabled;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final int? maxLines;
  final double? borderRadius;
  final Color? borderColor;
  final AutovalidateMode? autovalidateMode;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextDecoration? inpuDecoration;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 14 * 4),
      readOnly: readOnly ?? false,
      textInputAction: textInputAction ?? TextInputAction.done,
      minLines: minLine ?? 1,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      controller: controller,
      textAlign: textAlign,
      onTap: onTap,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      enableSuggestions: false,
      autocorrect: false,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight,
        fontFamily: AppFonts.plusJakartaSans,
        decoration: inpuDecoration,
      ),
      decoration: InputDecoration(
        errorMaxLines: 3,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12,
        ),
        contentPadding:
            contentPadding ?? const EdgeInsets.only(left: 24, right: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.charcoal.withOpacity(0.2),
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          borderSide: BorderSide(
            width: 1,
            color: borderColor ?? AppColors.brick,
          ),
        ),
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: fontSize ?? 14.sp,
          fontFamily: AppFonts.plusJakartaSans,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.charcoal.withOpacity(0.2),
            width: 1,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: suffix,
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        prefixIcon: prefix,
      ),
      focusNode: focusNode,
      //style: textFieldStyle?.textStyle,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      enabled: enabled,
      onChanged: onChanged,
      maxLines: maxLines,
    );
  }
}
