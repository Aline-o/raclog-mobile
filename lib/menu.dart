import 'package:flutter/material.dart'; // importação básica 
import 'telaExercicio.dart'; // arquivo da tela telaExercicio
import 'manutencao.dart'; // arquivo da tela manutencao


/*Classe TelaMenu.
* Ela vem depois do Login.
*/
// para chamar, utiliza-se o TelaMenu, não o _TelaMenuState
class TelaMenu extends StatefulWidget {
  @override
  _TelaMenuState createState() => _TelaMenuState();
}

// padrão da linguagem para classes do tipo State. Classe de implementação.
class _TelaMenuState extends State<TelaMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: meuMenu(),
      ),
    );
  }

  // texto MENU
  Text textoMenu() {
    return Text(
      "Menu".toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 45.0,
          //#D32158 hex da cor. Obs: o OxFF substitui o #.
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
      ),
    );
  }

  // botao 1° ano.
  btn1ANO(BuildContext context) {
    return RaisedButton(
      // cor do botão.
      color: Colors.lightBlue[400],
      // cor de quando aperta e segura, tem um efeito.
      splashColor: Colors.blueGrey,
      // cor do texto.
      textColor: Colors.white,
      // sombra do botão.
      elevation: 15.0,
      // deixa as beiradas arredondadas.
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      // dá um espaço entre o texto e as bordas do botão.
      padding: EdgeInsets.all(8.0),
      // texto do botão.        
      child: Text("  1° ANO  ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      
      // quando pressionado, chama a página telaExercicio.
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TelaExercicio()));
      }
    );
  }
  // botao 2° ano.
  btn2ANO(BuildContext context) {
    return RaisedButton(
      // cor do botão.
      color: Colors.cyan[800],
      // cor de quando aperta e segura, tem um efeito.
      splashColor: Colors.blueGrey,
      // cor do texto.
      textColor: Colors.white,
      // sombra do botão.
      elevation: 15.0,
      // deixa as beiradas arredondadas.
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      // dá um espaço entre o texto e as bordas do botão.
      padding: EdgeInsets.all(8.0),
      // texto do botão.        
      child: Text("  2° ANO  ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      
      // quando pressionado, chama a página manutencao.
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Manutencao()));
      }
    );
  }
  // botao 3° ano.
  btn3ANO(BuildContext context) {
    return RaisedButton(
      // cor do botão.
      color: Colors.cyan[800],
      // cor de quando aperta e segura, tem um efeito.
      splashColor: Colors.blueGrey,
      // cor do texto.
      textColor: Colors.white,
      // sombra do botão.
      elevation: 15.0,
      // deixa as beiradas arredondadas.
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      // dá um espaço entre o texto e as bordas do botão.
      padding: EdgeInsets.all(8.0),
      // texto do botão.        
      child: Text("  3° ANO  ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      
      // quando pressionado, chama a página manutencao.
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Manutencao()));
      }
    );
  }

  // icone de ajuda, serve como um tutorial para ajudar o usuario.
  IconButton btnAjuda() {
    return IconButton(
      // exibe o ícone de "?" para ajuda.
      icon: Icon(Icons.help),
      color: Colors.white,
      // quando pressiona e segura, ele exibe uma descrição.
      tooltip: 'Ajuda',

      // quando pressionado, exibe o dialogo do tutorial.
      onPressed: () {
        mensagemTutorial();
      },
    );
  }

  void mensagemTutorial() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog.
        return AlertDialog(
          backgroundColor: Colors.cyan,
          // título.
          title: new Text(
            "Tutorial",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // conteúdo.
          content: new Text(
            "Bem-vindo ao RAC LOG, um jogo educativo de raciocínio lógico.\nPara jogar, selecione a série desejada no menu.Cada série tem conteúdos equivalentes aos conteúdos aprendidos na escola.A cada questão, a dificuldade é aumentada.O personagem principal tem cinco vidas, e perde uma a cada resposta errada; se chegar a zero, é game over.",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.justify,
          ),
          actions: <Widget>[
            // define os botões na base do dialogo.
            new FlatButton(
              child: new Text("Fechar"),
              textColor: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // tela em si. Aqui é organizado onde cada elemento ficará situado.
  Widget meuMenu() {
    // safearea é utilizado para não sobrepor a barra de notificações nativa do celular.
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.cyan,
          // utilizamos coluna para alinhar os elementos.
          child: Column(
            // alinhamento. Estende os elementos horizontalmente.
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // alinhamento. Dá um espaçamento vertical entre os elementos.
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: <Widget>[
              // linha para exibir o texto RacLog e o botão(ícone) de ajuda.
              Row(
                // alinhamento à direita. Coloca no final da linha.
                mainAxisAlignment: MainAxisAlignment.end,
                // alinhamento. Estende a linha o máximo possível.
                mainAxisSize: MainAxisSize.max,
                // aqui que exibe o texto RacLog e o botão(ícone) de ajuda.
                children: [
                  Text("RAC LOG", style: TextStyle(color: Colors.white)),
                  btnAjuda(),
                ],
              ),

              // gif do livro.
              Image.asset("images/livro_magico.gif"),

              // linha que exibe o texto MENU.
              Row(
                // alinhamento. Centraliza.
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textoMenu(),
                ],
              ),

              // botões das séries.
              btn1ANO(context),
              btn2ANO(context),
              btn3ANO(context),
            ],
          )
        )
      )
    );
  }
}