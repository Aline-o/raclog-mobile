import 'package:flutter/material.dart'; // importação básica 
import 'dart:math'; // biblioteca matemática
import 'dart:async'; // biblioteca de tempo
import 'gameOver.dart'; // arquivo da tela gameOver
import 'happyEnd.dart'; // arquivo da tela happyEnd


/*Classe TelaExercicio, ela é chamada pelo Menu
* na opção 1° ano.
* É atualizada para ter todos os exercicios nela.
*/
// para chamar, utiliza-se o TelaExercicio, não o _TelaExercicioState
class TelaExercicio extends StatefulWidget { 
  @override
  _TelaExercicioState createState() => _TelaExercicioState();
}


// padrão da linguagem para classes do tipo State. Classe de implementação.
class _TelaExercicioState extends State<TelaExercicio> {

  // variáveis usadas pela aplicação:
  // obs: se tiver um _ antes, significa que é privada.


  /*armazena o numero aleatorio que é atualizado toda vez que uma 
  * conta eh chamada.
  */
  int _numeroAleatorio; 

  /*usado para ver em qual fase está. Se incrementar, vai para a
  * prox fase, senão, repete a conta com novos valores atualizados 
  * pelo _numeroAleatorio
  */
  int _qualFase=0; 

  // resultado correto da conta
  int _resultadoCerto; 

  // texto que exibe a conta na tela
  String _calcule; 

  /*texto que fica na AppBar, na parte de cima da tela. Informa
  * em qual questão está.
  */
  String _textoAppBarQuestao;

  // Vidas do jogador. É decrementado toda vez que erra.
  int _vida=5; 

  // armazena o input do jogador, a resposta que ele insere
  TextEditingController respostaPlayer = TextEditingController();




// funções e métodos usadas pela parte lógica da aplicação:
  
  // gera um numero aleatorio
  int gerarNumeroAleatorio() {
    /*parecido com Get Set do Java, altera o valor da variavel 
    * de uma forma mais segura.
    */
    setState(() { 
      Random numeroAleatorio = new Random();
      // os numeros aleatorios vão de zero a dez
      _numeroAleatorio = numeroAleatorio.nextInt(10); 
    });
    return _numeroAleatorio;
  }

  /*método para saber em qual fase o player está.
  * O parâmetro informa qual fase deverá ser chamada 
  * para atualizar as contas.
  * obs: Para exibir a tela de GAMEOVER ou HAPPYEND, é 
  * feito um ifElse no método CONFERE.
  */
  void fases(int conta) { 
    if (conta == 1) { // caso venha o valor 1 como parametro
      conta1(); // ele chama conta1
    } else if (conta == 2) {
      conta2();
    } else if (conta == 3) {
      conta3();
    }
  }

  /* metodo conta1. Tudo o que é feito nesse método,
  * se repete no conta2 e conta3, com a diferença 
  * que conta1 é soma, conta2 é subtração, e conta3
  * é multiplicação. Não inserimos divisão pois
  * teria que ser usado um float ou double, estamos 
  * utilizando somente int.
  */
  void conta1() {
    // gera dois numeros aleatorios, x e y.
    int x = gerarNumeroAleatorio();
    int y = gerarNumeroAleatorio();

    /*parecido com Get Set do Java, altera o valor da variavel 
    * de uma forma mais segura.
    */
    setState(() {
      _textoAppBarQuestao = "Questão 1";
      _calcule = "Quanto é $x + $y ?";
      _resultadoCerto = x + y;
    });
  }

  void conta2() {
    int x = gerarNumeroAleatorio();
    int y = gerarNumeroAleatorio();
    setState(() {
      _textoAppBarQuestao = "Questão 2";
      _calcule = "Quanto é $x - $y ?";
      _resultadoCerto = x - y;
    });
  }

  void conta3() {
    int x = gerarNumeroAleatorio();
    int y = gerarNumeroAleatorio();
    setState(() {
      _textoAppBarQuestao = "Questão 3";
      _calcule = "Quanto é $x x $y ?";
      _resultadoCerto = x * y;
    });
  }

  // confere se a resposta do usuario está correta.
  void confere(TextEditingController respostaPlayer, int resultado) {
    
    /*Converte o input do usuario para um número inteiro,
    * para poder ser comparado com a resposta certa.
    * respostaPlayer.text converte primeiramente para 
    * uma string, e depois é convertido para inteiro
    * com o parse.
    */
    int res = int.parse(respostaPlayer.text);

    // se a resposta estiver certa
    if (res == resultado) {
      setState(() {
        // incrementa a variavel.
        ++_qualFase;
      });
      // se ainda não chegou na ultima fase (são 3 fases)
      if (_qualFase < 4) {
        // exibe uma mensagem dizendo que está certo
        alertDialogCorreto(context);
        // e vai para a próxima fase.
        fases(_qualFase);

        // se estiver na última fase
      } else {
        // ele chama a tela de HAPPYEND.
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FinalFeliz()));
      }

    // se a resposta estiver errada
    } else {
      setState(() {
        // perde uma vida.
        --_vida;
      });
      
      // enquanto ainda tiver vida
      if (_vida > 0) {
        // exibe uma mensagem dizendo que está errado.
        alertDialogErrado(context);
        /*chama novamente a mesma conta, com valores atualizados,
        * pois a variavel _qualFase não foi incrementada nesse
        * caso.
        */
        fases(_qualFase);

      // se a vida chegar em zero
      } else {
        // ele chama a tela de GAMEOVER.
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FimDeJogo()));
      }
    }
  }




// funções e métodos usadas pela aparência da aplicação:

// método alertDialogCorreto é uma mensagem alertDialog da Resposta Correta.
  alertDialogCorreto(BuildContext context) {
    // configura o AlertDialog.
    AlertDialog alerta = AlertDialog(
      // cor de fundo.
      backgroundColor: Colors.cyan,
      // título.
      title: Text("Parabéns", textAlign: TextAlign.center),
      /*body, conteudo do alert.
      * Para usar imagens no programa, precisa alterar o
      * arquivo pubspec.yaml, ir adicionando cada imagem ao
      * assets. Cuidado com o espaço e identação lá, precisa
      * estar tudo certo pra funcionar, ele é bem chatinho.
      *
      * Exemplo:
      *
      assets:
        - images/certo.jpg
        - images/errado.jpg
      *
      */
      content: Image.asset("images/certo.jpg")
    );

    // exibe o dialog.
    showDialog(
      barrierColor: Colors.cyan,
      // bloqueia o usuário de fechar o dialog por conta propria.
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // duração de 3 segundos de exibição.
        Future.delayed(Duration(seconds: 3)).then((v) {
          Navigator.of(context).pop();
        });
        return alerta;
      },
    );
  }

// método alertDialogErrado é uma mensagem alertDialog da Resposta Errada.
// mesmas configurações que o alertDialogCorreto.
  alertDialogErrado(BuildContext context) {
    AlertDialog alerta = AlertDialog(
      backgroundColor: Colors.cyan,
      title: Text("Resposta Errada", textAlign: TextAlign.center),
      content: Image.asset("images/errado.jpg")
    );
    showDialog(
      barrierColor: Colors.cyan,
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3)).then((v) {
          Navigator.of(context).pop();
        });
        return alerta;
      },
    );
  }

  /*metodo utilizado no botao confere, chama o metodo que 
  * verifica se a resposta do usuario está correta e 
  * limpa a caixa de input da resposta do jogador.
  */
  confereLimpa() {
    // confere se esta certo.
    confere(respostaPlayer, _resultadoCerto);

    setState(() {
      // limpa a caixa de input.
      respostaPlayer.clear();
    });
  }

  // botão Conferir.
  btnConferir() {
    return RaisedButton(
      // cor do botão.
      color: Colors.black,
      // cor de quando aperta e segura, tem um efeito.
      splashColor: Colors.indigo,
      // cor do texto.
      textColor: Colors.white,
      // sombra do botão.
      elevation: 15.0,
      // deixa as beiradas arredondadas.
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      // dá um espaço entre o texto e as bordas do botão.
      padding: EdgeInsets.all(8.0),
      // texto do botão.
      child: Text("  Conferir  ", style: TextStyle(fontSize: 30)),

      // quando pressionado, chama o método confereLimpa.
      onPressed: () => confereLimpa(),
    );
  }

  // linha que exibe na tela quantas vidas restantes.
  Row vidas() {
    return Row(children: <Widget>[
      /*ícone de coração. Assim como imagem, precisa 
      * alterar o pubspec.yaml, mas na linha de 
      * uses-material-design: true .
      */
      Icon(Icons.favorite, color: Color(0xffD32158), size: 25),
      // texto informando quantas vidas ainda tem.
      Text(" $_vida Vidas Restantes",
          style: TextStyle(color: Color(0xffD32158), fontSize: 17.0)),
    ]);
  }

  // exibe na tela os textos das contas. "Quanto é 1 + 5" por exemplo.
  Center txtCalcule() {
    return Center(
      child: Text(
        "$_calcule",
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: layoutExercicio(),
      ),
    );
  }

  // tela em si. Aqui é organizado onde cada elemento ficará situado.
  Widget layoutExercicio() {
    /*Caso o programa tenha acabado de iniciar,
    * ele chama a conta1.
    */
    if (_qualFase == 0) {
      ++_qualFase;
      fases(_qualFase);
    }

    return Scaffold(
      // fundo transparente para que a imagem seja exibida.
      backgroundColor: Colors.transparent,
      // fica no topo da tela, é exibido qual fase está.
      appBar: new AppBar(
        title: new Text(
          "$_textoAppBarQuestao",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0x44000000),
      ),
      /*A altura do body é estendida para incluir a altura da barra
      * de aplicativos e a parte superior do corpo será alinhada com
      * a parte superior da barra de aplicativos.
      */
      extendBodyBehindAppBar: true,
      // conteúdo.
      body: Container(
        color: Colors.cyan,
        // utilizamos coluna para alinhar os elementos.
        child: Column(
          // alinhamento. Estende os elementos horizontalmente.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          /*alinhamento. Dá um espaçamento vertical entre os elementos,
          * incluindo o topo e final da página.
          */
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: <Widget>[
            // gif de espera do monstro.
            Image.asset("images/normal1.gif"),
            // ícone coração e quantidade de vidas restantes.
            vidas(),
            // texto da conta. "Quanto é 1 + 3?" por exemplo.
            txtCalcule(),
            // caixa do input do player, para ele inserir a resposta.
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Insira o resultado",
                labelStyle: TextStyle(color: Colors.black54)
              ),
              textAlign: TextAlign.center,
              cursorColor: Colors.white12,

              // estilizando o texto da resposta inserida pelo Usuario.
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0
              ), 
              controller: respostaPlayer,
            ),
            // botão conferir.
            btnConferir(),
          ],
        )
      )
    );
  }
}