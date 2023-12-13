import 'package:espot_power/common/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/cupertino.dart';

class CustomIconTabbarWidget extends StatelessWidget {
  final String? icon;
  final String? name;
  final bool? isCheck;
  const CustomIconTabbarWidget({
    super.key,
    this.icon,
    this.name,
    this.isCheck = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CImage(
          width: 24,
          height: 24,
          assetsPath: icon,
          color: isCheck == true ? AppColors.colorFFCB08 : null,
        ),
        CText(
          text: name,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textColor:
              AppColors.colorText231F20.withOpacity(isCheck == true ? 1 : 0.5),
        )
      ],
    );
  }
}
