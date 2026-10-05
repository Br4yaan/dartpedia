/*
  ==============================================================
  Projeto: dartpedia001 / Flutter
  Arquivo: lib/desafio_lista.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Exercício 08: Tela exibindo uma Column com 3 cartões de estudantes diferentes.
  ==============================================================
*/

import 'package:flutter/material.dart';
import 'widgets/cartao_estudante.dart';

class DesafioListaScreen extends StatelessWidget {
  const DesafioListaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carteirinhas de Estudantes'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            // Crachá Estudante 1
            CartaoEstudante(
              nome: 'Carlos Eduardo Silva',
              curso: 'Desenvolvimento de Sistemas',
              email: 'carlos.silva@senai.br',
              imageUrl: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=150',
            ),
            SizedBox(height: 16),

            // Crachá Estudante 2
            CartaoEstudante(
              nome: 'Mariana Oliveira',
              curso: 'Automação Industrial',
              email: 'mariana.oliveira@senai.br',
              imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
            ),
            SizedBox(height: 16),

            // Crachá Estudante 3
            CartaoEstudante(
              nome: 'Lucas Mendes',
              curso: 'Mecatrônica',
              email: 'lucas.mendes@senai.br',
              imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
            ),
          ],
        ),
      ),
    );
  }
}
