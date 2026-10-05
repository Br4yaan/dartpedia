/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: bin/dartpedia001.dart
  Versão: 0.0.18
  Descritivo do Código:
    - Lição 06: Captura elegante de exceções customizadas (CommandException) no ponto de entrada da CLI.
  ==============================================================
*/

import 'package:command_runner/command_runner.dart';

Future<void> main(List<String> arguments) async {
  AppLogger.setup();

  print('========== DARTPEDIA001 - Versão 0.0.18 =========='.green.bold);
  print('');

  final wikiCmd = WikiCommand(format: OutputFormat.text);
  final helpCmd = HelpCommand([wikiCmd]);

  try {
    if (arguments.contains('--help') || arguments.contains('-h')) {
      await helpCmd.execute(arguments);
    } else {
      await wikiCmd.execute(arguments);
    }
  } on CommandException catch (e) {
    print('Erro de Execução: ${e.message}'.red.bold);
    if (e.statusCode != null) {
      print('Código de Status: ${e.statusCode}'.yellow);
    }
  } catch (e, stackTrace) {
    print('Erro Inesperado: Ocorreu uma falha não tratada no sistema.'.red.bold);
    print('Detalhes técnicos: $e'.yellow);
  }
}
