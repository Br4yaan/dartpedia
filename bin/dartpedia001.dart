/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: bin/dartpedia001.dart
  Versão: 0.0.14
  Descritivo do Código:
    - Lição 10: Validação da estrutura de testes e integração com o modelo WikiArticle.
  ==============================================================
*/

import 'package:command_runner/command_runner.dart';

Future<void> main(List<String> arguments) async {
  print('==================================================');
  print('          DARTPEDIA001 - Versão 0.0.14           ');
  print('==================================================\n');

  final wikiCmd = WikiCommand(format: OutputFormat.text);
  final helpCmd = HelpCommand([wikiCmd]);

  if (arguments.contains('--help') || arguments.contains('-h')) {
    await helpCmd.execute(arguments);
  } else {
    await wikiCmd.execute(arguments);
  }
}
