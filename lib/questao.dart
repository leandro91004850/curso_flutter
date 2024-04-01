import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  const Questao(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //margin: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 40, bottom: 10, left: 20, right: 20),
      child: Text(
        texto, 
        style: const TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
        ),
    );
  }
}