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

      // AppRoutes.signUp: (context) => const SignUpScreen(),
      // AppRoutes.signUpAffiliate: (context) => const AffiliatePage(),
      // AppRoutes.signUpCreatePassword: (context) => const CreatePasswordPage(),

      // AppRoutes.rentalBatteryFailed: (context) => const RentalBatteryFailed(),
      // AppRoutes.accountScreen: (context) => const AccountScreen(),
      // AppRoutes.formOrderSuccess: (context) => const FormCheckSuccess(),
      // AppRoutes.checkOnepayOrder: (context) => const CheckingOrder(),
      // AppRoutes.checkZaloPay: (context) => const CheckingOrder(),
      // AppRoutes.checkMomo: (context) => const CheckingOrder()
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
      // case AppRoutes.login:
      //   return MaterialPageRoute(builder: (_) => const SignInScreen());
      // case AppRoutes.signUp:
      //   return MaterialPageRoute(builder: (_) => const SignUpScreen());
      // case AppRoutes.signUpAffiliate:
      //   return MaterialPageRoute(builder: (_) => const AffiliatePage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      // case AppRoutes.signUpCreatePassword:
      //   return MaterialPageRoute(builder: (_) => const CreatePasswordPage());
      // case AppRoutes.onBoarding:
      //   return MaterialPageRoute(builder: (_) => const OnBroadingScreen());
      // case AppRoutes.rentalBatteryFailed:
      //   return MaterialPageRoute(builder: (_) => const RentalBatteryFailed());
      // case AppRoutes.accountScreen:
      //   return MaterialPageRoute(builder: (_) => const AccountScreen());
      // case AppRoutes.formOrderSuccess:
      //   return MaterialPageRoute(builder: (_) => const FormCheckSuccess());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
