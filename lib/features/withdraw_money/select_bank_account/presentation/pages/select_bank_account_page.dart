import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/routes/app_pages.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class SelectBankAccountPage extends StatelessWidget {
  const SelectBankAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectBankAccountCubit =
        BlocProvider.of<SelectBankAccountCubit>(context);
    selectBankAccountCubit.initData();
    selectBankAccountCubit.getListYourBank();

    return BaseWrapperWidget(
      isViewSupportProblem: true,
      onReturn: () {
        NavigatorExt.pushAndRemoveUntil(
          AppContext.navigatorKey.currentContext!,
          const HomePage(
            indexTab: 1,
            child: AllScreenHome.transaction,
          ),
          AppRoutes.selectBankAccount,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<SelectBankAccountCubit, SelectBankAccountState>(
          buildWhen: (previous, current) =>
              previous.onGetListBank != current.onGetListBank ||
              previous.yourBankSelected != current.yourBankSelected,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Center(
                  child: CText(
                    text: LocaleKeys.withdraw_money.tr(),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                CText(
                  text: LocaleKeys.choise_select_account_withdraw.tr(),
                  fontSize: 16,
                  fontWeight:
                      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.5),
                ),
                const SizedBox(height: 16),
                CContainer(
                  width: double.infinity,
                  height: 52,
                  radius: 10,
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.colorDADADA,
                  borderWidth: 1,
                  onTap: () => NavigatorExt.push(
                      AppContext.navigatorKey.currentContext!,
                      const AddBankAccountPage()),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CImage(
                          width: 24,
                          height: 24,
                          assetsPath: AppAssets.iconWithdrawAddAccount,
                        ),
                        const SizedBox(width: 8),
                        CText(
                          text: LocaleKeys.add_account.tr(),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                if (state.listYourBank?.isNotEmpty ?? false) ...[
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: state.listYourBank?.length,
                      itemBuilder: (context, index) {
                        final item = state.listYourBank?[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ItemBankWidget(
                            bankInformationResponse: item,
                            isSelected: item == state.yourBankSelected,
                            onTap: () => selectBankAccountCubit
                                .emitYourBankSelected(item),
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        BlocBuilder<SelectBankAccountCubit,
                            SelectBankAccountState>(
                          buildWhen: (previous, current) =>
                              previous.yourBankSelected !=
                                  current.yourBankSelected ||
                              previous.yourBankSelected == null,
                          builder: (context, state) {
                            return CText(
                              fontSize: 13,
                              textColor: AppColors.colorEC222D,
                              fontWeight: FontWeight.w400,
                              lineSpacing: 1,
                              text: state.msgSelectBank,
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
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
                      onPressed: () =>
                          selectBankAccountCubit.checkSelectYourBankAccount(),
                    ),
                  ),
                  const SizedBox(height: 40)
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
