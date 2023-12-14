import 'package:espot_power/common/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/widgets.dart';

class ItemTransactionWidget extends StatelessWidget {
  final TransactionResponse? transactionResponse;

  const ItemTransactionWidget({
    super.key,
    this.transactionResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgcolorF9F9FA,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CImage(
              width: 72,
              height: 72,
              assetsPath: transactionResponse?.getImageTransaction,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CText(
                  text: transactionResponse?.getTitle,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
                const SizedBox(height: 2),
                _rowIconContent(
                  icon: AppAssets.iconOrderCodeSmall,
                  content: transactionResponse?.id,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    _rowIconContent(
                      icon: AppAssets.iconOrderCalendaSmall,
                      content: transactionResponse?.getDateCreateTransaction,
                    ),
                    const SizedBox(width: 12),
                    _rowIconContent(
                      icon: AppAssets.iconOrderDolarSmall,
                      content: transactionResponse?.getAmountTransaction,
                      contentColor: transactionResponse?.getColorAmount,
                      contentFontWeight: FontWeight.w700,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _rowIconContent({
    String? icon,
    String? content,
    Color? contentColor,
    FontWeight? contentFontWeight,
  }) =>
      Row(
        children: [
          CImage(
            assetsPath: icon,
            width: 16,
            height: 16,
            color: contentColor,
          ),
          const SizedBox(width: 4),
          CText(
            text: content,
            textAlign: TextAlign.center,
            textColor: contentColor,
            fontWeight: contentFontWeight,
          ),
        ],
      );
}
