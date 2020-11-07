import 'package:flutter/material.dart'; // importação básica 
import 'menu.dart'; // arquivo da tela menu

class Manutencao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: layoutManutencao(context),
      ),
    );
  }

  imagemManutencao() {
    return SizedBox.expand(
      child: Image.asset(
        "images/olhosabertoss.png",
        height: 300,
        width: 300,
        fit: BoxFit.contain,
      ),
    );
  }

  // botao que volta para o menu.
  btnVoltarMenu(BuildContext context) {
    return RaisedButton(
      // cor do botão.
      color: Colors.black,
      // cor de quando aperta e segura, tem um efeito.
      splashColor: Color(0xffD32158),
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

  Text textoManutencao() {
    return Text(
      "Estamos\nDesenvolvendo",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40.0,
        color: Color(0xffD32158),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // tela em si. Aqui é organizado onde cada elemento ficará situado.
  Widget layoutManutencao(BuildContext context) {

    /*Com o Stack, você pode sobrepor um elemento ao outro, 
    * posicionando-os ao seu gosto na tela.
    */
    return Stack(
      children: <Widget>[
        Container(
          child: imagemManutencao(),
        ),
        Align(
          // alinhamento. Deixa centralizado na parte de parte de baixo.
          alignment: Alignment.bottomCenter,
          child: Container(
            child: btnVoltarMenu(context),
          ),
        ),
        Positioned(
          bottom: 75,
          /*left e right no zero é pra centralizar o texto horizontalmente.
          * Não adianta definir como Center, pois estamos no Positioned.
          */
          right: 0,
          left: 0,
          child: Container(
            child: textoManutencao(),
          ),
        ),
      ],
    );
  }
}