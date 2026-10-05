/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/wiki_command.dart
  Versão: 0.0.3
  Descritivo do Código:
    - Lição 07: Aplicação de saídas coloridas usando extensões em String na exibição de resumos.
  ==============================================================
*/

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'base_command.dart';
import 'command_type.dart';
import 'string_color_extension.dart';

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
    _log.info('Iniciando busca colorida do artigo: "$artigo"');

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
          final titulo = (data['title'] as String? ?? 'Sem Título').cyan.bold;
          final separador = '--------------------------------------------------'.blue;

          buffer.writeln(separador);
          buffer.writeln('  ARTIGO: $titulo');
          buffer.writeln(separador);
          buffer.writeln(data['extract'] ?? 'Nenhum resumo disponível.');
          buffer.writeln(separador);

          sendOutput(buffer.toString());
        }
      } else {
        sendOutput('Erro HTTP ${response.statusCode}: Não foi possível obter o artigo.'.red.bold);
      }
    } catch (e) {
      sendOutput('Erro de conexão ao executar comando: $e'.red);
    }
  }
}
