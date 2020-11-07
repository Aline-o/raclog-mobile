import 'package:flutter/material.dart';
import 'package:projeto1_dart/z-aulas-referencia/widget_raisedbutton.dart';

widgetRowColumn() {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [widgetButton(), widgetButton(), widgetButton()],
  );
}
