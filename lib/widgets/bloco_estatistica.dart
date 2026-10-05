/*
  ==============================================================
  Projeto: dartpedia001 / Flutter
  Arquivo: lib/widgets/bloco_estatistica.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Exercício 01: Card de estatística com ícone, valor e legenda.
    - Exercício 07: Componentização do widget em arquivo separado.
  ==============================================================
*/

import 'package:flutter/material.dart';

class BlocoEstatistica extends StatelessWidget {
  final IconData icone;
  final String valor;
  final String legenda;
  final Color? corIcone;

  const BlocoEstatistica({
    super.key,
    required this.icone,
    required this.valor,
    required this.legenda,
    this.corIcone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icone, size: 30, color: corIcone ?? Colors.blue),
            const SizedBox(height: 6),
            Text(
              valor,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              legenda,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
