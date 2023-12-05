import 'package:bas_clean_architecture/common/index.dart';
import 'package:bas_clean_architecture/index.dart';
import 'package:bas_clean_architecture/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin ExtMixin {
  Future<String> showDateTimePicker(BuildContext context,
      {String? typeFormat, DateTime? firstDate}) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate ?? DateTime(1950),
      lastDate: DateTime(2050),
    );
    if (date == null) return '';
    DateTime dateTime = DateTime.parse(date.toString());
    String formattedDate =
        DateFormat(typeFormat ?? 'dd-MM-yyyy').format(dateTime);
    return formattedDate;
  }

  void showCupertinoTimePicker(
    BuildContext context,
    Function(String date) onSelectedDate,
  ) async {
    DateTime? pickedDateTime = DateTime.now();
    await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            const Spacer(),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      onSelectedDate.call(
                          "${pickedDateTime?.hour}:${pickedDateTime?.minute}");
                      Navigator.pop(context);
                    },
                    child: const CText(
                      textColor: AppColors.brick,
                      text: 'Done',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 300.0,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  pickedDateTime = newDateTime;
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<String> timePicker(BuildContext context) async {
    final TimeOfDay? timePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return timePicked.toString();
  }
}
