import 'package:espot_power/common/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:espot_power/index.dart';

class CTitleTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  final bool? readOnly;
  final Widget? prefix;
  final Color? borderColor;
  final TextDecoration? inpuDecoration;

  const CTitleTextField({
    super.key,
    this.title,
    this.hintText,
    this.controller,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.focusNode,
    this.onTap,
    this.readOnly,
    this.prefix,
    this.borderColor,
    this.inpuDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          CText(
            text: title,
            fontSize: 18.h,
            fontWeight: FontWeight.bold,
            textColor: AppColors.color212121,
          ),
          SizedBox(height: 7.h),
        ],
        AppTextField(
          readOnly: readOnly ?? false,
          controller: controller,
          borderRadius: 4.r,
          placeholder: hintText,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          focusNode: focusNode,
          onTap: onTap,
          fontSize: 16.sp,
          prefix: prefix,
          borderColor: borderColor,
          inpuDecoration: inpuDecoration,
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
          validator: validator ??
              (value) {
                return null;
              },
        ),
      ],
    );
  }
}
