// import 'package:espot_power/common/index.dart';
// import 'package:espot_power/index.dart';
// import 'package:espot_power/theme/index.dart';
// import 'package:flutter/material.dart';

// class PolicyPage extends StatelessWidget {
//   const PolicyPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final double maxWidth = MediaQuery.of(context).size.width;
//     var padding = MediaQuery.of(context).padding;
//     return SizedBox(
//       width: maxWidth,
//       child: Column(
//         children: [
//           CText(
//             textAlign: TextAlign.center,
//             lineSpacing: 1.5,
//             text: LocaleKeys.i_agree.tr(),
//             textColor: AppColors.colorText514D56,
//             fontStyle: FontStyle.normal,
//           ),
//           GestureDetector(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CText(
//                   textAlign: TextAlign.center,
//                   lineSpacing: 1.5,
//                   text: LocaleKeys.policy.tr(),
//                   fontWeight: FontWeight.w400,
//                   textColor: AppColors.colorText514D56,
//                   textDecoration: TextDecoration.underline,
//                 ),
//                 CText(
//                   lineSpacing: 1.5,
//                   text: LocaleKeys.and.tr(),
//                   fontWeight: FontWeight.w400,
//                   textColor: FontColor.colorText514D56,
//                 ),
//                 CText(
//                   textAlign: TextAlign.center,
//                   lineSpacing: 1.5,
//                   text: LocaleKeys.rules.tr(),
//                   fontWeight: FontWeight.w400,
//                   textColor: FontColor.colorText514D56,
//                   textDecoration: TextDecoration.underline,
//                   tappedText: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => CommonWebPage(
//                                   url: UrlWebview.getRules(),
//                                   title: LocaleKeys.terms_use.tr(),
//                                 )));
//                   },
//                 ),
//               ],
//             ),
//           ),
//           HSpace(h: 45.h + padding.bottom),
//         ],
//       ),
//     );
//   }
// }
