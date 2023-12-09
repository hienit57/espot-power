import 'package:espot_power/common/index.dart';
import 'package:espot_power/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';

class ItemManualWidget extends StatelessWidget {
  final String? title;
  final String? content;
  final bool? isOpen;

  final VoidCallback? onTap;

  const ItemManualWidget({
    Key? key,
    this.title,
    this.content,
    this.isOpen,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
      child: CContainer(
        width: double.infinity,
        borderColor: AppColors.colorBorder,
        radius: 10,
        backgroundColor: AppColors.white,
        onTap: onTap,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CText(
                      text: title,
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      child: Icon(
                        isOpen == true
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_down_outlined,
                        color: AppColors.colorText231F20,
                        size: 16,
                      ),
                    )
                  ],
                ),
                if (isOpen == true) ...[
                  const SizedBox(height: 8),
                  Divider(
                    indent: 0,
                    endIndent: 0,
                    thickness: 1,
                    color: AppColors.colorBorder,
                  ),
                  Html(
                    data: unescape.convert(unescape.convert(content ?? '')),
                  )
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var unescape = HtmlUnescape();
