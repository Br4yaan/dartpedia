/*
  ==============================================================
  Projeto: dartpedia001 / Flutter
  Arquivo: lib/screens/desafio_grid.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Exercício 08: Refatoração da seção de estatísticas para GridView.count (Grade 2x2 com 4 cards).
  ==============================================================
*/

import 'package:flutter/material.dart';
import '../widgets/bloco_estatistica.dart';

class DesafioGridScreen extends StatelessWidget {
  const DesafioGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade de Estatísticas (2x2)'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Exercício 08: GridView.count com 2 colunas e 4 cards
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: const [
            BlocoEstatistica(
              icone: Icons.article,
              valor: '120',
              legenda: 'Artigos',
            ),
            BlocoEstatistica(
              icone: Icons.star,
              valor: '4.8',
              legenda: 'Avaliação',
              corIcone: Colors.amber,
            ),
            BlocoEstatistica(
              icone: Icons.camera_alt,
              valor: '45',
              legenda: 'Fotos',
              corIcone: Colors.green,
            ),
            BlocoEstatistica(
              icone: Icons.people,
              valor: '1.2k',
              legenda: 'Usuários',
              corIcone: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
