import 'package:flutter/material.dart';

extension IntExtensions on int {
  //Screen Utils
  /// Leaves given height of space
  Widget get spaceHeight => SizedBox(height: toDouble());

  /// Leaves given width of space
  Widget get spaceWidth => SizedBox(width: toDouble());

  String padLeft([int width = 2, String padding = '0']) =>
      toString().padLeft(width, padding);
}
