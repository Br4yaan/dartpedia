/*
  ==============================================================
  Projeto: dartpedia001 / Flutter
  Arquivo: lib/main.dart
  Versão: 0.0.16
  Descritivo do Código:
    - Integração da bateria de exercícios com DesafioListaScreen.
  ==============================================================
*/

import 'package:flutter/material.dart';
import 'desafio_lista.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bateria de Exercícios',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const DesafioListaScreen(),
    );
  }
}
