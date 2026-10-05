/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/wiki_command.dart
  Versão: 0.0.1
  Descritivo do Código:
    - Lição 08: Refatoração para usar StringBuffer na montagem do resultado e sendOutput para flexibilidade.
  ==============================================================
*/

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_command.dart';
import 'command_type.dart';

class WikiCommand extends BaseCommand {
  WikiCommand({super.format, super.onOutput});

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
          sendOutput(jsonEncode({'title': data['title'], 'extract': data['extract']}));
        } else {
          final buffer = StringBuffer();
          buffer.writeln('--- ${data['title']} ---');
          buffer.writeln(data['extract'] ?? 'Nenhum resumo disponível.');
          buffer.writeln('-----------------------');
          sendOutput(buffer.toString());
        }
      } else {
        sendOutput('Erro HTTP ${response.statusCode}: Não foi possível obter o artigo.');
      }
    } catch (e) {
      sendOutput('Erro de conexão ao executar comando: $e');
    }
  }
}
