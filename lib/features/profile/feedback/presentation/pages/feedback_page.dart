import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget with DialogMixin {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final feedbackCubit = BlocProvider.of<FeedbackCubit>(context);

    return BaseWrapperWidget(
      onReturn: () {
        NavigatorExt.push(
            AppContext.navigatorKey.currentContext!,
            const HomePage(
              indexTab: 4,
              child: AllScreenHome.profile,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          padding: EdgeInsets.zero,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Center(
              child: CText(
                text: LocaleKeys.feedback.tr(),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 36),
            AppTextField(
              controller: feedbackCubit.idDevice,
              placeholder: LocaleKeys.number_serial_machine.tr(),
              borderRadius: 10,
              suffix: const Padding(
                padding: EdgeInsets.symmetric(vertical: 11),
                child: CImage(
                  assetsPath: AppAssets.iconProfileFeedback,
                ),
              ),
              onChanged: (value) {
                feedbackCubit.resetState();
              },
            ),
            const SizedBox(height: 24),
            CText(
              text: LocaleKeys.type_questions.tr(),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 16),
            _buildTypeQuestion(),
            const SizedBox(height: 12),
            AppTextField(
              controller: feedbackCubit.phoneController,
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
                feedbackCubit.resetState();
              },
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: feedbackCubit.emailController,
              placeholder: LocaleKeys.email_of_me.tr(),
              borderRadius: 10,
              prefix: const Padding(
                padding: EdgeInsets.all(11.0),
                child: CImage(
                  assetsPath: AppAssets.iconProfileCooperationUser,
                ),
              ),
              onChanged: (value) {
                feedbackCubit.resetState();
              },
            ),
            const SizedBox(height: 12),
            BlocBuilder<FeedbackCubit, FeedbackState>(
              buildWhen: (previous, current) =>
                  previous.onSendFeedback != current.onSendFeedback,
              builder: (context, state) {
                return Center(
                  child: CText(
                    fontSize: 13,
                    textColor: AppColors.colorEC222D,
                    fontWeight: FontWeight.w400,
                    lineSpacing: 1,
                    text: state.msgSendFeedback,
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 112),
              child: BlocListener<FeedbackCubit, FeedbackState>(
                listenWhen: (previous, current) =>
                    previous.onSendFeedback != current.onSendFeedback,
                listener: (context, state) {
                  if (state.onSendFeedback == RequestStatus.success) {
                    feedbackCubit.resetData();
                    _showDialogSendFeedbackSuccess(
                      context,
                      onConfirm: () => Navigator.pop(context),
                    );
                  }
                },
                child: CButton(
                  height: 40,
                  width: double.infinity,
                  radius: 10,
                  backgroundColor: AppColors.colorFFCB08,
                  title: LocaleKeys.sent.tr(),
                  titleFontWeight: FontWeight.w500,
                  onPressed: () {
                    feedbackCubit.sendFeedback();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTypeQuestion() {
    return BlocBuilder<FeedbackCubit, FeedbackState>(
      buildWhen: (previous, current) =>
          previous.selectQuestion != current.selectQuestion,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8.0, // Khoảng cách giữa các item
              runSpacing: 8.0, // Khoảng cách giữa các hàng
              children: TypeQuestion.values
                  .map(
                    (element) => CButton(
                      height: 40,
                      radius: 10,
                      backgroundColor: state.selectQuestion == element.title
                          ? AppColors.colorFFCB08
                          : AppColors.colorEDEEF1,
                      title: element.title,
                      titleFontWeight: state.selectQuestion == element.title
                          ? FontWeight.w500
                          : FontWeight.w400,
                      onPressed: () {
                        BlocProvider.of<FeedbackCubit>(context)
                            .emitTypeQuestion(element.title);
                      },
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
            CContainer(
              height: 104,
              radius: 10,
              borderColor: AppColors.colorDADADA,
              borderWidth: 1,
              child: AppTextField(
                controller: BlocProvider.of<FeedbackCubit>(context)
                    .informationController,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                borderRadius: 10,
                placeholder: LocaleKeys.enter_question_suggestion.tr(),
                maxLines: 10,
                borderColor: AppColors.white,
                onChanged: (value) {
                  BlocProvider.of<FeedbackCubit>(context).resetState();
                },
              ),
            )
          ],
        );
      },
    );
  }

  _showDialogSendFeedbackSuccess(BuildContext context,
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
