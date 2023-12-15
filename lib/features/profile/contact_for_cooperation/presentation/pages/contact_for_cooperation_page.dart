import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class ContactForCooperationPage extends StatelessWidget with DialogMixin {
  const ContactForCooperationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contactForCooperationCubit =
        BlocProvider.of<ContactForCooperationCubit>(context);
    return BaseWrapperWidget(
      onReturn: () {
        NavigatorExt.pushAndRemoveUntil(
            AppContext.navigatorKey.currentContext!,
            const HomePage(
              indexTab: 4,
              child: AllScreenHome.profile,
            ),
            AppRoutes.profile);
      },
      child:
          BlocListener<ContactForCooperationCubit, ContactForCooperationState>(
        listenWhen: (previous, current) =>
            previous.onSendContactForCooperation !=
            current.onSendContactForCooperation,
        listener: (context, state) {
          if (state.onSendContactForCooperation == RequestStatus.success) {
            _showDialogSendContactForCooperationSuccess(
              context,
              onConfirm: () => Navigator.pop(context),
            );
          }
        },
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 24),
            Center(
              child: CText(
                text: LocaleKeys.cooperation_contact.tr(),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CText(
                  text: LocaleKeys.info_cooperation_contact.tr(),
                  textAlign: TextAlign.center,
                  lineSpacing: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 31),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AppTextField(
                controller: contactForCooperationCubit.companyController,
                placeholder: LocaleKeys.name_company.tr(),
                borderRadius: 10,
                prefix: const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: CImage(
                    assetsPath: AppAssets.iconProfileCooperationCompany,
                  ),
                ),
                onChanged: (value) {
                  contactForCooperationCubit.resetState();
                },
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AppTextField(
                controller: contactForCooperationCubit.visitorNameController,
                placeholder: LocaleKeys.contacter.tr(),
                borderRadius: 10,
                prefix: const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: CImage(
                    assetsPath: AppAssets.iconProfileCooperationUser,
                  ),
                ),
                onChanged: (value) {
                  contactForCooperationCubit.resetState();
                },
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AppTextField(
                controller: contactForCooperationCubit.visitorPhoneController,
                placeholder: LocaleKeys.telephone.tr(),
                borderRadius: 10,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                prefix: const Padding(
                  padding: EdgeInsets.all(11.0),
                  child: CImage(
                    assetsPath: AppAssets.iconProfileTelephone,
                  ),
                ),
                onChanged: (value) {
                  contactForCooperationCubit.resetState();
                },
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CContainer(
                height: 104,
                radius: 10,
                borderColor: AppColors.colorDADADA,
                borderWidth: 1,
                child: AppTextField(
                  controller: contactForCooperationCubit.contentController,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  borderRadius: 10,
                  placeholder: LocaleKeys.content.tr(),
                  maxLines: 10,
                  borderColor: AppColors.white,
                  onChanged: (value) {
                    contactForCooperationCubit.resetState();
                  },
                ),
              ),
            ),
            const SizedBox(height: 6),
            BlocBuilder<ContactForCooperationCubit, ContactForCooperationState>(
              buildWhen: (previous, current) =>
                  previous.onSendContactForCooperation !=
                  current.onSendContactForCooperation,
              builder: (context, state) {
                return Center(
                  child: CText(
                    fontSize: 13,
                    textColor: AppColors.colorEC222D,
                    fontWeight: FontWeight.w400,
                    lineSpacing: 1,
                    text: state.msgSendContactForCooperation,
                  ),
                );
              },
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 88),
              child: CButton(
                height: 40,
                width: double.infinity,
                radius: 10,
                backgroundColor: AppColors.colorFFCB08,
                title: LocaleKeys.sent.tr(),
                titleFontWeight: FontWeight.w500,
                onPressed: () {
                  contactForCooperationCubit.sendContactForCooperation();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialogSendContactForCooperationSuccess(BuildContext context,
      {VoidCallback? onConfirm}) {
    cShowGeneralDialog(
      context,
      widget: Align(
        alignment: Alignment.center,
        child: IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 37),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 54),
                const CImage(
                  assetsPath: AppAssets.iconCheckSuccess,
                  width: 72,
                  height: 72,
                ),
                const SizedBox(height: 30),
                CText(text: LocaleKeys.thank_you.tr()),
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: AppColors.colorText231F20,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.svnGotham,
                      ),
                      children: [
                        TextSpan(
                          text: ' ${LocaleKeys.espot.tr()} ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: LocaleKeys.contact_you_soon.tr(),
                        ),
                      ]),
                ),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 89),
                  child: CButton(
                    height: 40,
                    width: double.infinity,
                    radius: 10,
                    backgroundColor: AppColors.colorFFCB05,
                    borderColor: AppColors.colorFFCB05,
                    title: LocaleKeys.agree.tr(),
                    titleFontWeight: FontWeight.w500,
                    onPressed: onConfirm,
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
