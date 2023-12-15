import 'package:espot_power/common/index.dart';
import 'package:espot_power/features/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late NotificationCubit notificationCubit;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    notificationCubit = BlocProvider.of<NotificationCubit>(context);
    notificationCubit.initData();

    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void _loadMoreItems() {
    notificationCubit.getNotifications();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // You have reached the end of the list, load more items
      _loadMoreItems();
    }
  }

  List<String> listTabNotification = [
    LocaleKeys.synthetic_title.tr(),
    LocaleKeys.order.tr(),
    LocaleKeys.surplus_account.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      buildWhen: (previous, current) =>
          previous.onGetNotification != current.onGetNotification,
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(height: 58),
            Center(
              child: CText(
                text: LocaleKeys.notification_title.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                height: 28,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: ListView.builder(
                    itemCount: listTabNotification.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final item = listTabNotification[index];
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            notificationCubit.emitSelectTab(index);
                          },
                          child: Column(
                            children: [
                              CText(
                                text: item,
                                fontSize: 14,
                                textColor: state.indexTab == index
                                    ? AppColors.colorText231F20
                                    : AppColors.color979797,
                              ),
                              const Spacer(),
                              Container(
                                height: 2,
                                width: 111,
                                color: state.indexTab == index
                                    ? AppColors.colorFFCB08
                                    : AppColors.white,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  child: (() {
                    if (state.notificationsReponseDisplay?.isNotEmpty ?? true) {
                      return ListView(
                          controller: _scrollController,
                          padding: EdgeInsets.zero,
                          children: (state.notificationsReponseDisplay ?? [])
                              .map(
                                (element) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ItemNotificationWidget(
                                    item: element,
                                  ),
                                ),
                              )
                              .toList());
                    }
                    return _buildNotificationBlank();
                  }()),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNotificationBlank() => Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CImage(
              assetsPath: AppAssets.imgNotificationBlank,
            ),
            const SizedBox(height: 24),
            CText(
              text: LocaleKeys.no_new_notify.tr(),
              fontSize: 20,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.colorText514D56,
                    wordSpacing: 1.82,
                    height: 1.2,
                    fontFamily: AppFonts.svnGotham,
                  ),
                  children: [
                    TextSpan(
                      text: '${LocaleKeys.espot.tr()} ',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: LocaleKeys.upgrade_notification.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
