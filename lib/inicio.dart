import 'package:flutter/material.dart';
import 'normaltela.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  // Fields in a Widget subclass are always marked "final".
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "widgets básicos",
        theme: ThemeData(primaryColor: Colors.blue),
        home: TelaInicial());
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BuildContext contexto = context;
    return Scaffold(
      body: Container(
        child: layoutInicio(contexto),
      ),
    );
  }

  imagemInicio() {
    return SizedBox.expand(
      child: Image.asset(
        "images/inicio-raclog.png",
        height: 300,
        width: 300,
        fit: BoxFit.cover,
      ),
    );
  }

  botaoIniciar(BuildContext context) {
    return RaisedButton(
        color: Colors.black,
        elevation: 15.0,
        splashColor: Colors.red,
        textColor: Colors.white,
        child: Text("            INICIAR           ",
            style: TextStyle(height: 2, fontSize: 30)),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NormalTela()));
        });
  }

  void exibirTexto(String msg) {
    print(msg);
  }

  Center textoRacLogInicio() {
    return Center(
      child: Text(
        "RAC\nLOG",
        style: TextStyle(
          fontSize: 70.0,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget layoutInicio(BuildContext context) {
    BuildContext contexto2 = context;
    return Stack(
      children: <Widget>[
        Container(
          child: imagemInicio(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: botaoIniciar(contexto2),
          ),
        ),
        Positioned(
          right: 35.0,
          bottom: 100.0,
          child: Container(
            child: textoRacLogInicio(),
          ),
        ),
      ],
    );
  }
}
