/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: bin/dartpedia001.dart
  Versão: 0.0.19
  Descritivo do Código:
    - Lição 09: Integração com modelo de dados JSON e desestruturação via Pattern Matching.
  ==============================================================
*/

import 'package:command_runner/command_runner.dart';

Future<void> main(List<String> arguments) async {
  AppLogger.setup();

  print('========== DARTPEDIA001 - Versão 0.0.19 =========='.green.bold);
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
    print('Erro: ${e.message}'.red.bold);
  } catch (e) {
    print('Erro inesperado: $e'.red);
  }
}
