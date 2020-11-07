import 'package:flutter/material.dart';
//import 'metodos.dart';
import 'dart:math';

class NormalTela extends StatefulWidget {
  @override
  _NormalTelaState createState() => _NormalTelaState();
}

class _NormalTelaState extends State<NormalTela> {
  int _numero1;
  int _resultado;
  String _calcule;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController resultPlayer = TextEditingController();

  int gerarNumero() {
    setState(() {
      Random numeroAleatorio = new Random();
      _numero1 = numeroAleatorio.nextInt(10);
    });
    return _numero1;
  }

  void conta1() {
    int x = gerarNumero();
    int y = gerarNumero();

    setState(() {
      _calcule = "Quanto eh $x + $y ?";
      _resultado = x + y;
    });
  }

  void conta2() {
    int x = gerarNumero();
    int y = gerarNumero();

    setState(() {
      _calcule = "Quanto eh $x - $y ?";
      _resultado = x - y;
    });
  }

  void confere(TextEditingController resultPlayer, int resultado) {
    int res = int.parse(resultPlayer.text);
    if (res == resultado) {
      print("resposta certa");
    } else {
      print("errooooouuu");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: lytExercicio(),
      ),
    );
  }

  imagemNormal() {
    return SizedBox.expand(
      child: Image.asset(
        "images/normal1.gif",
        height: 200,
        width: 200,
        fit: BoxFit.contain,
      ),
    );
  }

  btnEnviar() {
    return RaisedButton(
        color: Colors.black,
        elevation: 15.0,
        splashColor: Colors.red,
        textColor: Colors.white,
        child: Text("            CONFERIR            ",
            style: TextStyle(height: 2, fontSize: 30)),
        onPressed: () => confere(resultPlayer, _resultado));
  }

  Center txtCalcule() {
    return Center(
      child: Text(
        "$_calcule",
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget lytExercicio() {
    conta1();
    return Stack(
      children: <Widget>[
        Container(
          child: imagemNormal(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: btnEnviar(),
          ),
        ),
        Positioned(
          right: 35.0,
          bottom: 100.0,
          child: Container(
            child: txtCalcule(),
          ),
        ),
        Positioned(
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Insira o resultado",
                labelStyle: TextStyle(color: Colors.green)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25.0),
            controller: resultPlayer,
            validator: (value) {
              if (value.isEmpty) {
                return "Insira o resultado!";
              }
            },
          ),
        )
      ],
    );
  }
}
/*@override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '$_numero1',
            style: TextStyle(color: Colors.black54, fontSize: 28),
          ),
          SizedBox(height: 30),
          RaisedButton(onPressed: gerarNumero, child: Text("Gerar número"))
        ],
      ),
    );
  }*/
