/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/wiki_command.dart
  Versão: 0.0.5
  Descritivo do Código:
    - Lição 09: Processamento de payload JSON via WikiArticleModel e Pattern Matching.
  ==============================================================
*/

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import '../../lib/src/wiki_article_model.dart';
import 'base_command.dart';
import 'command_exception.dart';
import 'command_type.dart';
import 'string_color_extension.dart';

class WikiCommand extends BaseCommand {
  final Logger _log = Logger('WikiCommand');

  WikiCommand({super.format, super.onOutput});

  @override
  String get name => 'wiki';

  @override
  String get description => 'Busca e exibe o resumo de um artigo na Wikipédia usando JSON e Pattern Matching.';

  @override
  Future<void> execute(List<String> args) async {
    final artigo = args.isNotEmpty ? args.join(' ') : 'Dart_(linguagem_de_programação)';
    _log.info('Iniciando requisição JSON para o artigo: "$artigo"');

    final url = Uri.parse(
      'https://pt.wikipedia.org/api/rest_v1/page/summary/${Uri.encodeComponent(artigo)}',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Uso da biblioteca dart:convert e Pattern Matching via WikiArticleModel
        final artigoModel = WikiArticleModel.parseRawJson(response.body);

        if (format == OutputFormat.json) {
          sendOutput(jsonEncode(artigoModel.toJson()));
        } else {
          final buffer = StringBuffer();
          final titulo = artigoModel.title.cyan.bold;
          final separador = '--------------------------------------------------'.blue;

          buffer.writeln(separador);
          buffer.writeln('  ARTIGO: $titulo');
          buffer.writeln(separador);
          buffer.writeln(artigoModel.extract);
          if (artigoModel.pageUrl != null) {
            buffer.writeln('\nURL: ${artigoModel.pageUrl}'.yellow);
          }
          buffer.writeln(separador);

          sendOutput(buffer.toString());
        }
      } else if (response.statusCode == 404) {
        throw CommandException('O artigo "$artigo" não foi encontrado na Wikipédia.', statusCode: 404);
      } else {
        throw CommandException('Falha ao obter artigo. Código HTTP: ${response.statusCode}', statusCode: response.statusCode);
      }
    } on SocketException {
      throw CommandException('Erro de conexão à internet.');
    } on FormatException catch (e) {
      throw CommandException('Erro ao processar estrutura JSON: ${e.message}');
    }
  }
}
