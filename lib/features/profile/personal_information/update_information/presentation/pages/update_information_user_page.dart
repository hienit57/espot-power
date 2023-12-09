import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:pattern_formatter/date_formatter.dart';

class UpdateInformationUserPage extends StatelessWidget with DialogMixin {
  const UpdateInformationUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _dashboardProfileCubit =
        BlocProvider.of<DashboardProfileCubit>(context);
    _dashboardProfileCubit.getUserProfile();

    final _updateInformationCubit =
        BlocProvider.of<UpdateInformationUserCubit>(context);

    return BlocListener<DashboardProfileCubit, DashboardProfileState>(
      listenWhen: (previous, current) =>
          previous.onGetUserProfile != current.onGetUserProfile,
      listener: (context, state) {
        _updateInformationCubit.initData(state.userProfileResponse);
        _updateInformationCubit
            .emitAddress(state.userProfileResponse?.address ?? '');
        _updateInformationCubit
            .emitGender(state.userProfileResponse?.gender ?? '');
      },
      child: BaseWrapperWidget(
        onReturn: () {
          PersistentNavBarNavigator.pushNewScreen(
            AppContext.navigatorKey.currentContext!,
            screen: const ViewPersonalInformationPage(),
            withNavBar: true,
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocConsumer<UpdateInformationUserCubit,
              UpdateInformationUserState>(
            buildWhen: (previous, current) =>
                previous.onUpdateInformationUser !=
                    current.onUpdateInformationUser ||
                previous.address != current.address ||
                previous.gender != current.gender ||
                previous.userProfileResponse != current.userProfileResponse,
            listenWhen: (previous, current) =>
                previous.onUpdateInformationUser !=
                current.onUpdateInformationUser,
            listener: (context, state) {
              if (state.onUpdateInformationUser == RequestStatus.success) {
                _showDialogChangePwdSuccess(
                  context,
                  onConfirm: () {
                    _dashboardProfileCubit.getUserProfile();
                    Navigator.pop(context);
                  },
                );
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  const SizedBox(height: 24),
                  CText(
                    text: LocaleKeys.info_person.tr(),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 36),
                  AppTextField(
                    readOnly:
                        state.userProfileResponse?.name?.isNotEmpty ?? false,
                    controller: _updateInformationCubit.nameController,
                    placeholder: LocaleKeys.username.tr(),
                    borderRadius: 10,
                    prefix: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: CImage(
                        assetsPath: AppAssets.imgProfile,
                        boxFit: BoxFit.contain,
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                        RegExp('[0-9a-z!@#%^&*(),.?":{}|<>]'),
                      ),
                    ],
                    onChanged: (value) {
                      _updateInformationCubit.resetState();
                    },
                  ),
                  const SizedBox(height: 4),
                  if (state.userProfileResponse?.name?.isEmpty ?? true) ...[
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
                    )
                  ],
                  const SizedBox(height: 8),
                  AppTextField(
                    controller: _updateInformationCubit.emailController,
                    placeholder: LocaleKeys.f_email.tr(),
                    borderRadius: 10,
                    prefix: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: CImage(
                        assetsPath: AppAssets.iconProfileEmail,
                        boxFit: BoxFit.contain,
                      ),
                    ),
                    onChanged: (value) {
                      _updateInformationCubit.resetState();
                    },
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    controller: _updateInformationCubit.dobController,
                    placeholder: LocaleKeys.f_birthday.tr(),
                    borderRadius: 10,
                    inputFormatters: [DateInputFormatter()],
                    prefix: const Padding(
                      padding: EdgeInsets.all(13.0),
                      child: CImage(
                        assetsPath: AppAssets.iconProfileCalenda,
                        boxFit: BoxFit.contain,
                      ),
                    ),
                    onChanged: (value) {
                      _updateInformationCubit.resetState();
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildItemDropdown(
                    listOption: listGender,
                    onChanged: (value) {
                      _updateInformationCubit.emitGender(value ?? '');
                    },
                    icon: AppAssets.iconProfileGender,
                    content: (state.gender?.isNotEmpty ?? false)
                        ? state.gender
                        : state.userProfileResponse?.getGender,
                    //LocaleKeys.f_gender.tr(),
                  ),
                  const SizedBox(height: 12),
                  _buildItemDropdown(
                    listOption: _updateInformationCubit.itemProvinces
                        .map((e) => e.name ?? '')
                        .toList(),
                    onChanged: (value) {
                      _updateInformationCubit.emitAddress(value ?? '');
                    },
                    icon: AppAssets.iconProfileAddress,
                    content: (state.address?.isNotEmpty ?? false)
                        ? state.address
                        : state.userProfileResponse?.getAddress,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.colorFFF9E3,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: CText(
                        text: LocaleKeys.notice_update_information_user.tr(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 17),
                  CText(
                    fontSize: 14,
                    textColor: AppColors.colorEC222D,
                    fontWeight: FontWeight.w400,
                    lineSpacing: 1,
                    text: state.msgUpdateInformationUser,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 17),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 112),
                    child: CButton(
                      height: 40,
                      width: double.infinity,
                      radius: 10,
                      backgroundColor: AppColors.colorFFCB08,
                      title: LocaleKeys.confirm.tr(),
                      titleFontWeight: FontWeight.w500,
                      onPressed: () {
                        _updateInformationCubit.updateInformationUser();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  _buildItemDropdown({
    List<String>? listOption,
    Function(String?)? onChanged,
    String? icon,
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
              SizedBox(
                height: 23,
                width: 23,
                child: CImage(
                  assetsPath: icon,
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: CText(
                  text: content,
                  fontSize: 14,
                  textColor: AppColors.color979797,
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

  _showDialogChangePwdSuccess(BuildContext context, {VoidCallback? onConfirm}) {
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
                CText(
                  textAlign: TextAlign.center,
                  lineSpacing: 1.2,
                  text: LocaleKeys.popup_change_password_success.tr(),
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
