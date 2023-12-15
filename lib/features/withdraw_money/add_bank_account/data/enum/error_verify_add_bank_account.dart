import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

enum ErrorVerifyAddBankAccount {
  initial,
  accountNotMatch,
  accountMatch,
  errorSystem,
  errorFillAllInformation;

  Color? get color {
    switch (this) {
      case ErrorVerifyAddBankAccount.initial:
        return AppColors.colorFFCB08;
      case ErrorVerifyAddBankAccount.accountNotMatch:
        return AppColors.colorEC222D;
      case ErrorVerifyAddBankAccount.errorSystem:
        return AppColors.colorEC222D;
      case ErrorVerifyAddBankAccount.errorFillAllInformation:
        return AppColors.colorEC222D;
      case ErrorVerifyAddBankAccount.accountMatch:
        return AppColors.color34A853;
    }
  }

  IconData? get icon {
    switch (this) {
      case ErrorVerifyAddBankAccount.initial:
        return Icons.check_circle_outline;
      case ErrorVerifyAddBankAccount.accountNotMatch:
        return Icons.cancel_outlined;
      case ErrorVerifyAddBankAccount.errorSystem:
        return Icons.cancel_outlined;
      case ErrorVerifyAddBankAccount.errorFillAllInformation:
        return Icons.cancel_outlined;
      case ErrorVerifyAddBankAccount.accountMatch:
        return Icons.check_circle_outline;
    }
  }

  String? get message {
    switch (this) {
      case ErrorVerifyAddBankAccount.initial:
        return LocaleKeys.choose_bank_and_input_stk.tr();
      case ErrorVerifyAddBankAccount.accountNotMatch:
        return LocaleKeys.bank_account_wrong.tr();
      case ErrorVerifyAddBankAccount.errorSystem:
        return LocaleKeys.please_try_again_few_minutes.tr();
      case ErrorVerifyAddBankAccount.errorFillAllInformation:
        return LocaleKeys.please_enter_all_information.tr();
      case ErrorVerifyAddBankAccount.accountMatch:
        return LocaleKeys.bank_account_true.tr();
    }
  }
}
