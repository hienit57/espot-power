import 'package:bas_clean_architecture/common/index.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/index.dart';
import 'package:flutter/material.dart';

class CHeaderPageWidget extends StatefulWidget {
  final String titlePage;
  final bool? isFilter;
  final Widget? widgetReplaceFilter;

  final String? titleSyntheticOne;
  final String? contentSyntheticOne;
  final String? dateSyntheticOne;

  final String? titleSyntheticTwo;
  final String? contentSyntheticTwo;
  final String? dateSyntheticTwo;

  final String? titleSyntheticThree;
  final String? contentSyntheticThree;
  final String? dateSyntheticThree;
  final CrossAxisAlignment? crossAxisAlignmentSyntheticThree;

  final Function(String query)? onSearch;
  final VoidCallback? onRefresh;

  final String? titleButtonAddNewItem;
  final VoidCallback? onAddNewItem;

  final List<String> listItemFilterOne;
  final String titleFilterOne;
  final String iconFilterOne;
  final VoidCallback? onTapSelectFilter1;

  final List<String> listItemFilterTwo;
  final String titleFilterTwo;
  final String iconFilterTwo;
  final VoidCallback? onTapSelectFilter2;

  final List<String> listItemFilterThree;
  final String titleFilterThree;
  final String iconFilterThree;
  final VoidCallback? onTapSelectFilter3;

  final TextEditingController? searchController;

  const CHeaderPageWidget({
    required this.titlePage,
    this.isFilter,
    this.widgetReplaceFilter,
    this.titleSyntheticOne,
    this.contentSyntheticOne,
    this.titleSyntheticTwo,
    this.contentSyntheticTwo,
    this.titleSyntheticThree,
    this.contentSyntheticThree,
    this.crossAxisAlignmentSyntheticThree,
    super.key,
    this.onSearch,
    this.onRefresh,
    this.titleButtonAddNewItem,
    this.onAddNewItem,
    required this.titleFilterOne,
    required this.iconFilterOne,
    required this.titleFilterTwo,
    required this.iconFilterTwo,
    required this.titleFilterThree,
    required this.iconFilterThree,
    required this.listItemFilterOne,
    required this.listItemFilterTwo,
    required this.listItemFilterThree,
    this.dateSyntheticOne,
    this.dateSyntheticTwo,
    this.dateSyntheticThree,
    this.onTapSelectFilter1,
    this.onTapSelectFilter2,
    this.onTapSelectFilter3,
    this.searchController,
  });

  @override
  State<CHeaderPageWidget> createState() => _CHeaderPageWidgetState();
}

class _CHeaderPageWidgetState extends State<CHeaderPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CText(
              text: widget.titlePage,
              fontSize: 32.h,
              fontFamily: AppFonts.dMSerifDisplayRegular,
            ),
            CButton(
              width: 204.w,
              height: 54.h,
              radius: 150,
              backgroundColor: AppColors.brick,
              onPressed: () {
                widget.onAddNewItem?.call();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add, color: AppColors.white),
                  SizedBox(width: 5.w),
                  CText(
                    text: widget.titleButtonAddNewItem,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.white,
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 27.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: SyntheticWidget(
                title: widget.titleSyntheticOne,
                content: widget.contentSyntheticOne ?? '0',
                date: widget.dateSyntheticOne ?? '',
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              flex: 1,
              child: SyntheticWidget(
                title: widget.titleSyntheticTwo,
                content: widget.contentSyntheticTwo,
                date: widget.dateSyntheticTwo ?? '',
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              flex: 1,
              child: SyntheticWidget(
                title: widget.titleSyntheticThree,
                content: widget.contentSyntheticThree,
                date: widget.dateSyntheticThree ?? '',
                crossAxisAlignment: widget.crossAxisAlignmentSyntheticThree,
              ),
            )
          ],
        ),
        SizedBox(height: 30.h),
        widget.isFilter == true
            ? Row(
                children: [
                  Container(
                    width: 204.w,
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.charcoal.withOpacity(0.2),
                          width: 1.w),
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: CSearch(
                      controller: widget.searchController,
                      onChanged: (query) {
                        widget.onSearch?.call(query);
                      },
                      contentPadding: const EdgeInsets.symmetric(vertical: 13),
                      radius: 6.h,
                      obscureText: false,
                      textAlign: TextAlign.start,
                      prefix: Icon(
                        Icons.search,
                        color: AppColors.charcoal.withOpacity(0.6),
                        size: 20,
                      ),
                      placeholder: LocaleKeys.search.tr(),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  CBoxFilterWidget(
                    height: 44,
                    width: 133.w,
                    icon: widget.iconFilterOne,
                    selectTitle: widget.titleFilterOne,
                    onTapFilter: () => widget.onTapSelectFilter1?.call(),
                  ),
                  SizedBox(width: 10.w),
                  CBoxFilterWidget(
                    height: 44,
                    width: 170.w,
                    icon: widget.iconFilterTwo,
                    selectTitle: widget.titleFilterTwo,
                    onTapFilter: () => widget.onTapSelectFilter2?.call(),
                  ),
                  SizedBox(width: 10.w),
                  CBoxFilterWidget(
                    height: 44,
                    width: 192.w,
                    icon: widget.iconFilterThree,
                    selectTitle: widget.titleFilterThree,
                    onTapFilter: () => widget.onTapSelectFilter3?.call(),
                  ),
                  const Spacer(),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        widget.searchController?.text = '';

                        widget.onRefresh?.call();
                      },
                      child: Container(
                        width: 30.h,
                        height: 30.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.colorF3EFEA,
                        ),
                        child: Center(
                          child: CImage(
                            width: 16.h,
                            height: 16.h,
                            assetsPath: AppAssets.icReset,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : (widget.widgetReplaceFilter ?? const SizedBox()),
        widget.isFilter == true ? SizedBox(height: 11.h) : const SizedBox(),
      ],
    );
  }
}
