import 'package:flutter/material.dart'; // importação básica 
import 'menu.dart'; // arquivo da tela menu
import 'dart:async'; // biblioteca de tempo


/*Classe SplashInicio, ela é chamada pelo Main.
* É literalmente a primeira tela a ser exibida.
*/
// para chamar, utiliza-se o SplashInicio, não o _SplashInicioState
class SplashInicio extends StatefulWidget {
  @override
  _SplashInicioState createState() => _SplashInicioState();
}

// padrão da linguagem para classes do tipo State. Classe de implementação.
class _SplashInicioState extends State<SplashInicio> {
  @override
  void initState() {
    super.initState();

    // duração de 3 segundos de exibição.
    Future.delayed(
      Duration(seconds: 3),() 
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaMenu()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    BuildContext contexto = context;
    return Scaffold(
      body: Container(
        child: layoutSplashInicio(contexto),
      ),
    );
  }

  imagemSplashInicio() {
    return SizedBox.expand(
      child: Image.asset(
        "images/inicio-raclog.png",
        height: 300,
        width: 300,
        fit: BoxFit.cover,
      ),
    );
  }

  Text textoRacLogSplashInicio() {
    return Text(
        "RAC\nLOG",
        style: TextStyle(
          fontSize: 70.0,
          color: Color(0xffD32158),
          fontWeight: FontWeight.bold,
        ),
    );
  }

  // tela em si. Aqui é organizado onde cada elemento ficará situado.
  Widget layoutSplashInicio(BuildContext context) {
    /*Com o Stack, você pode sobrepor um elemento ao outro, 
    * posicionando-os ao seu gosto na tela.
    */
    return Stack(
      children: <Widget>[
        Container(
          child: imagemSplashInicio(),
        ),
        Positioned(
          right: 35.0,
          bottom: 100.0,
          child: Container(
            child: textoRacLogSplashInicio(),
          ),
        ),
      ],
    );
  }
}
