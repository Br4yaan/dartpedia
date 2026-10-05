/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/command_exception.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Lição 06: Exceção personalizada CommandException para tratamento estruturado de erros na CLI.
  ==============================================================
*/

class CommandException implements Exception {
  final String message;
  final int? statusCode;

  CommandException(this.message, {this.statusCode});

  @override
  String toString() {
    if (statusCode != null) {
      return 'CommandException (Código $statusCode): $message';
    }
    return 'CommandException: $message';
  }
}
