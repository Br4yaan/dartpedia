/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/console_color.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Lição 07: Enum aprimorado ConsoleColor com códigos de escape ANSI e métodos de formatação.
  ==============================================================
*/

enum ConsoleColor {
  red('\x1B[31m'),
  green('\x1B[32m'),
  yellow('\x1B[33m'),
  blue('\x1B[34m'),
  cyan('\x1B[36m'),
  bold('\x1B[1m'),
  reset('\x1B[0m');

  /// Código de escape ANSI correspondente
  final String code;

  const ConsoleColor(this.code);

  /// Aplica a cor ao texto informado e insere o caractere de reset ao final
  String apply(String text) {
    return '$code$text${ConsoleColor.reset.code}';
  }
}
