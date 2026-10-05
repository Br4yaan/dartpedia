/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: bin/dartpedia001.dart
  Versão: 0.0.15
  Descritivo do Código:
    - Lição 12: Inicialização do sistema de logs (AppLogger) antes da execução dos comandos.
  ==============================================================
*/

import 'package:command_runner/command_runner.dart';

Future<void> main(List<String> arguments) async {
  // Inicializa o sistema de logs gravando em console e em app.log
  AppLogger.setup();

  print('==================================================');
  print('          DARTPEDIA001 - Versão 0.0.15           ');
  print('==================================================\n');

  final wikiCmd = WikiCommand(format: OutputFormat.text);
  final helpCmd = HelpCommand([wikiCmd]);

  if (arguments.contains('--help') || arguments.contains('-h')) {
    await helpCmd.execute(arguments);
  } else {
    await wikiCmd.execute(arguments);
  }
}
