import 'package:flutter/material.dart';

import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": [
        { "texto" : "Preto", "pontuacao" : 10 }, 
        { "texto" : "Vermelho", "pontuacao" : 9 }, 
        { "texto" :  "Verde", "pontuacao" : 8  }, 
        { "texto" : "Branco", "pontuacao" : 1  },
      ], 
    },
    {
      "texto": "Qual 'e o seu animal favortio?",
      "respostas": [
        {"texto" : "Coelho", "pontuacao" : 6 },
        {"texto" : "Cobra", "pontuacao" : 5 },
        {"texto" : "Elefante", "pontuacao" : 4 },
        {"texto" : "Leão", "pontuacao" : 3 },
      ],
    },
    {
      "texto": "Qual 'e o seu instrutor favortio?",
      "respostas": [
        { "texto" : "Maria", "pontuacao" : 2 }, 
        { "texto" : "João", "pontuacao" : 1 },
        { "texto" : "Leo", "pontuacao" : 10 }, 
        { "texto" : "Pedro", "pontuacao" : 3 },
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario(){ 
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Titulo")),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
