import 'package:espot_power/common/index.dart';
import 'package:espot_power/models/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class ItemBankWidget extends StatelessWidget {
  final BankInformationResponse? bankInformationResponse;

  final bool? isSelected;
  final VoidCallback? onTap;

  const ItemBankWidget({
    super.key,
    this.bankInformationResponse,
    this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: CContainer(
        width: double.infinity,
        borderColor: AppColors.colorDADADA,
        radius: 10,
        backgroundColor:
            isSelected == true ? AppColors.colorFFCB08 : AppColors.white,
        borderWidth: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            children: [
              CContainer(
                width: 64,
                height: 64,
                borderColor: AppColors.colorDADADA,
                borderWidth: 1,
                radius: 10,
                child: CImage(
                  imageNetworkUrl: bankInformationResponse?.bankImageUrl,
                  boxFit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CText(
                      text: bankInformationResponse?.ownerName,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 2),
                    CText(
                      text: bankInformationResponse?.account,
                      fontSize: 13,
                    ),
                    const SizedBox(height: 2),
                    CText(
                      text: bankInformationResponse?.bankName,
                      fontSize: 13,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
