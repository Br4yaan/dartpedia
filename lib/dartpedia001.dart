/*
  ==============================================================
  Projeto: dartpedia001 / Flutter
  Arquivo: lib/main.dart
  Versão: 0.0.17
  Descritivo do Código:
    - Inicialização com navegação para a tela da Aula 04.
  ==============================================================
*/

import 'package:flutter/material.dart';
import 'screens/layout_screen.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aula 04 - Layout Widgets',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const LayoutScreen(),
    );
  }
}
