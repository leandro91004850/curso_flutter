import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  const Questao(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto, 
      style: const TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
      );
  }
}