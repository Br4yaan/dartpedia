/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: bin/dartpedia001.dart
  Versão: 0.0.11
  Descritivo do Código:
    - Lição 04: Refatoração para usar o pacote local reutilizável 'command_runner'.
    - Consumo assíncrono da API da Wikipédia mantido.
  ==============================================================
*/

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

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
  print('          DARTPEDIA001 - Versão 0.0.11           ');
  print('==================================================\n');

  // Chamada da função vinda do pacote local 'command_runner'
  final termo = ArgsParser.obterTermoBusca(arguments);

  print('Buscando informações na Wikipédia sobre: "$termo"...\n');

  final resumo = await buscarResumoWikipedia(termo);

  print('--- RESUMO WIKIPÉDIA ---');
  print(resumo);
  print('-----------------------');
}
