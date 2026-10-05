/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: bin/dartpedia001.dart
  Versão: 0.0.13
  Descritivo do Código:
    - Lição 08: Integração de HelpCommand com StringBuffer e callback personalizado de saída onOutput.
  ==============================================================
*/

import 'package:command_runner/command_runner.dart';

Future<void> main(List<String> arguments) async {
  print('==================================================');
  print('          DARTPEDIA001 - Versão 0.0.13           ');
  print('==================================================\n');

  // Callback de saída flexível (onOutput)
  void customPrinter(String message) {
    print('[SAÍDA CLI]:\n$message');
  }

  final wikiCmd = WikiCommand(format: OutputFormat.text, onOutput: customPrinter);
  final helpCmd = HelpCommand([wikiCmd], onOutput: customPrinter);

  if (arguments.contains('--help') || arguments.contains('-h') || (arguments.isNotEmpty && arguments.first == 'help')) {
    await helpCmd.execute(arguments);
  } else {
    await wikiCmd.execute(arguments);
  }
}
