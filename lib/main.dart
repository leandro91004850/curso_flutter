import 'package:curso_flutter/login_form.dart';
import 'package:curso_flutter/quiz.dart';
import 'package:flutter/material.dart';

import 'primeira_pagina.dart';
import 'segunda_pagina.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegação',
    initialRoute: '/quiz',
    routes: {
      '/': (context) => PrimeiraPagina(),
      '/segunda': (context) => SegundaPagina(),
      '/quiz': (context) => PerguntaApp(),
      '/login': (context) => const LoginPage(),
    },
  ));
}

