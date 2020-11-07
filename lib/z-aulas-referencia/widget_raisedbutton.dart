import 'package:flutter/material.dart';

widgetButton() {
  return RaisedButton(
      color: Colors.red,
      elevation: 20.0,
      textColor: Colors.white,
      child: Text("Ok"),
      onPressed: () => exibirTexto('pressionado'));
}

void exibirTexto(String msg) {
  print(msg);
}
