import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:espot_power/common/index.dart';
import 'package:espot_power/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';

class CDropdownWidget extends StatelessWidget {
  final List<String>? listOptionSelect;
  final void Function(String?)? onChanged;

  final Widget? customButtonDropdown;

  const CDropdownWidget({
    super.key,
    this.listOptionSelect,
    this.onChanged,
    this.customButtonDropdown,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      onChanged: onChanged,
      underline: const SizedBox.shrink(),
      customButton: customButtonDropdown,
      items: listOptionSelect?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: CText(
            text: value,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.left,
            textColor: AppColors.color212121.withOpacity(0.6),
            textOverflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        //offset: const Offset(-20, 0),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(40),
          thickness: MaterialStateProperty.all(6),
          thumbVisibility: MaterialStateProperty.all(true),
        ),
      ),
    );
  }
}
