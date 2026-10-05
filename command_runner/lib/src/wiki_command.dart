/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/wiki_command.dart
  Versão: 0.0.2
  Descritivo do Código:
    - Lição 12: Adição de logs de depuração (INFO, WARNING, SEVERE) na requisição HTTP.
  ==============================================================
*/

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'base_command.dart';
import 'command_type.dart';

class WikiCommand extends BaseCommand {
  final Logger _log = Logger('WikiCommand');

  WikiCommand({super.format, super.onOutput});

  @override
  String get name => 'wiki';

  @override
  String get description => 'Busca e exibe o resumo de um artigo na Wikipédia.';

  @override
  Future<void> execute(List<String> args) async {
    final artigo = args.isNotEmpty ? args.join(' ') : 'Dart_(linguagem_de_programação)';
    _log.info('Iniciando busca do artigo: "$artigo"');

    final url = Uri.parse(
      'https://pt.wikipedia.org/api/rest_v1/page/summary/${Uri.encodeComponent(artigo)}',
    );

    try {
      _log.fine('Enviando requisição GET para $url');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        _log.info('Resposta HTTP 200 recebida com sucesso.');
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
        _log.warning('Falha na resposta HTTP. Status Code: ${response.statusCode}');
        sendOutput('Erro HTTP ${response.statusCode}: Não foi possível obter o artigo.');
      }
    } catch (e, stackTrace) {
      _log.severe('Erro de conexão ao buscar artigo: $e', e, stackTrace);
      sendOutput('Erro de conexão ao executar comando: $e');
    }
  }
}
