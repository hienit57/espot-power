import 'package:flutter/material.dart';

typedef SeparatorWidgetBuilder = Widget? Function(int index);

extension ListWidgetExtensions on List<Widget> {
  List<Widget> separator(SeparatorWidgetBuilder creator) {
    if (this.length < 2) return this;
    final List<Widget> newList = List.from(this);
    final int length = this.length;
    for (var i = length - 2; i >= 0; i--) {
      final widget = creator.call(i);
      if (widget != null) newList.insert(i + 1, widget);
    }
    return newList;
  }
}
