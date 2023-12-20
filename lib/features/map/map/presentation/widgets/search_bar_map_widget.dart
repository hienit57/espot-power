import 'package:espot_power/common/index.dart';
import 'package:espot_power/core/const.dart';
import 'package:espot_power/core/mixins/dialog_mixin.dart';
import 'package:espot_power/extensions/outside_service.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class SearchBarMapWidget extends StatelessWidget with DialogMixin {
  final VoidCallback? onSearch;

  const SearchBarMapWidget({
    super.key,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: _buildSearchBar(
            onTap: () => BlocProvider.of<MapCubit>(context)
                .slidingController
                .add(StatusSliding.high),
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButtonSupport(
                icon: AppAssets.iconTabMapInstruction,
                content: LocaleKeys.instruction.tr(),
                onTap: () => NavigatorExt.push(
                  AppContext.navigatorKey.currentContext!,
                  UserManualPage(
                    onReturn: () => NavigatorExt.pop(
                        AppContext.navigatorKey.currentContext!),
                  ),
                ),
              ),
              _buildButtonSupport(
                icon: AppAssets.iconTabMapSupport,
                content: LocaleKeys.support.tr(),
                onTap: () => onTapProblem(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildSearchBar({VoidCallback? onTap}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 8,
              spreadRadius: -4,
              color: Color.fromRGBO(24, 39, 75, 0.08),
            ),
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 6,
              spreadRadius: -4,
              color: Color.fromRGBO(24, 39, 75, 0.12),
            ),
          ],
        ),
        child: Center(
          child: Row(
            children: [
              const SizedBox(width: 14),
              const CImage(
                width: 24,
                height: 24,
                assetsPath: AppAssets.iconSearchLocation,
              ),
              const SizedBox(width: 12),
              CText(
                text: LocaleKeys.search_place.tr(),
                textColor: AppColors.color979797,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildButtonSupport({
    String? icon,
    String? content,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: 36,
        width: 120,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 8,
              spreadRadius: -4,
              color: Color.fromRGBO(24, 39, 75, 0.08),
            ),
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 6,
              spreadRadius: -4,
              color: Color.fromRGBO(24, 39, 75, 0.12),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CImage(
              assetsPath: icon,
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 8),
            CText(
              text: content,
              fontSize: 12,
            )
          ],
        ),
      ),
    );
  }

  void onTapProblem(BuildContext context) {
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
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, size: 24),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const CImage(
                  assetsPath: AppAssets.iconMapSupportDialogProblem,
                  width: 72,
                  height: 72,
                ),
                const SizedBox(height: 24),
                CText(
                  text: LocaleKeys.your_problem.tr(),
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: AppColors.colorText231F20,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.svnGotham,
                      ),
                      children: [
                        TextSpan(
                          text: LocaleKeys.suggest_line1_tile.tr(),
                        ),
                        TextSpan(
                          text: ' ${LocaleKeys.espot.tr()} ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 8),
                CText(
                  text: LocaleKeys.suggest_line2_tile.tr(),
                ),
                const SizedBox(height: 36),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          backgroundColor: AppColors.white,
                          borderColor:
                              AppColors.colorText231F20.withOpacity(0.4),
                          radius: 10,
                          onPressed: () {
                            OutsideService().call(telephoneCompany);
                          },
                          title: LocaleKeys.call_phone_tile.tr(),
                          titleFontSize: 14,
                          titleColor: AppColors.colorText231F20,
                          titleFontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        flex: 1,
                        child: CButton(
                          height: 40,
                          backgroundColor: AppColors.white,
                          borderColor:
                              AppColors.colorText231F20.withOpacity(0.4),
                          radius: 10,
                          onPressed: () {
                            OutsideService().sendMail(AppAssets.emailCompany);
                          },
                          title: LocaleKeys.send_email_tile.tr(),
                          titleFontSize: 14,
                          titleColor: AppColors.colorText231F20,
                          titleFontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
