import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class COtpWidget extends StatelessWidget {
  final bool? isError;
  final TextEditingController? controller;

  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;

  const COtpWidget({
    super.key,
    this.isError,
    this.controller,
    this.onCompleted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();

    return PinCodeTextField(
      keyboardAppearance: Brightness.dark,
      length: 4,
      obscureText: false,
      //textStyle: TextStyle(color: brandBlue),
      //animationType: AnimationType.scale,
      keyboardType: const TextInputType.numberWithOptions(),
      pinTheme: PinTheme(
        borderWidth: 1,
        activeFillColor: Colors.white,
        activeColor:
            isError ?? true ? AppColors.colorBorder : AppColors.colorEC222D,
        selectedColor:
            isError ?? true ? AppColors.colorBorder : AppColors.colorEC222D,
        inactiveColor:
            isError ?? true ? AppColors.colorBorder : AppColors.colorEC222D,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 44,
        fieldWidth: 44,
        inactiveFillColor: AppColors.white,
        selectedFillColor: AppColors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: otpController,
      onCompleted: onCompleted,
      onChanged: onChanged,
      beforeTextPaste: (text) {
        //print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
      appContext: context,
    );
  }
}
