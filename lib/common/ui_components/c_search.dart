import 'dart:async';

import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bas_clean_architecture/index.dart';

class CSearch extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final Function(String)? startEditing;
  final FocusNode? focusNode;
  final String? placeholder;
  final double? height;
  final double? radius;
  final EdgeInsetsGeometry? contentPadding;

  //final TextFieldStyle? textFieldStyle;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final Widget? suffix;

  final Widget? prefix;
  final String? Function(String?)? validator;
  final bool? enabled;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final int? maxLines;

  const CSearch({
    Key? key,
    this.controller,
    this.hint,
    this.focusNode,
    this.startEditing,
    this.placeholder,
    this.height,
    required this.obscureText,
    this.keyboardType,
    required this.textAlign,
    this.suffix,
    this.prefix,
    this.validator,
    this.enabled,
    this.onChanged,
    this.inputFormatters,
    this.initialValue,
    this.maxLines,
    this.radius,
    this.contentPadding,
  }) : super(key: key);

  @override
  State<CSearch> createState() => _CSearchState();
}

class _CSearchState extends State<CSearch> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      controller: widget.controller,
      textAlign: widget.textAlign,
      inputFormatters: widget.inputFormatters,
      style: TextStyle(color: Colors.black, fontSize: 14.sp),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.placeholder,
        hintStyle: TextStyle(
            color: AppColors.charcoal.withOpacity(0.6), fontSize: 14.sp),
        suffixIcon: widget.suffix,
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        prefixIcon: widget.prefix,
        contentPadding: widget.contentPadding,
      ),
      focusNode: widget.focusNode,
      //style: textFieldStyle?.textStyle,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      enabled: widget.enabled,
      onChanged: (query) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 250), () {
          widget.onChanged?.call(query);
        });
      },
      maxLines: widget.maxLines ?? 1,
    );
  }
}
