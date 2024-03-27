import 'package:flutter/material.dart';

import 'primeira_pagina.dart';
import 'segunda_pagina.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navegação',
    initialRoute: '/',
    routes: {
      '/': (context) => PrimeiraPagina(),
      '/segunda': (context) => SegundaPagina(),
    },
  ));
}

