/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: bin/dartpedia001.dart
  Versão: 0.0.12
  Descritivo do Código:
    - Lição 05: Utilização de Orientação a Objetos (POO) com a classe WikiCommand e Enum OutputFormat.
  ==============================================================
*/

import 'package:command_runner/command_runner.dart';

Future<void> main(List<String> arguments) async {
  print('==================================================');
  print('          DARTPEDIA001 - Versão 0.0.12           ');
  print('==================================================\n');

  // Instancia o comando orientado a objetos
  final command = WikiCommand(format: OutputFormat.text);

  print('Comando: ${command.name.toUpperCase()}');
  print('Descrição: ${command.description}\n');

  // Executa o comando assíncrono sobrescrito
  await command.execute(arguments);
}
