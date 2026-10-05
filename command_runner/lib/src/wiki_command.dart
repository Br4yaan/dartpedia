/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/wiki_command.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Lição 05: Classe concreta que herda de BaseCommand, sobrescrevendo atributos e o método execute().
  ==============================================================
*/

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_command.dart';
import 'command_type.dart';

class WikiCommand extends BaseCommand {
  WikiCommand({super.format});

  @override
  String get name => 'wiki';

  @override
  String get description => 'Busca e exibe o resumo de um artigo na Wikipédia.';

  @override
  Future<void> execute(List<String> args) async {
    final artigo = args.isNotEmpty ? args.join(' ') : 'Dart_(linguagem_de_programação)';
    final url = Uri.parse(
      'https://pt.wikipedia.org/api/rest_v1/page/summary/${Uri.encodeComponent(artigo)}',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;

        if (format == OutputFormat.json) {
          print(jsonEncode({'title': data['title'], 'extract': data['extract']}));
        } else {
          print('--- ${data['title']} ---');
          print(data['extract'] ?? 'Nenhum resumo disponível.');
          print('-----------------------');
        }
      } else {
        print('Erro HTTP ${response.statusCode}: Não foi possível obter o artigo.');
      }
    } catch (e) {
      print('Erro de conexão ao executar comando: $e');
    }
  }
}
