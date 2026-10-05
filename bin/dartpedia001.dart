/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: bin/dartpedia001.dart
  Versão: 0.0.10
  Descritivo do Código:
    - Lição 03: Escreva código assíncrono.
    - Realiza requisições HTTP assíncronas usando 'http', 'async' e 'await'.
    - Busca e exibe o resumo de um artigo diretamente da API da Wikipédia.
  ==============================================================
*/

import 'dart:convert';
import 'package:http/http.dart' as http;

/// Função assíncrona para buscar resumo na Wikipédia
Future<String> buscarResumoWikipedia(String artigo) async {
  final url = Uri.parse(
    'https://pt.wikipedia.org/api/rest_v1/page/summary/${Uri.encodeComponent(artigo)}',
  );

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final extract = data['extract'] as String?;
      return extract ?? 'Nenhum resumo disponível para este artigo.';
    } else {
      return 'Erro na requisição (Código HTTP: ${response.statusCode})';
    }
  } catch (e) {
    return 'Erro ao conectar à API da Wikipédia: $e';
  }
}

Future<void> main(List<String> arguments) async {
  print('==================================================');
  print('          DARTPEDIA001 - Versão 0.0.10           ');
  print('==================================================\n');

  final termo = arguments.isNotEmpty ? arguments.first : 'Dart_(linguagem_de_programação)';

  print('Buscando informações na Wikipédia sobre: "$termo"...\n');

  final resumo = await buscarResumoWikipedia(termo);

  print('--- RESUMO WIKIPÉDIA ---');
  print(resumo);
  print('-----------------------');
}
