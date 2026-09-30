import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if(pontuacao <= 10) {
      return "Parabéns!";
    } else if(pontuacao <= 16) {
      return "Você é bom!";
    } else if(pontuacao <= 22) {
      return "impressionante!";
    } else {
      return "Nível Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
            ),
          ),
          TextButton(
            onPressed: quandoReiniciarQuestionario,
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ), 
            child: Text(
              "Reiniciar",
            style: TextStyle(fontSize: 18),
            )
          )
      ],
    );
  }
}