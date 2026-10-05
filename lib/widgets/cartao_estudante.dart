/*
  ==============================================================
  Projeto: dartpedia001 / Flutter
  Arquivo: lib/widgets/cartao_estudante.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Exercício 01: Fundo verde claro e ícones na cor Colors.green.
    - Exercício 02: Row com status de matrícula (Icons.check_circle).
    - Exercício 03: CircleAvatar com NetworkImage na propriedade foregroundImage.
    - Exercício 05: Padding interno extra de 8px na Column.
    - Exercício 06: Rodapé com ElevatedButton "Validar Carteirinha".
    - Exercício 07: Componentização em widget customizado CartaoEstudante.
  ==============================================================
*/

import 'package:flutter/material.dart';

class CartaoEstudante extends StatelessWidget {
  final String nome;
  final String curso;
  final String email;
  final String status;
  final String imageUrl;

  const CartaoEstudante({
    super.key,
    this.nome = 'Aluno SENAI',
    this.curso = 'Desenvolvimento de Sistemas',
    this.email = 'aluno@senai.br',
    this.status = 'Status: Matriculado / Ativo',
    this.imageUrl = 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Exercício 01: Cor de fundo verde leve
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.shade200),
      ),
      // Exercício 05: Padding extra de 8 pixels (16 + 8 de espaçamento interno)
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Exercício 03: CircleAvatar com imagem real via NetworkImage
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green.shade100,
              foregroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 12),
            Text(
              nome,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              curso,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
            const Divider(height: 24, thickness: 1),
            // E-mail
            Row(
              children: [
                // Exercício 01: Ícone na cor Colors.green
                const Icon(Icons.email, color: Colors.green, size: 20),
                const SizedBox(width: 8),
                Text(email),
              ],
            ),
            const SizedBox(height: 8),
            // Exercício 02: Situação da matrícula
            Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 20),
                const SizedBox(width: 8),
                Text(
                  status,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Exercício 06: Rodapé com botão de validação
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Ação em branco
                },
                child: const Text('Validar Carteirinha'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
