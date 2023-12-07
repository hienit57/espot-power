import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerifyUserPage extends StatelessWidget {
  const VerifyUserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _verifyUserExists = BlocProvider.of<VerifyUserExistsCubit>(context);
    _verifyUserExists.initData();

    return CBackgroundAuthWidget(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: AppColors.colorText514D56,
                wordSpacing: 1.6,
                fontFamily: AppFonts.svnGotham,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: LocaleKeys.wellcome_to.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '${LocaleKeys.espot.tr()} Power',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 55),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AppTextField(
              controller: _verifyUserExists.phoneController,
              placeholder: LocaleKeys.telephone.tr(),
              borderRadius: 10,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              onChanged: (value) {
                _verifyUserExists.resetState();
              },
              prefix: const Padding(
                padding: EdgeInsets.all(11.0),
                child: CImage(
                  assetsPath: AppAssets.iconSignupTelephone,
                ),
              ),
            ),
          ),
          BlocBuilder<VerifyUserExistsCubit, VerifyUserExistsState>(
            buildWhen: (previous, current) =>
                previous.onVerifyUserExists != current.onVerifyUserExists,
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(height: 12),
                  CText(
                    fontSize: 13,
                    textColor: AppColors.colorEC222D,
                    fontWeight: FontWeight.w400,
                    lineSpacing: 1,
                    text: state.msgVerifyUserExists,
                  ),
                  const SizedBox(height: 12),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 112),
            child: CButton(
              height: 40,
              width: double.infinity,
              radius: 10,
              backgroundColor: AppColors.colorFFCB08,
              title: LocaleKeys.continues.tr(),
              titleFontWeight: FontWeight.w500,
              onPressed: () {
                _verifyUserExists.verifyUserExist();
              },
            ),
          )
        ],
      ),
    );
  }
}
