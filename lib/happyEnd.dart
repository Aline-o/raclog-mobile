import 'package:flutter/material.dart'; // importação básica 
import 'menu.dart'; // arquivo da tela menu

class FinalFeliz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Container(
        child: layoutFinalFeliz(context),
      ),
    );
  }

  imagemFeliz() {
    return SizedBox.expand(
      child: Image.asset(
        "images/balao.png",
        height: 300,
        width: 300,
        fit: BoxFit.cover,
      ),
    );
  }

  // botao que volta para o menu.
  btnVoltarMenu(BuildContext context) {
    return RaisedButton(
      // cor do botão.
      color: Colors.cyan,
      // cor de quando aperta e segura, tem um efeito.
      splashColor: Colors.blue,
      // cor do texto.
      textColor: Colors.white,
      // sombra do botão.
      elevation: 15.0,
      // dá um espaço entre o texto e as bordas do botão.
      padding: EdgeInsets.all(8.0),
      
      // texto do botão.  
      child: Text("   VOLTAR   ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      // quando pressionado, chama a página menu.
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TelaMenu()));
      }
    );
  }

  Text textoFeliz() {
    return Text("Parabéns!\nVOCÊ VENCEU",
    textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.0,
        color: Color(0xffD32158),
        fontWeight: FontWeight.bold,

        // DIFERENCIAL! Traço branco contornando o texto para dar um efeito de luminosidade
        shadows: [
          Shadow(
              // bottomLeft
              offset: Offset(-1.5, -1.5),
              color: Colors.white),
          Shadow(
              // bottomRight
              offset: Offset(1.5, -1.5),
              color: Colors.white),
          Shadow(
              // topRight
              offset: Offset(1.5, 1.5),
              color: Colors.white),
          Shadow(
              // topLeft
              offset: Offset(-1.5, 1.5),
              color: Colors.white),
        ]
      )
    );
  }

  // tela em si. Aqui é organizado onde cada elemento ficará situado.
  Widget layoutFinalFeliz(BuildContext context) {

    /*Com o Stack, você pode sobrepor um elemento ao outro, 
    * posicionando-os ao seu gosto na tela.
    */
    return Stack(
      children: <Widget>[
        Container(
          child: imagemFeliz(),
        ),
        Align(
          // alinhamento. Deixa centralizado na parte de parte de baixo.
          alignment: Alignment.bottomCenter,
          child: Container(
            child: btnVoltarMenu(context),
          ),
        ),
        Positioned(
          bottom: 260.0,
          /*left e right no zero é pra centralizar o texto horizontalmente.
          * Não adianta definir como Center, pois estamos no Positioned.
          */
          right: 0,
          left: 0,
          child: Container(
            child: textoFeliz(),
          ),
        ),
      ],
    );
  }
}