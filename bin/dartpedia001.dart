/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: bin/dartpedia001.dart
  Versão: 0.0.16
  Descritivo do Código:
    - Lição 07: Uso de extensões de String e cores no cabeçalho e mensagens da CLI.
  ==============================================================
*/

import 'package:command_runner/command_runner.dart';

Future<void> main(List<String> arguments) async {
  AppLogger.setup();

  final cabecalho = '========== DARTPEDIA001 - Versão 0.0.16 =========='.green.bold;
  print(cabecalho);
  print('');

  final wikiCmd = WikiCommand(format: OutputFormat.text);
  final helpCmd = HelpCommand([wikiCmd]);

  if (arguments.contains('--help') || arguments.contains('-h')) {
    await helpCmd.execute(arguments);
  } else {
    await wikiCmd.execute(arguments);
  }
}
