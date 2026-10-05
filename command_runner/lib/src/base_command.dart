/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/base_command.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Lição 05: Classe abstrata base para comandos da CLI (POO).
  ==============================================================
*/

import 'command_type.dart';

abstract class BaseCommand {
  String get name;
  String get description;
  OutputFormat format;

  BaseCommand({this.format = OutputFormat.text});

  /// Método abstrato que deve ser sobrescrito pelas classes filhas
  Future<void> execute(List<String> args);
}
