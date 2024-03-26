import 'package:flutter/material.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatelessWidget {
  PerguntaApp({super.key});

  @override
  Widget build(BuildContext context) {

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
            const ElevatedButton(
              child: Text('Resposta 1'),
              onPressed:null
            ),
            const ElevatedButton(
              child: Text('Resposta 2'),
              onPressed:null
            ),
            const ElevatedButton(
              child: Text('Resposta 3'),
              onPressed:null
            ),
          ], 
        ),
      ),
    );
  }
}
