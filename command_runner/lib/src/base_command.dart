/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/base_command.dart
  Versão: 0.0.1
  Descritivo do Código:
    - Lição 08: Suporte ao callback 'onOutput' para manipulador de saída flexível.
  ==============================================================
*/

import 'command_type.dart';

typedef OutputHandler = void Function(String message);

abstract class BaseCommand {
  String get name;
  String get description;
  OutputFormat format;
  OutputHandler? onOutput;

  BaseCommand({this.format = OutputFormat.text, this.onOutput});

  /// Envia a mensagem para o callback customizado 'onOutput' ou utiliza o 'print' padrão.
  void sendOutput(String message) {
    if (onOutput != null) {
      onOutput!(message);
    } else {
      print(message);
    }
  }

  Future<void> execute(List<String> args);
}
