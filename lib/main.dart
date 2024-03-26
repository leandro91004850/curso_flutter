import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatelessWidget {

  var perguntaSelecionada = 0;

  String responder() {
    perguntaSelecionada++;
    return '$perguntaSelecionada - Pergunta respondida';
  }

  @override
  Widget build(BuildContext context) {
    bool botaoclicado = false;

    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          title: const Text('Perguntas'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 70, 141, 80),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[0]),
            ElevatedButton(
              child: const Text('Resposta 1'),
              onPressed: () => print('Resposta 1'),
            ),
            ElevatedButton(
              child: const Text('Resposta 2'),
              onPressed: () => print('Resposta 2'),
            ),
            ElevatedButton(
              child: const Text('Resposta 3'),
              onPressed: () => print(responder()),
            ),
          ],
        ),
      ),
    );
  }
}
