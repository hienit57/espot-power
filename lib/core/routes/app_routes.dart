import 'package:espot_power/common/widget/base_result_widget/result_page.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:flutter/material.dart';

class AppPages {
  static Map<String, WidgetBuilder> getPages(BuildContext context) {
    return {
      AppRoutes.onboarding: (context) => const OnboardingPage(),
      AppRoutes.verifyUserExists: (context) => const VerifyUserPage(),
      AppRoutes.verifyOtp: (context) => const VerifyOtpPage(),
      AppRoutes.verifyReferrer: (context) => const VerifyReferrerPage(),
      AppRoutes.passwordSettings: (context) => const PasswordSettingsPage(),
      AppRoutes.login: (context) => const LoginPage(),
      AppRoutes.forgotPassword: (context) => const ForgotPasswordPage(),
      AppRoutes.home: (context) => const HomePage(),
      AppRoutes.profile: (context) => const DashboardProfilePage(),
      AppRoutes.personalInformation: (context) =>
          const ViewPersonalInformationPage(),
      AppRoutes.changePassword: (context) => const ChangePasswordPage(),
      AppRoutes.updateInformationUser: (context) =>
          const UpdateInformationUserPage(),
      AppRoutes.baseResultFeature: (context) => const ResultPage(),
      AppRoutes.informationAndSupportCenter: (context) =>
          const InformationAndSupportCenterPage(),
      AppRoutes.supportWebview: (context) => const SupportWebviewPage(),
      AppRoutes.userManual: (context) => const UserManualPage(),
      AppRoutes.contactForCooperation: (context) =>
          const ContactForCooperationPage(),
      AppRoutes.userFeedback: (context) => const FeedbackPage(),
      AppRoutes.notification: (context) => const NotificationPage(),
      AppRoutes.transaction: (context) => const DashboardTransactionPage(),
      AppRoutes.detailOrder: (context) => const DetailOrderPage(),
      AppRoutes.dashboardDepositMoney: (context) =>
          const DashboardDepositMoneyPage(),
      AppRoutes.dashboardElectronicWallet: (context) =>
          const DashboardElectronicWalletPage(),
      AppRoutes.transferMoney: (context) => const TransferMoneyPage(),
      AppRoutes.verifyTransferMoney: (context) =>
          const VerifyTransferMoneyPage(),
      AppRoutes.map: (context) => const MapPage(),
      AppRoutes.voucher: (context) => const VoucherPage(),
      AppRoutes.addBankAccount: (context) => const AddBankAccountPage(),
      AppRoutes.selectBankAccount: (context) => const SelectBankAccountPage(),
      AppRoutes.verifyAmountWithdaw: (context) =>
          const VerifyAmountWithDrawPage(),
      AppRoutes.inputAmountWithdraw: (context) =>
          const InputAmountWithdrawPage(),
    };
  }

  static Map<String, Widget Function(BuildContext)> getPagesMap() {
    return {
      // AppRoutes.profileInformation['profile_information']!: (context) =>
      //     const DashboardProfilePage(),
      // AppRoutes.verifyUserExists: (context) => const VerifyUserPage(),
      // AppRoutes.verifyOtp: (context) => const VerifyOtpPage(),
      // AppRoutes.verifyReferrer: (context) => const VerifyReferrerPage(),
      // AppRoutes.passwordSettings: (context) => const PasswordSettingsPage(),
      // AppRoutes.login: (context) => const LoginPage(),
      // AppRoutes.forgotPassword: (context) => const ForgotPasswordPage(),
      // AppRoutes.home: (context) => const HomePage(),
    };
  }

  static Map<String, Widget Function(BuildContext)> getPagesTransaction() {
    return {
      // AppRoutes.onboarding: (context) => const OnboardingPage(),
      // AppRoutes.verifyUserExists: (context) => const VerifyUserPage(),
      // AppRoutes.verifyOtp: (context) => const VerifyOtpPage(),
      // AppRoutes.verifyReferrer: (context) => const VerifyReferrerPage(),
      // AppRoutes.passwordSettings: (context) => const PasswordSettingsPage(),
      // AppRoutes.login: (context) => const LoginPage(),
      // AppRoutes.forgotPassword: (context) => const ForgotPasswordPage(),
      // AppRoutes.home: (context) => const HomePage(),
    };
  }

  static Map<String, Widget Function(BuildContext)> getPagesQRScan() {
    return {
      // AppRoutes.onboarding: (context) => const OnboardingPage(),
      // AppRoutes.verifyUserExists: (context) => const VerifyUserPage(),
      // AppRoutes.verifyOtp: (context) => const VerifyOtpPage(),
      // AppRoutes.verifyReferrer: (context) => const VerifyReferrerPage(),
      // AppRoutes.passwordSettings: (context) => const PasswordSettingsPage(),
      // AppRoutes.login: (context) => const LoginPage(),
      // AppRoutes.forgotPassword: (context) => const ForgotPasswordPage(),
      // AppRoutes.home: (context) => const HomePage(),
    };
  }

  static Map<String, Widget Function(BuildContext)>? getPagesNotification() {
    return {
      // AppRoutes.onboarding: (context) => const OnboardingPage(),
      // AppRoutes.verifyUserExists: (context) => const VerifyUserPage(),
      // AppRoutes.verifyOtp: (context) => const VerifyOtpPage(),
      // AppRoutes.verifyReferrer: (context) => const VerifyReferrerPage(),
      // AppRoutes.passwordSettings: (context) => const PasswordSettingsPage(),
      // AppRoutes.login: (context) => const LoginPage(),
      // AppRoutes.forgotPassword: (context) => const ForgotPasswordPage(),
      // AppRoutes.home: (context) => const HomePage(),
    };
  }

  static Map<String, Widget Function(BuildContext)>
      getPagesProfileInformation() {
    return {
      // AppRoutes.profile['profile']!: (context) => const DashboardProfilePage(),
      // AppRoutes.profile['personal-information']!: (context) =>
      //     const ViewPersonalInformationPage(),
      // AppRoutes.onboarding: (context) => const OnboardingPage(),
      // AppRoutes.verifyUserExists: (context) => const VerifyUserPage(),
      // AppRoutes.verifyOtp: (context) => const VerifyOtpPage(),
      // AppRoutes.verifyReferrer: (context) => const VerifyReferrerPage(),
      // AppRoutes.passwordSettings: (context) => const PasswordSettingsPage(),
      // AppRoutes.login: (context) => const LoginPage(),
      // AppRoutes.forgotPassword: (context) => const ForgotPasswordPage(),
      // AppRoutes.home: (context) => const HomePage(),
    };
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic> args = {};
    if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
    }

    //Check onepay order
    // if (settings.name != null && settings.name!.contains(AppRoutes.checkOnepayOrder)) {
    //   final settingsUri = Uri.parse(settings.name!);
    //   final orderNumber = settingsUri.queryParameters['vpc_OrderInfo'];
    //   return MaterialPageRoute(
    //     builder: (_) => CheckingOrder(
    //       orderNumber: orderNumber,
    //     ),
    //   );
    // }

    //Check zalo order
    //FIXME: Maybe can merge the page for checking order?
    // if (settings.name != null && settings.name!.contains(AppRoutes.checkZaloPay)) {
    //   final settingsUri = Uri.parse(settings.name!);
    //   var orderNumber = settingsUri.queryParameters['apptransid'];
    //   if (orderNumber != null) {
    //     orderNumber.split('').forEach(
    //       (element) {
    //         if (element == "_") {
    //           orderNumber = orderNumber!.substring(orderNumber!.indexOf(element) + 1, orderNumber!.length);
    //         }
    //       },
    //     );
    //   }
    //   return MaterialPageRoute(
    //     builder: (_) => CheckingOrder(
    //       orderNumber: orderNumber,
    //     ),
    //   );
    // }
    //Check momo order
    // if (settings.name != null && settings.name!.contains(AppRoutes.checkMomo)) {
    //   final settingsUri = Uri.parse(settings.name!);
    //   final orderNumber = settingsUri.queryParameters['orderId'];
    //   return MaterialPageRoute(
    //     builder: (_) => CheckingOrder(
    //       orderNumber: orderNumber,
    //     ),
    //   );
    // }

    switch (settings.name) {
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case AppRoutes.verifyUserExists:
        return MaterialPageRoute(builder: (_) => const VerifyUserPage());
      case AppRoutes.verifyOtp:
        return MaterialPageRoute(builder: (_) => const VerifyOtpPage());
      case AppRoutes.verifyReferrer:
        return MaterialPageRoute(builder: (_) => const VerifyReferrerPage());
      case AppRoutes.passwordSettings:
        return MaterialPageRoute(builder: (_) => const PasswordSettingsPage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
