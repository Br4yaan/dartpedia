/*
  ==============================================================
  Projeto: dartpedia001 / Flutter
  Arquivo: lib/screens/layout_screen.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Exercício 01: Row com 3 estatísticas usando Expanded (incluindo Fotos: 45).
    - Exercício 02: Column principal com CrossAxisAlignment.center.
    - Exercício 03: Seção "Últimos Registros" com MainAxisAlignment.spaceBetween.
    - Exercício 05: Selo Stack "Confirmado" no canto inferior esquerdo.
    - Exercício 06: Card de Destaque usando Card com elevation: 4.
  ==============================================================
*/

import 'package:flutter/material.dart';
import '../widgets/bloco_estatistica.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Widgets Demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        // Exercício 02: Alinhamento do eixo cruzado alterado para CrossAxisAlignment.center
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Exercício 01 & 07: Linha com 3 cards usando Expanded para proporção igual
            const Row(
              children: [
                Expanded(
                  child: BlocoEstatistica(
                    icone: Icons.article,
                    valor: '120',
                    legenda: 'Artigos',
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: BlocoEstatistica(
                    icone: Icons.star,
                    valor: '4.8',
                    legenda: 'Avaliação',
                    corIcone: Colors.amber,
                  ),
                ),
                SizedBox(width: 8),
                // Exercício 01: Terceiro Card (Fotos - 45)
                Expanded(
                  child: BlocoEstatistica(
                    icone: Icons.camera_alt,
                    valor: '45',
                    legenda: 'Fotos',
                    corIcone: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Exercício 06: Card Material com elevação 4
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // Conteúdo Principal do Card
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        const Icon(Icons.star_purple_500, size: 48, color: Colors.indigo),
                        const SizedBox(height: 8),
                        const Text(
                          'Card de Destaque',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Conteúdo em evidência no aplicativo',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),

                  // Selo Topo Direito
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('NOVO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ),

                  // Exercício 05: Selo Inferior Esquerdo "Confirmado" com fundo verde
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Confirmado',
                        style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Exercício 03: Seção "Últimos Registros" alinhada com MainAxisAlignment.spaceBetween
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.list_alt, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'Últimos Registros',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Ver Todos'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
