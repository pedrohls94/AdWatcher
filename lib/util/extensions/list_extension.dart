import 'package:flutter/material.dart';

extension ListExtension on List<Widget> {
  List<Widget> addSpacing({required double size}) {
    List<Widget> spacedList = [];
    SizedBox spacer = SizedBox(
      width: size,
      height: size,
    );

    for (var widget in this) {
      spacedList.add(widget);
      spacedList.add(spacer);
    }

    spacedList.removeLast();
    return spacedList;
  }
}
