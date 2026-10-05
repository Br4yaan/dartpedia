/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/wiki_command.dart
  Versão: 0.0.4
  Descritivo do Código:
    - Lição 06: Lançamento da exceção personalizada CommandException em caso de falha HTTP ou de conexão.
  ==============================================================
*/

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
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
  String get description => 'Busca e exibe o resumo de um artigo na Wikipédia.';

  @override
  Future<void> execute(List<String> args) async {
    final artigo = args.isNotEmpty ? args.join(' ') : 'Dart_(linguagem_de_programação)';
    _log.info('Iniciando busca do artigo: "$artigo"');

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
      } else if (response.statusCode == 404) {
        _log.warning('Artigo não encontrado: $artigo');
        throw CommandException('O artigo "$artigo" não foi encontrado na Wikipédia.', statusCode: 404);
      } else {
        _log.warning('Falha no servidor da Wikipédia. Status: ${response.statusCode}');
        throw CommandException(
          'Falha ao se comunicar com a Wikipédia. Tente novamente mais tarde.',
          statusCode: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      _log.severe('Erro de rede ao conectar à Wikipédia: $e');
      throw CommandException('Sem conexão com a internet. Verifique sua rede e tente novamente.');
    } on FormatException catch (e) {
      _log.severe('Erro de formatação JSON na resposta: $e');
      throw CommandException('Resposta inválida recebida do servidor da Wikipédia.');
    } catch (e) {
      if (e is CommandException) rethrow;
      _log.severe('Erro não mapeado: $e');
      throw CommandException('Ocorreu um erro inesperado ao processar o comando.');
    }
  }
}
