import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class AddBankAccountPage extends StatelessWidget with LoadingMixin {
  const AddBankAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DashboardProfileCubit>(context).getUserProfile();
    final addBankAccountCubit = BlocProvider.of<AddBankAccountCubit>(context);
    addBankAccountCubit.initData();
    addBankAccountCubit.getBankList();

    return BaseWrapperWidget(
      isViewSupportProblem: true,
      onReturn: () {
        NavigatorExt.pop(AppContext.navigatorKey.currentContext!);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocListener<DashboardProfileCubit, DashboardProfileState>(
          bloc: BlocProvider.of<DashboardProfileCubit>(context),
          listenWhen: (previous, current) =>
              previous.onGetUserProfile != current.onGetUserProfile,
          listener: (context, state) {
            addBankAccountCubit.emitUserProfile(state.userProfileResponse);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Center(
                child: CText(
                  text: LocaleKeys.withdraw_account.tr(),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              CText(
                text: LocaleKeys.please_update_info_account.tr(),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              CText(
                text: LocaleKeys.beneficiary_bank.tr(),
                fontSize: 13,
                fontWeight: FontWeight.w500,
                textColor: AppColors.colorText514D56,
              ),
              const SizedBox(height: 7),
              BlocBuilder<AddBankAccountCubit, AddBankAccountState>(
                buildWhen: (previous, current) =>
                    previous.onGetBankList != current.onGetBankList ||
                    previous.bankSelected != current.bankSelected,
                builder: (context, state) {
                  return _buildItemDropdown(
                    content: state.bankSelected?.bankName ?? '',
                    listOption: state.bankListResponse
                        ?.map((e) => e.bankName ?? '')
                        .toList(),
                    onChanged: (value) {
                      addBankAccountCubit.resetState();
                      addBankAccountCubit.emitBankSelected(value);
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              CTitleTextField(
                title: LocaleKeys.account_number.tr(),
                controller: addBankAccountCubit.numberAccountController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  addBankAccountCubit.resetState();
                },
              ),
              const SizedBox(height: 12),
              CTitleTextField(
                title: LocaleKeys.account_holder.tr(),
                controller: addBankAccountCubit.nameAccountController,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                    RegExp('[0-9a-z!@#%^&*(),.?":{}|<>]'),
                  ),
                ],
                onChanged: (value) {
                  addBankAccountCubit.resetState();
                },
              ),
              Row(
                children: [
                  CText(
                    text: '*',
                    textColor: AppColors.colorEC222D,
                  ),
                  CText(
                    text: LocaleKeys.required_create_name.tr(),
                    fontSize: 13,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              BlocBuilder<AddBankAccountCubit, AddBankAccountState>(
                buildWhen: (previous, current) =>
                    previous.msgVerifyAddBank != current.msgVerifyAddBank,
                builder: (context, state) {
                  return Row(
                    children: [
                      Icon(
                        state.msgVerifyAddBank?.icon,
                        color: state.msgVerifyAddBank?.color,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      CText(
                        text: state.msgVerifyAddBank?.message,
                        fontSize: 13,
                        textColor: state.msgVerifyAddBank?.color,
                      )
                    ],
                  );
                },
              ),
              const SizedBox(height: 25),
              _buildNoteAddBankAccount(),
              // Center(
              //   child: Column(
              //     children: [
              //       const SizedBox(height: 12),
              //       BlocBuilder<AddBankAccountCubit, AddBankAccountState>(
              //         buildWhen: (previous, current) =>
              //             previous.msgVerifyAddBank != current.msgVerifyAddBank,
              //         builder: (context, state) {
              //           return CText(
              //             fontSize: 13,
              //             textColor: state.msgVerifyAddBank?.color,
              //             fontWeight: FontWeight.w400,
              //             lineSpacing: 1,
              //             text: state.msgVerifyAddBank?.message,
              //           );
              //         },
              //       ),
              //       const SizedBox(height: 12),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 112),
                child: BlocListener<AddBankAccountCubit, AddBankAccountState>(
                  listenWhen: (previous, current) =>
                      previous.onVerifyAddBankAccount !=
                      current.onVerifyAddBankAccount,
                  listener: (context, state) {
                    if (state.onVerifyAddBankAccount == RequestStatus.success) {
                      NavigatorExt.pushAndRemoveUntil(
                          AppContext.navigatorKey.currentContext!,
                          SelectBankAccountPage(),
                          AppRoutes.addBankAccount);
                    }
                  },
                  child: CButton(
                    height: 40,
                    width: double.infinity,
                    radius: 10,
                    backgroundColor: AppColors.colorFFCB08,
                    title: LocaleKeys.continues.tr(),
                    titleFontWeight: FontWeight.w500,
                    onPressed: () => addBankAccountCubit.verifyAddBankAccount(),
                  ),
                ),
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }

  _buildItemDropdown({
    List<String>? listOption,
    Function(String?)? onChanged,
    String? content,
  }) {
    return CDropdownWidget(
      listOptionSelect: listOption,
      onChanged: onChanged,
      customButtonDropdown: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: AppColors.color212121.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CText(
                  text: content,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 23,
                width: 23,
                child: CImage(
                  assetsPath: AppAssets.iconArrowDown,
                  color: AppColors.color212121,
                  boxFit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildNoteAddBankAccount() {
    return CContainer(
      width: double.infinity,
      radius: 10,
      backgroundColor: AppColors.color039BE5.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: TextStyle(
              color: AppColors.colorText231F20,
              fontFamily: AppFonts.svnGotham,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: '${LocaleKeys.note.tr()} ',
              ),
              TextSpan(
                text: LocaleKeys.note_update_info_bank.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: LocaleKeys.espot_power.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
